Include (PXW.Debuggers.Macros, PXW.Tools.Styles.macros)

/// <h2>The base page for all PXW Tools.</h2>
/// 
/// <p>
/// It sets up the overall look of each page. This is not an application that has
/// a static page and loads data into it. All pages are created from scratch every time.
/// This makes thing more simple for me. 
/// </p><p>
/// Override the Write* methods to insert into HTML into the page.
/// </p><p>
/// Override the HREFTo method so that tools can get a HREF TO a page:
/// <example>
///  ; create a link to the class display page to display this class
///  write "<a href="""_##class(PXW.Tools.DEV.Class).HREFTo("PXW.Tools.Page")_""">Tools</a>"
/// </example>
/// </p>
Class PXW.Tools.Page Extends %CSP.Page
{

/// What type of tool this is:
/// Code tools are used for display/searching code
/// Internal tools are used for changing things about the tool itself
Parameter ToolType = "Internal";

/// The name of the tool on the main home page (index).
/// If the tool does not have a name then it does not appear on the index page by default.
Parameter ToolName;

/// This sets up some floating % variables that can be accessed at any time.
/// <ul>
/// <li>%NS is the currently selected Namespace.</li>
/// <li>%STYLE is the currently selected Style.</li>
/// </ul>
ClassMethod OnPreHTTP() As %Boolean [ ServerOnly = 1 ]
{
	#dim %request as %CSP.Request
	#dim %session as %CSP.Session
	#dim %response as %CSP.Response
	
	set defaultDefault="Dark"

	Set %NS=%request.Get("%NS","LOCAL_USER")
	Set style=%request.Get("%STYLE")
	Set:style="" style=%request.GetCookie("PXWSTYLE")
	Set:style="" style=$GET(^PXW("TOOLSv2","PXWSTYLE"))
	Set:style="" style=defaultDefault

	Set styleclass=style
	If styleclass'["." Set styleclass="PXW.Tools.Styles."_style
	Try {
		Set %STYLE=$SYSTEM.OBJ.New(styleclass)
	} Catch {
		Set %STYLE=##class(PXW.Tools.Styles.Dark).%New()
		Set style=defaultDefault
	}
	set %STYLENAME=style
	Set expires="Mon, 31 Dec 2035 12:00:00 GMT"
	Do %response.SetCookie("PXWSTYLE",style,expires)
	Quit 1
}

/// This should output some variables, getting the data from %request.
/// It should match HREFTo.
ClassMethod HREFFrom()
{
	;s Class=%request.Get("C")
}

/// This should return a string of the href to this page based on the input parameters.
/// There is a convention used that each parameter of this method should 
/// add a parameter to the URL using only the capital letters of the parameter, 
/// this is only so that we can build a simple form generate page.
/// <example>
/// ClassMethod HREFTo(ClassName as %String,Method as %String) as %String
/// {
///   set href=##super()
///   set href=href_"&CN="_..EscapeURL(ClassName)
///   set href=href_"&M="_..EscapeURL(Method)
///   quit href
/// }
/// </example>
ClassMethod HREFTo() As %String
{
	Set href=..%ClassName(1)_".cls"
	Set sep="?"
	Set href=href_sep_"%NS="_..EscapeURL($GET(%NS,"LOCAL_USER")),sep="&"
	;s href=href_sep_"C="_..EscapeURL(cls),sep="&"
	Quit href
}

ClassMethod OnPage() As %Status
{

	Set startmem=$STORAGE
	#dim e as %Exception.SystemException
	Set zh=$ZHOROLOG
	Set title=..GetTitle()	
	&html<<html>
		<head>
			<title>#($g(%NS)_" "_title)#</title>
			#(..PageStyle())#
			<script language=javascript>
				#(..PageScripts())#
			</script>
		</head>
		<body  onload='bodyonload();'>
			#(..PageHead())#
			<div id=toolsTitle>
				<h1>#(title)#</h1>
			</div>
			#(..PageMain())#
			<div id=toolsFooter>
					<span id=toolsFooterDTH>datetimeh=#($HOROLOG)#</span> 
					<span id=toolsFooterDT>datetime=#($ZDATETIME($HOROLOG,3))#</span> 
					<span id=toolsFooterTIM>processtime=#($ZHOROLOG-zh)#</span> 
					<span id=toolsFooterPID>$job=#($JOB)#</span>
					<span id=toolsFooterMEM>$s=#(startmem-$STORAGE)#</span>
			</div>
		</body>
	</html>>
	Quit $$$OK
}

ClassMethod PageScripts()
{
	#dim err as %Exception.SystemException
	s lt="<",gt=">"
	&js<function HiliteElement(id) {
	    var obj=document.getElementById(id);
	    obj.className='hilite';
	}
	>

	&js<
	/*****************************************************************/
	/// Any tables with a filename attribute is downloadable
	/// eg: <table filename='download'>
	function makeTablesExportable() {
	    var elements=document.getElementsByTagName('TABLE');
	    for (var e=elements.length-1; e#(gt)#-1; e--) {
	      var table=elements[e];
	      var filename=table.getAttribute('filename');
	      if (filename!=null) {
	          var tid=table.id;
	          if (tid=='') {
	              tid='table'+e;
	              table.id=tid;
	          }
	          var bc=document.createElement("button");
	          bc.textContent="download csv";
	          bc.setAttribute('pxwFile',filename);
	          bc.setAttribute('pxwTable',tid);
	          bc.className='noPrint';
	          bc.addEventListener('click',exportButtonEventCSV);
	          table.appendChild(bc);
	      }
	   }
	}
	 	
	function exportButtonEventCSV() {
	  var file=this.getAttribute('pxwFile');
	  var tid=this.getAttribute('pxwTable');
	  var table=document.getElementById(tid)
	  htmlToCSV(table,file+".csv");
	}
	 
	
	function htmlToCSV(table, filename) {
		var q = String.fromCharCode(34);
		var tab = ","; //String.fromCharCode(9);
		var cr="\n";
		var data = [];
		var rows = table.querySelectorAll("tr");
		
		for (var i = 0; i #(lt)# rows.length; i++) {
			var row = [], cols = rows[i].querySelectorAll("td, th");
			for (var j = 0; j #(lt)# cols.length; j++) {
				//var str=cols[j].innerText;
				var str=cols[j].textContent;
				var esc=str.replace(/"/g,'""');
				if (esc.includes(tab) || esc.includes(cr)) {
					esc='"'+esc+'"';
				}
				row.push(esc);
			}
			data.push(row.join(tab));
		}
		downloadCSVFile(data.join("\n"), filename);
	}
	
	 
	function downloadCSVFile(csv, filename) {
	  var csv_file, download_link;
	   csv_file = new Blob([csv], {type: "text/csv"});
	   download_link = document.createElement("a");
	   download_link.download = filename;
	   download_link.href = window.URL.createObjectURL(csv_file);
	   download_link.style.display = "none";
	   document.body.appendChild(download_link);
	   download_link.click();
	}
	 
	/*****************************************************************/	
	function bodyonload() {
	//   var nav=document.getElementById('toolsMainBodyNav');
	//   var tmp=document.getElementById('toolsMainBodyNavTEMP');
	//   nav.innerHTML=tmp.innerHTML;
	   makeTablesExportable();

	}
	
	function fallbackCopyTextToClipboard(text) {
		var textArea = document.createElement("textarea");
		textArea.value = text;
		
		// Avoid scrolling to bottom
		textArea.style.top = "0";
		textArea.style.left = "0";
		textArea.style.position = "fixed";

		document.body.appendChild(textArea);
		textArea.focus();
		textArea.select();

		try {
			var successful = document.execCommand('copy');
			var msg = successful ? 'successful' : 'unsuccessful';
			console.log('Fallback: Copying text command was ' + msg);
		} catch (err) {
			console.error('Fallback: Oops, unable to copy', err);
		}

		document.body.removeChild(textArea);
	}
	function copyTextToClipboard(text) {
		if (!navigator.clipboard) {
			fallbackCopyTextToClipboard(text);
			return;
		}
		navigator.clipboard.writeText(text).then(function() {
			console.log('Async: Copying to clipboard was successful!');
		}, function(err) {
			console.error('Async: Could not copy text: ', err);
		});
	}
	>

	Do ..WriteScripts()

	quit ""
}

ClassMethod PageHead() As %String
{
	&html<
		<div id=toolsHead>
			<header>
				<div id=toolsForms>
					<form id=toolsFormHome action='PXW.Tools.Index.cls'>
						<fieldset id=toolsHome>
						<legend>Home</legend>
							<input type=hidden name=%NS value='#(%NS)#'>
							<input type=submit value='Home'>
						</fieldset>
					</form>
					<form target=_blank id=toolsFormHome action='PXW.Tools.Index.cls'>
						<fieldset id=toolsHome>
						<legend>Home</legend>
							<input type=hidden name=%NS value='#(%NS)#'>
							<input type=submit value='+'>
						</fieldset>
					</form>
					#(..WriteHeadForms())#
				</div>
			</header>
		</div>
	>
	quit ""
}

ClassMethod PageMain() As %String
{
	#dim e as %Exception.SystemException

	Write "<div id=toolsMainBodyContent>"
	Write "<main>"
	Write "<div id="_$TRANSLATE(..%ClassName(1),".","")_">" ; div for setting up style for specific functions
	Try {
		Do ..WriteMainBody(.scratch)
	} Catch e {
		Do ..WriteStatus(e.AsStatus())
	}
	Write "</div>" ; function specific
	write "</main>"
	Write "</div>" ; content
	Write "<div id=toolsMainBodyNav>" 
	Write "<nav>"
		Do ..WriteNav(.scratch) ; this is called AFTER the main body so that the main body could build some sort of index from the content
				               ; but the styling will probably put it BEFORE the content on screen
	Write "</nav>"
	Write "</div>" ; nav
	Quit ""
}

/// This controls the layout of the whole page, setting up the main grid etc based on PageBody and PageMain divs.
/// Not much in the way of colour defined here, its just about the shape of the page.
/// Change colours using %STYLE.
ClassMethod PageStyle() As %String
{
	&html<<style>
		/* https://www.w3schools.com/css/css3_box-sizing.asp */
		* {
 			box-sizing: border-box;
		}
		body {
			border:0; margin:0; padding:0; 
			height: 100%; 
			display: grid; 
			grid-template-areas:
				'toolsHead toolsHead'
				'toolsTitle toolsTitle'
				'toolsMainBodyNav toolsMainBodyContent'
				'toolsFooter toolsFooter';
			grid-template-columns: #(" minmax(15%, auto) ")# #("1fr")#;
			grid-template-rows: auto auto #("1fr")# auto;
			grid-column-gap: 0;
			grid-row-gap: 0;			
		} 
		#toolsHead { grid-area:toolsHead; }
		#toolsHead form { display:inline; margin: 0px; padding:0px; border:0px; }
		#toolsHead form fieldset { display:inline; }

		#toolsForms { }

		#toolsTitle { grid-area:toolsTitle; }

		#toolsMainBodyNav { grid-area:toolsMainBodyNav; overflow:auto }
		#toolsMainBodyNav a { width: 100%; display: block;}


		#toolsMainBodyContent { grid-area:toolsMainBodyContent; 
								overflow:auto; 
								scroll-padding-top:4rem; }

		#toolsFooter { grid-area:toolsFooter;}
		
		#toolsMainBodyNavTEMP {  display:none; }

		#toolsMainTLR {
			height:100%;
			display: grid;
			grid-template-areas:
				'toolsMainTop toolsMainTop'
				'toolsMainLeft toolsMainRight'
				'toolsMainFoot toolsMainFoot';
			grid-template-columns: auto auto;
			grid-template-rows: auto #("1fr")# auto;
			grid-column-gap: 1em;
			grid-row-gap: 1em;
		}

		#toolsMainTLR div { width:100%; }

		#toolsMainTop {
			grid-area: toolsMainTop; 
			scroll-padding-top: 4rem;
		}

		#toolsMainLeft {
			grid-area: toolsMainLeft;
			overflow:auto;
			resize:horizontal;
		}
		#toolsMainLeft div { width:100%; }

		#toolsMainRight {
			grid-area: toolsMainRight;
			overflow:auto;
		}
		#toolsMainRight div { width:100%; }

		#toosMainFoot {
			grid-area: toolsMainFoot;
		}

		.nocopy	{
			-webkit-user-select: none;
			-khtml-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			-o-user-select: none;
			user-select: none;
		}

		.unInteresting {
			-webkit-user-select: none;
			-khtml-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			-o-user-select: none;
			user-select: none;
		}
		.quiteInteresting {
			-webkit-user-select: text;
			-khtml-user-select: text;
			-moz-user-select: text;
			-ms-user-select: text;
			-o-user-select: text;
			user-select: text;
		}
		.veryInteresting {
			-webkit-user-select: text;
			-khtml-user-select: text;
			-moz-user-select: text;
			-ms-user-select: text;
			-o-user-select: text;
			user-select: text;
			font-weight:bold; font-size:1.1em;
		}
	</style>>

	Do %STYLE.WriteStyles()
	; styles for this page
	Write "<style>"
		Do ..WriteStyles()
	Write "</style>",!

	quit ""
}

/// use scratch to get anything you want to pass to the nav.
ClassMethod WriteMainBody(ByRef scratch)
{
	Write $THIS
}

/// Output 1 Anchor tag for each option in the navigation. 
/// Use the scratch variable for anything you want to get from BODY.
ClassMethod WriteNav(ByRef scratch)
{
}

ClassMethod GetTitle() As %String
{
	Quit ..%ClassName(1)
}

/// Write out extra styles here, the STYLE tags are already in place.
/// <p>
/// Be careful with putting colours in here. You do not know how the colours will 
/// work with the current %STYLE selected by the user.
/// </p><p> 
/// You can put layout changing things here, EG if a page needs extra DIVs
/// the layout information can go here. 
/// </p>
ClassMethod WriteStyles()
{
}

/// Write out extra javascript here, the SCRIPT tags are already in place.
ClassMethod WriteScripts()
{
}

ClassMethod WriteStatus(sc As %Status)
{
	New %NS Set %NS="LOCAL_USER" ; default error back home
    If $$$ISOK(sc) {
        Write "OK"
    } Else {
        Do $SYSTEM.Status.DecomposeStatus(sc,.err)
		;w "<pre>" zw err w "</pre>"
        ;s code=$g(err(1,"code"))
        Set caller=$GET(err(1,"caller"))
        Set txt=..EscapeHTML(err(1))
        If caller'="" {
			Set alink="<a class='"_$$$classLabel_"' href="""_##class(PXW.Tools.DEV.Routine).HREFTo(caller)_""">"_..EscapeHTML(caller)_"</a>"
            If txt[caller {
				Set txt=$REPLACE(txt,caller,alink)
			} Else {
				Set txt=txt_" goto: "_alink
			}
        } 
        Write "<pre style='color:red;'>" Write txt Write "</pre>"	
    }
}

/// Find any page that inserts a form into the header.
ClassMethod WriteHeadForms() As %String
{
	Set rs=##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	$$$THROWONERROR(sc,rs.Execute(##class(PXW.Tools.Page).%ClassName(1)))
	
	While rs.Next() {
		Set name=rs.Data("Name")
		Set headform=##class(%Dictionary.MethodDefinition).%OpenId(name_"||WriteHeadForm")
		If $ISOBJECT(headform) {
			Set order=$SELECT(name?1"PXW.Tools"1.E:1,1:2)
			Set index(order,name)=name
		}
	}
	Set k1="",k2=""
	For  {
		Set k1=$ORDER(index(k1))
		Quit:k1=""

		For  {
			Set k2=$ORDER(index(k1,k2),1,name)
			Quit:k2=""
			
			Do $CLASSMETHOD(name,"WriteHeadForm",..%ClassName(1))
		}
	}
	Quit ""
}

/// Override this method to insert a form onto the header of the page.
/// Calling page is passed in so you can decide what to display on the form/if anything.
ClassMethod WriteHeadForm(Page As %String)
{
	Quit
}

}
