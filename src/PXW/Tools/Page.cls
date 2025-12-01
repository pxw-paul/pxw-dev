Include PXW.Debuggers.Macros

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
///  write "<a href='"_##class(PXW.Tools.DEV.Class).HREFTo("PXW.Tools.Page")_"'>Tools</a>"
/// </example>
/// </p>
Class PXW.Tools.Page Extends %CSP.Page
{

/// What type of tool this is:
/// Code tools are used for display/searching code
/// Internal tools are used for changing things about the tool itself
Parameter ToolType = "Internal";

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
	
	set defaultDefault="Hip"

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
		Set %STYLE=##class(PXW.Tools.Styles.Basic).%New()
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
		<title>#(title)#</title>>

	; overall style

	Do %STYLE.WriteStyles()

	; styles for this page
	Write "<style>"
	Do ..WriteStyles()
	Write "</style>",!

	Write "<script language=javascript>",!
	Do ..WriteScripts()
	
	Write "function HiliteElement(id) {",!
	Write "    var obj=document.getElementById(id);",!
	Write "    obj.className='hilite';",!
	Write "}",!


	Write "/*****************************************************************/",!
	Write "/// Any tables with a filename attribute is downloadable",!
	Write "/// eg: <table filename='download'>",!
	Write "function makeTablesExportable() {",!
	Write "    var elements=document.getElementsByTagName('TABLE');",!
	Write "    for (var e=elements.length-1; e>-1; e--) {",!
	Write "      var table=elements[e];",!
	Write "      var filename=table.getAttribute('filename');",!
	Write "      if (filename!=null) {",!
	Write "          var tid=table.id;",!
	Write "          if (tid=='') {",!
	Write "              tid='table'+e;",!
	Write "              table.id=tid;",!
	Write "          }",!
	Write "          var bc=document.createElement(""button"");",!
	Write "          bc.textContent=""download csv"";",!
	Write "          bc.setAttribute('pxwFile',filename);",!
	Write "          bc.setAttribute('pxwTable',tid);",!
	Write "          bc.className='noPrint';",!
	Write "          bc.addEventListener('click',exportButtonEventCSV);",!
	Write "          table.appendChild(bc);",!
	Write "      }",!
	Write "   }",!
	Write "}",!
	Write " ",!
	Write " ",!
	Write "function exportButtonEventCSV() {",!
	Write "  var file=this.getAttribute('pxwFile');",!
	Write "  var tid=this.getAttribute('pxwTable');",!
	Write "  var table=document.getElementById(tid)",!
	Write "  htmlToCSV(table,file+"".csv"");",!
	Write "}",!
	Write " ",!
	Write "",!
	Write "function htmlToCSV(table, filename) {",!
	Write "  var q = String.fromCharCode(34);",!
	Write "  var tab = "",""; //String.fromCharCode(9);",!
	Write "  var cr=""\n"";",!
	Write "  var data = [];",!
	Write "  var rows = table.querySelectorAll(""tr"");",!
	Write " ",!
	Write "  for (var i = 0; i < rows.length; i++) {",!
	Write "     var row = [], cols = rows[i].querySelectorAll(""td, th"");",!
	Write "     for (var j = 0; j < cols.length; j++) {",!
	Write "        //var str=cols[j].innerText;",!
	Write "        var str=cols[j].textContent;",!
	Write "        var esc=str.replace(/""/g,'""""');",!
	Write "        if (esc.includes(tab) || esc.includes(cr)) {",!
	Write "            esc='""'+esc+'""';",!
	Write "         }",!
	Write "         row.push(esc);",!
	Write "     }",!
	Write "     data.push(row.join(tab));",!
	Write "   }",!
	Write "   downloadCSVFile(data.join(""\n""), filename);",!
	Write "}",!
	Write " ",!
	Write "function downloadCSVFile(csv, filename) {",!
	Write "  var csv_file, download_link;",!
	Write "   csv_file = new Blob([csv], {type: ""text/csv""});",!
	Write "   download_link = document.createElement(""a"");",!
	Write "   download_link.download = filename;",!
	Write "   download_link.href = window.URL.createObjectURL(csv_file);",!
	Write "   download_link.style.display = ""none"";",!
	Write "   document.body.appendChild(download_link);",!
	Write "   download_link.click();",!
	Write "}",!
	Write " ",!
	Write "/*****************************************************************/",!	
	Write "function bodyonload() {",!
	Write "   var nav=document.getElementById('toolsMainBodyNav');",!
	Write "   var tmp=document.getElementById('toolsMainBodyNavTEMP');",!
	Write "   nav.innerHTML=tmp.innerHTML;",!
	Write "   makeTablesExportable();",!
	;                                                          #($s(..WriteBodyOnLoad():"",1:"WriteBodyOnLoad ERROR"))#
	Write "}",!

	&JS<
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

	Write "</script>",!
	
	&html<
	</head>
	<body  onload='bodyonload();'>
		<header id=toolsHead>
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
		<div id=toolsTitle>
			<h1>#(title)#</h1>
		</div>
	>
	Write "<div id=toolsMainBody><div id=toolsMainBodyContainer>"
	Write "<div id=toolsMainBodyNav> waiting" 
		; empty for now
	Write "</div>"
	Write "<main id=toolsMainBodyContent>"
	Write "<div id="_$TRANSLATE(..%ClassName(1),".","")_">" ; div for setting up style for specific functions
	Try {
		Do ..WriteMainBody(.scratch)
	} Catch e {
		Do ..WriteStatus(e.AsStatus())
	}
	Write "</div>" ; function specific
	Write "</main>" ; content
	Write "<div id=toolsMainBodyNavTEMP>" 
	Write "<nav>"
		Do ..WriteNav(.scratch) ; this is called AFTER the main body so that the main body could build some sort of index from the content
		               ; but the styling will probably put it BEFORE the content on screen
	Write "</nav>"
	Write "</div>" ; nav
	Write "</div></div>" ; conainer mainbody

	&html<<div id=toolsFooter>
				<span id=toolsFooterDTH>datetimeh=#($HOROLOG)#</span> 
				<span id=toolsFooterDT>datetime=#($ZDATETIME($HOROLOG,3))#</span> 
				<span id=toolsFooterTIM>processtime=#($ZHOROLOG-zh)#</span> 
				<span id=toolsFooterPID>$job=#($JOB)#</span>
				<span id=toolsFooterMEM>$s=#(startmem-$STORAGE)#</span>
			</div>>
	&html<</body></html>>
	Quit $$$OK
}

ClassMethod OLDOnPage() As %Status
{
	Set startmem=$STORAGE
	#dim e as %Exception.SystemException
	Set zh=$ZHOROLOG
	Set title=..GetTitle()	
	&html<<html>
	<head>
		<title>#(title)#</title>>

	; overall style

	Do %STYLE.WriteStyles()

	; styles for this page
	Write "<style>"
	Do ..WriteStyles()
	Write "</style>",!

	Write "<script language=javascript>",!
	Do ..WriteScripts()
	
	Write "function HiliteElement(id) {",!
	Write "    var obj=document.getElementById(id);",!
	Write "    obj.className='hilite';",!
	Write "}",!


	Write "/*****************************************************************/",!
	Write "/// Any tables with a filename attribute is downloadable",!
	Write "/// eg: <table filename='download'>",!
	Write "function makeTablesExportable() {",!
	Write "    var elements=document.getElementsByTagName('TABLE');",!
	Write "    for (var e=elements.length-1; e>-1; e--) {",!
	Write "      var table=elements[e];",!
	Write "      var filename=table.getAttribute('filename');",!
	Write "      if (filename!=null) {",!
	Write "          var tid=table.id;",!
	Write "          if (tid=='') {",!
	Write "              tid='table'+e;",!
	Write "              table.id=tid;",!
	Write "          }",!
	Write "          var bc=document.createElement(""button"");",!
	Write "          bc.textContent=""download csv"";",!
	Write "          bc.setAttribute('pxwFile',filename);",!
	Write "          bc.setAttribute('pxwTable',tid);",!
	Write "          bc.className='noPrint';",!
	Write "          bc.addEventListener('click',exportButtonEventCSV);",!
	Write "          table.appendChild(bc);",!
	Write "      }",!
	Write "   }",!
	Write "}",!
	Write " ",!
	Write " ",!
	Write "function exportButtonEventCSV() {",!
	Write "  var file=this.getAttribute('pxwFile');",!
	Write "  var tid=this.getAttribute('pxwTable');",!
	Write "  var table=document.getElementById(tid)",!
	Write "  htmlToCSV(table,file+"".csv"");",!
	Write "}",!
	Write " ",!
	Write "",!
	Write "function htmlToCSV(table, filename) {",!
	Write "  var q = String.fromCharCode(34);",!
	Write "  var tab = "",""; //String.fromCharCode(9);",!
	Write "  var cr=""\n"";",!
	Write "  var data = [];",!
	Write "  var rows = table.querySelectorAll(""tr"");",!
	Write " ",!
	Write "  for (var i = 0; i < rows.length; i++) {",!
	Write "     var row = [], cols = rows[i].querySelectorAll(""td, th"");",!
	Write "     for (var j = 0; j < cols.length; j++) {",!
	Write "        //var str=cols[j].innerText;",!
	Write "        var str=cols[j].textContent;",!
	Write "        var esc=str.replace(/""/g,'""""');",!
	Write "        if (esc.includes(tab) || esc.includes(cr)) {",!
	Write "            esc='""'+esc+'""';",!
	Write "         }",!
	Write "         row.push(esc);",!
	Write "     }",!
	Write "     data.push(row.join(tab));",!
	Write "   }",!
	Write "   downloadCSVFile(data.join(""\n""), filename);",!
	Write "}",!
	Write " ",!
	Write "function downloadCSVFile(csv, filename) {",!
	Write "  var csv_file, download_link;",!
	Write "   csv_file = new Blob([csv], {type: ""text/csv""});",!
	Write "   download_link = document.createElement(""a"");",!
	Write "   download_link.download = filename;",!
	Write "   download_link.href = window.URL.createObjectURL(csv_file);",!
	Write "   download_link.style.display = ""none"";",!
	Write "   document.body.appendChild(download_link);",!
	Write "   download_link.click();",!
	Write "}",!
	Write " ",!
	Write "/*****************************************************************/",!	
	Write "function bodyonload() {",!
	Write "   var nav=document.getElementById('toolsMainBodyNav');",!
	Write "   var tmp=document.getElementById('toolsMainBodyNavTEMP');",!
	Write "   nav.innerHTML=tmp.innerHTML;",!
	Write "   makeTablesExportable();",!
	;                                                          #($s(..WriteBodyOnLoad():"",1:"WriteBodyOnLoad ERROR"))#
	Write "}",!

	&JS<
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

	Write "</script>",!
	
	&html<
	</head>
	<body  onload='bodyonload();'>
		<div id=toolsHead>
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
		</div>
		<div id=toolsTitle>
			<h1>#(title)#</h1>
		</div>
	>
	Write "<div id=toolsMainBody><div id=toolsMainBodyContainer>"
	Write "<div id=toolsMainBodyNav> waiting" 
		; empty for now
	Write "</div>"
	Write "<div id=toolsMainBodyContent>"
	Write "<div id="_$TRANSLATE(..%ClassName(1),".","")_">" ; div for setting up style for specific functions
	Try {
		Do ..WriteMainBody(.scratch)
	} Catch e {
		Do ..WriteStatus(e.AsStatus())
	}
	Write "</div>" ; function specific
	Write "</div>" ; content
	Write "<nav id=toolsMainBodyNavTEMP>" 
	Try {
		Do ..WriteNav(.scratch)
		; this is called AFTER the main body so that the main body could build some sort of index from the content
		; but the styling/javascript will probably put it BEFORE the content on screen
	} Catch e {
		Do ..WriteStatus(e.AsStatus())
	}		
	Write "</nav>"
	Write "</div></div>" ; conainer mainbody

	&html<<div id=toolsFooter>
				<span id=toolsFooterDTH>datetimeh=#($HOROLOG)#</span> 
				<span id=toolsFooterDT>datetime=#($ZDATETIME($HOROLOG,3))#</span> 
				<span id=toolsFooterTIM>processtime=#($ZHOROLOG-zh)#</span> 
				<span id=toolsFooterPID>$job=#($JOB)#</span>
				<span id=toolsFooterMEM>$s=#(startmem-$STORAGE)#</span>
			</div>>
	&html<</body></html>>
	Quit $$$OK
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
			Set alink="<a class='COSLabel' href='"_##class(PXW.Tools.DEV.Routine).HREFTo(caller)_"'>"_..EscapeHTML(caller)_"</a>"
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
