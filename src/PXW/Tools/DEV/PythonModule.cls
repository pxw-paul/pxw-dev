Class PXW.Tools.DEV.PythonModule Extends PXW.Tools.Page
{

Parameter ToolType = "Code";

ClassMethod WriteMainBody(ByRef scratch)
{
	Do ..HREFFrom(.cls,.debug)
    Set bookmark=""
    Set linenumber=""
	Do ..WriteClass(cls,debug,bookmark,linenumber,.scratch) 
	Quit
}

ClassMethod HREFFrom(Output Class As %String, Output Debug As %String)
{
	#define ReqGet(%name) %request.Get(%name)
	Set Class=$$$ReqGet("C")
    Set Debug=$$$ReqGet("DEBUG")
}

ClassMethod HREFTo(Class As %String) As %String
{
	Set href=##super()
	Set sep="&"
	Set href=href_sep_"C="_..EscapeURL(Class)
    Quit href
}

ClassMethod WriteClass(ClassName As %String, Debug As %String, bookMark As %String = "", hiliteLineNo As %Integer, ByRef scratch)
{
	New %path
	Kill %pxw1
	#dim ele,element as PXW.DEV.Element
	Set zh=$ZHOROLOG
    Set output=##class(PXW.Tools.DEV.HTML.bnf).%New()
	Set output.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%OpenId(%NS)

	Set showPaths=0
    Write "<pre>"
	If +Debug=1 $$$DEBUGNew(##class(PXW.Debuggers.Tools).%ClassName(1))
	If Debug["$TIME" $$$DEBUGNew(##class(PXW.Debuggers.Timing).%ClassName(1))
	If Debug["$FILE" $$$DEBUGNew(##class(PXW.Debuggers.BasicToFile).%ClassName(1)) 
	If Debug["$PATHS" Set showPaths=1,%path="" ; no need to set any output its just for tooltips
	
	;s sc=output.ClassServer.GetClassStudioText(ClassName,.text,.linesOfCode,.timestamp)
    Set pythonserver=##class(PXW.DEV.Dictionary.PythonObject).%OpenId(%NS)
    Set sc=pythonserver.GetModule(ClassName,.text,.linesOfCode,.lastUpdate)
	Set zh(1,"load")=$ZHOROLOG-zh,zh=$ZHOROLOG

	If $$$ISOK(sc) {
		If Debug'="" {
			; display the original text from the server
			Write "<pre>"
            Write "loaded",!
			;zw text,linesOfCode
			Set ln=""
			For  {
				Set ln=$ORDER(linesOfCode(ln))
				Quit:ln=""
				Write !,"<span class=nocopy>"_ln_":"_"</span>"_..EscapeHTML(linesOfCode(ln))
			}
			Write "</pre>"
		}
		Set zh(2,"display")=$ZHOROLOG-zh,zh=$ZHOROLOG

        Set element=##class(PXW.DEV.Element).%New()
		If Debug["$NEW" {
			Write "running in new mode"
        	;s x=##class(PXW.DEV.BNF.Run.ClassDefinitionAuto).%New()
		} Else {
			Set x=##class(PXW.DEV.BNF.Run.Python).%New()
		}
        Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
		Set zh=$ZHOROLOG

		Set output.This=ClassName
		Set output.HiLiteLine=hiliteLineNo
		Set output.BookMark=bookMark
		Set output.showPaths=showPaths
        Do output.begin()
		Set scratch=output
		Set zh(4,"render")=$ZHOROLOG-zh,zh=$ZHOROLOG

		Set element=##class(PXW.DEV.Element).%New()
        /*		while x.cheese(element) {
			;d element.write("")
			d output.middle(element)
			;zw output.Analyser
			s element=##class(PXW.DEV.Element).%New()
		}*/
        If x.File(element) {
        	If Debug["$OUTFILE" {
                $$$DEBUGNew(##class(PXW.Debuggers.BasicToFile).%ClassName(1)) 
                #dim deb as PXW.Debuggers.BasicToFile=%pxwdebug
                Do deb.UseFile() Do element.writeFull() Do deb.UseIO()
            }
            Do output.middle(element)
		    Do output.end()
        } Else {
            Write "Failed to parse",!
            Do element.write()
            Do output.middle(element)
    	    Do output.end()
        }

		Set zh(5,"render end")=$ZHOROLOG-zh,zh=$ZHOROLOG

		;Set xref=##class(PXW.Xref.Build).%New()
		;zw ClassName,timestamp
		;d xref.xrefClassIfNecessary(%NS,ClassName,timestamp,0,text)

		;Set zh(6,"xref")=$ZHOROLOG-zh,zh=$ZHOROLOG
		Kill element,x,output

	} Else {
		Do ..WriteStatus(sc)
		;s xref=##class(PXW.Xref.Build).%New()
		;d xref.xrefClassIfNecessary(ClassName,"",0)

	}
	If Debug["$TIME" {
		
		Set s="" For  Set s=$ORDER(%pxwstrings(s),1,n) Quit:s=""  Set %pxwstringsX(n,s)=""
		Write "<pre>" ZWrite %pxwstrings,%pxwstringsX,%pxw1,%RBCOUNT Write "</pre>"
		Set totaltime=0,totalcalls=0
		Set rs=##clasS(%Library.ResultSet).%New("PXW.Debuggers.Timing:SelectResults")
		$$$THROWONERROR(sc,rs.%Execute())
		&html<<table filename="Timings.csv">
			<tr><th>ClassName</th><th>MethodName</th><th>TotalTime</th><th>CountOfCalls</th><th>AverageTime</th><th>PercentageOfTime</th></tr>>
		While rs.%Next() {
			Set time=rs.Get("TotalTime"),totaltime=totaltime+time
			Set calls=rs.Get("CountOfCalls"),totalcalls=totalcalls+calls
			Write "<tr>"
			Write "<td>"_..EscapeHTML(rs.Get("ClassName"))_"</td>"
			Write "<td>"_"<a href='"_..HREFTo(rs.Get("ClassName"),rs.Get("MethodName"))_"'>"_..EscapeHTML(rs.Get("MethodName"))_"</a>"_"</td>"
			Write "<td style='text-align:right;'>"_$JUSTIFY(time,0,6)_"</td>"
			Write "<td style='text-align:right;'>"_calls_"</td>"
			Write "<td style='text-align:right;'>"_$JUSTIFY(rs.Get("AverageTime"),0,6)_"</td>"
			Write "<td style='text-align:right;'>"_$JUSTIFY(rs.Get("PercentageOfTime"),0,6)_"</td>"
			Write "</tr>",!
		}
		Write "<tr>"
		Write "<td>Total"_"</td>"
		Write "<td>"_"</td>"
		Write "<td style='text-align:right;'>"_$JUSTIFY(totaltime,0,6)_"</td>"
		Write "<td style='text-align:right;'>"_totalcalls_"</td>"
		Write "<td style='text-align:right;'>"_""_"</td>"
		Write "<td style='text-align:right;'>"_""_"</td>"
		Write "</tr>",!
		&html<</table>>
	} Else {
		;w "<pre>" zw %pxwstrings,%pxwstringsX,%pxw1 
		;w !,"$s="_$s
		;w "</pre>"
		
	}
	If Debug="$FILE" {
		ZWrite %pxwdebug
	}
	;d %session.EndSession()
	;zw zh
    Write "</pre>"
}

ClassMethod WriteNav(ByRef scratch)
{
	
	If $ISOBJECT($GET(scratch)) {
		Set output=scratch
		While output.NextIndexItemByName(.name,.type,.anchor,.error) {
				;w "<tr>"
				;w "<td>"
				If error="" {
					;w "<span class=toolsMainBodyNavItem>"
					Write "<a onclick='HiliteElement("""_anchor_"SPAN"");' class='"_"CDEF"_type_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
					;w "</span>"
				} Else {
					;w "<span class=toolsMainBodyNavItem>"
					Write "<a onclick='HiliteElement("""_anchor_"SPAN"");' class='"_output.#WarningClass_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
					;w "</span>"
				}
				;w "</td>"
				;w "<td>"_..EscapeHTML(type)_"</td>"
				;w "<td>"_..EscapeHTML(anchor)_"</td>"
				;w "</tr>",!
		}
		Write "<hr>"
	}
    Write "<a href=# onclick='MakeStringsInteresting(); '>Strings</a>"
}

/// Write out extra javascript here, the SCRIPT tags are already in place
ClassMethod WriteScripts() As %Status
{
	Write "function edit(clsname) {"
	Write " 	var editor=window.frames['editor'];",!
	Write "		debugger; ",!
	Write "		if (!editor) {",!
	Write "			editor=window.open('/cloudstudio/CloudStudio.PXW.cls?C='+clsname+'.cls','editor');",!
	Write "		}",!
	Write "",!
	Write "",!
	Write "",!
	Write "",!
	Write "",!
	Write "}",!

	Write "var hiliterun=1;"
	Write "function HiliteSets(id) {",!
	Write "    var objs=document.getElementsByTagName('span');",!
	Write "    var cls='hiliteSET'+hiliterun;",!
	Write "    var clsf='hiliteGET'+hiliterun;",!
	Write "    for (var i=0; i<objs.length; i++) {",!
	Write "      if (objs[i].getAttribute('varid')==id) objs[i].className=cls; //",! ;objs[i].className+' '+cls;",!
	Write "      if (objs[i].getAttribute('fetchid')==id) objs[i].className=clsf; //",! ;objs[i].className+' '+cls;",!
	Write "    }",!
	Write "    hiliterun=hiliterun+1; if (hiliterun>9) hiliterun=1;",!
	Write "}",!


	Write "function HiliteElement(id) {",!
	Write "    var obj=document.getElementById(id);",!
	Write "    obj.className='hilite';",!
	Write "}",!


	Write "function MakeStringsInteresting(id) {",!
	Write "    var objs=document.getElementsByTagName('span');",!
	Write "    var clsOFF='unInteresting'",!
	Write "    var clsHALF='quiteInteresting'",!
	Write "    var clsON='veryInteresting'",!
	Write "    for (var i=0; i<objs.length; i++) {",!
	Write "      if (objs[i].className=='EmbeddedPython') {",!
	Write "          objs[i].className=objs[i].className+' '+clsOFF; //",! ;objs[i].className+' '+cls;",!
	Write "      }",!
	Write "      if (objs[i].className=='COSString') {",!
	Write "          objs[i].className=objs[i].className+' '+clsON; //",! ;objs[i].className+' '+cls;",!
	Write "      }",!
	Write "      if (objs[i].className=='whitespace') {",!
	Write "          objs[i].className=objs[i].className+' '+clsHALF; //",! ;objs[i].className+' '+cls;",!
	Write "      }",!
	Write "    }",!
	Write "}",!


 /*
	write "function showUndefs() {",!
	write "		for (var s=0; s<document.styleSheets.length; s++) {",!
	write "			var ss=document.styleSheets[s];",!
	write "			var rules;",!
	write "			if (ss.rules) rules=ss.rules;",!
	write "			if (ss.cssRules) rules=ss.cssRules;",!
	write "			for (var r=0; r<rules.length; r++) {",!
	write "				var rule=rules[r];",!
	write "				if (rule.selectorText) {",!
	write "					if (rule.selectorText=='.unset') rule.style.backgroundColor='darkcyan';",!
	write "				}",!
	write "			}",!
	write "		}",!
	write "	}",!

	write "function showTypos() {",!
	write "		for (var s=0; s<document.styleSheets.length; s++) {",!
	write "			var ss=document.styleSheets[s];",!
	write "			var rules;",!
	write "			if (ss.rules) rules=ss.rules;",!
	write "			if (ss.cssRules) rules=ss.cssRules;",!
	write "			for (var r=0; r<rules.length; r++) {",!
	write "				var rule=rules[r];",!
	write "				if (rule.selectorText) {",!
	write "					if (rule.selectorText.indexOf('.typo')>-1) rule.style.backgroundColor='#F0E0C0';",!
	write "				}",!
	write "			}",!
	write "		}",!
	write "	}",!

	write "function showSubscripts() {",!
	write "		for (var s=0; s<document.styleSheets.length; s++) {",!
	write "			var ss=document.styleSheets[s];",!
	write "			var rules;",!
	write "			if (ss.rules) rules=ss.rules;",!
	write "			if (ss.cssRules) rules=ss.cssRules;",!
	write "			for (var r=0; r<rules.length; r++) {",!
	write "				var rule=rules[r];",!
	write "				if (rule.selectorText) {",!
	write "					if (rule.selectorText=='.subscript') rule.style.backgroundColor='pink';",!
	write "				}",!
	write "			}",!
	write "		}",!
	write "	}",!

	&js<
	function AutoIndent() {
		var objs=document.getElementsByTagName('span');
	    for (var i=0; i!=objs.length; i++) {
		    var indent=objs[i].getAttribute('indent');
		    if ((indent!='')&&(indent!=null)) {
			    var str="";
			    for (var j=0; j!=parseInt(indent); j++) str=str+"&nbsp;&nbsp;&nbsp;&nbsp;";
			    objs[i].innerHTML=str;
		    }
	    }
	}
	>
	*/
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.class)
	Set method=""
	If method'="" {
		Quit class_":"_method_""
	} Else {
		Quit class
	}
}

}
