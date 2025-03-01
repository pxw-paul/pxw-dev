Include PXW.Debuggers.Macros

Class PXW.Tools.Page Extends %CSP.Page
{

/// What type of tool this is:
/// Code tools are used for display/searching code
/// Internal tools are used for changing things about the tool itself
Parameter ToolType = "Internal";

/// Event handler for <b>PreHTTP</b> event: this is invoked before
/// the HTTP headers for a CSP page have been sent.  All changes to the
/// <class>%CSP.Response</class> class, such as adding cookies, HTTP headers,
/// setting the content type etc. must be made from within the OnPreHTTP() method.
/// Also changes to the state of the CSP application such as changing
/// %session.EndSession or %session.AppTimeout must be made within the OnPreHTTP() method.
/// It is prefered that changes to %session.Preserve are also made in the OnPreHTTP() method
/// as this is more efficient, although it is supported in any section of the page.
/// Return <b>0</b> to prevent <method>OnPage</method> from being called.
ClassMethod OnPreHTTP() As %Boolean [ ServerOnly = 1 ]
{
	#dim %request as %CSP.Request
	#dim %session as %CSP.Session
	#dim %response as %CSP.Response

	Set %NS=%request.Get("%NS","LOCAL_USER")
	Set style=%request.Get("%STYLE")
	Set:style="" style=%request.GetCookie("PXWSTYLE")
	Set:style="" style=$GET(^PXW("TOOLSv2","PXWSTYLE"))
	Set:style="" style="Basic"

	Set styleclass=style
	If styleclass'["." Set styleclass="PXW.Tools.Styles."_style
	Try {
		Set %STYLE=$SYSTEM.OBJ.New(styleclass)
	} Catch {
		Set %STYLE=##class(PXW.Tools.Styles.Basic).%New()
		Set style="Basic"
	}
	Set expires="Mon, 31 Dec 2035 12:00:00 GMT"
	Do %response.SetCookie("PXWSTYLE",style,expires)
	Quit 1
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom()
{
	;s Class=%request.Get("C")
}

/// This should return a string of the href to this page based on the input parameters
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
		<title>#(title)#</title>
	>

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

	Write "</script>",!
	
	&html<
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
		<!-- <div id=toolsMenu>
			<ul id=divMainMenuUL>
			</ul>
		</div>-->
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

/// use scratch to get anything you want to pass to the nav
ClassMethod WriteMainBody(ByRef scratch)
{
	Write $THIS
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
}

ClassMethod mainmenu()
{
	;	<li><a href=#(##class(DEV.PXW.NSchange).HREFto())#>#($g(%NS))#</a></li>
	;		#($s('TOOLSHELP:$s(..WriteMainMenuOptions():"",1:"WriteMainMenuOptions ERROR"),1:""))#
}

ClassMethod GetTitle() As %String
{
	Quit ..%ClassName(1)
}

/// Write out extra styles here, the STYLE tags are already in place
ClassMethod WriteStyles()
{
}

/// Write out extra javascript here, the SCRIPT tags are already in place
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

/// Calling page is passed in so you can decide what to display on the form/if anything.
ClassMethod WriteHeadForm(Page As %String)
{

	Quit
}

}
