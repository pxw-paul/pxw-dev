Class PXW.Tools.DEV.Class Extends PXW.Tools.DEV.CodeDisplayPage
{

Parameter CodeType = "CLS";

ClassMethod WriteMainBody(ByRef scratch)
{
	Do ..HREFFrom(.cls,.path,.instance,.linenumber,.debug,.PropertyParameter)
	If cls["*" Do ..WriteClassDir(cls) Quit

	Set ocls=..GetClassToLoad(cls,path,.bookmark,,.PropertyParameter)
	If ocls'=cls {
		Write "<p>Redirected from "_..EscapeHTML(cls)_"</p>"
	} 
	;zw ocls,debug,bookmark,linenumber
	Do ..WriteClass(ocls,debug,bookmark,linenumber,.scratch) 
	Quit
}

/// /
/// If this class does not have the definition of what we are looking at then this returns the name of the class it might be inherited from, otherwise it returns null
ClassMethod GetClassToLoad(cls As %String, path As %String, Output bookmark As %String, Output method As %String, PropertyParameter As %String = "") As %String
{
	Set ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)
	; table name?
	Set method=""
	If PropertyParameter'="" {
		If ClassServer.GetPropertyParameterDetails(cls,path,PropertyParameter,.ocls) {
			Set method=PropertyParameter
			Set bookmark=method
		}
	} ElseIf cls["_" {
		If path'="" {
			Do ClassServer.GetClassPathFromTable(cls,path,.array)
			Set ocls=$LISTGET(array(array),1),bookmark=$LISTGET(array(array),2)
			If ocls="" Set ocls=cls
		} Else {
			Set ocls=ClassServer.GetClassNameFromTableName(cls)
			If ocls'="" {
				Set bookmark=$PIECE(path,"->",*)
			}
			If ocls="" {
				Set ocls=ClassServer.GetClassNameFromStoredProc(cls,.method)
				If ocls'="" {
					Set bookmark=method
				}
			}
		}
	} Else {
		; remove unwanted gaps at the start
		While $EXTRACT(path,1)="." { Set path=$EXTRACT(path,2,*) }
		If path'="" {
			Do ClassServer.GetClassPath(cls,path,.array)
			Set ocls=$LISTGET(array(array),1),(bookmark,method)=$LISTGET(array(array),2)
			If ocls="" Set ocls=cls
		} Else {
			Set ocls=cls
			Set (bookmark,method)=$PIECE(path,".",*)
		}
		Set bookmark=$TRANSLATE(bookmark,"#","") ; remove # from parameter
	}
	
	; work out if its in a superclass              
	If method'="" {
		If ClassServer.GetMethodDetails(ocls,method,,.origin,.stub) {
			If stub'="" {
				If $PIECE(stub,".",*)="q" {
					; method belongs to a query
					Set (bookmark,method)=$PIECE(stub,".",1)
				} ElseIf $PIECE(stub,".",*)="a" {
					; method belongs to a property
					Set (bookmark,method)=$PIECE(stub,".",1)
				} ElseIf $PIECE(stub,".",*)="i" {
					; method belongs to an index
					Set (bookmark,method)=$PIECE(stub,".",1)
				}
			} 
			If origin'="" {
				Set ocls=origin
			}
		} ElseIf ClassServer.GetPropertyDetails(ocls,method,,,,.origin) {
			Set ocls=origin
		} ElseIf $EXTRACT(method,1)="#",ClassServer.GetParameterDetails(ocls,$EXTRACT(method,2,*),,.origin) {
			Set ocls=origin
		}
	}
	Quit ocls
}

/// s %NS="LOCAL_USER" d ##class(PXW.Tools.DEV.Class).WriteClass("%iKnow.Classification.UI.ClassifierBuilder",1,"",0,.s)
ClassMethod WriteClass(ClassName As %String, Debug As %String, bookMark As %String = "", hiliteLineNo As %Integer, ByRef scratch)
{
	New %path
	Kill %pxw1
	#dim ele,element as PXW.DEV.Element
	Set zh=$ZHOROLOG
    Set output=##class(PXW.Tools.DEV.HTML.bnf).%New()
	Set output.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)

	Set showPaths=0
    Write "<pre>"
	If +Debug=1 $$$DEBUGNew(##class(PXW.Tools.Debugger).%ClassName(1))
	;If Debug["$TIME" $$$DEBUGNew(##class(PXW.Debuggers.Timing).%ClassName(1))
	If Debug["$FILE" $$$DEBUGNew(##class(PXW.Debuggers.BasicToFile).%ClassName(1)) 
	If Debug["$PATHS" Set showPaths=1,%path="" ; no need to set any output its just for tooltips
	
	Set sc=output.ClassServer.GetClassStudioText(ClassName,.text,.linesOfCode,.timestamp)
	Set zh(1,"load")=$ZHOROLOG-zh,zh=$ZHOROLOG

	If $$$ISOK(sc) {
		If Debug'="" {
			; display the original text from the server
			Write "<pre>"
			;w text
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
			Set x=##class(PXW.DEV.BNF.Run.ClassDefinition).%New()
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
		While x.cheese(element) {
			;d element.write("")
			Do output.middle(element)
			;zw output.Analyser
			Set element=##class(PXW.DEV.Element).%New()
		}
		If 'x.stream.EOF() {
			Write "<span id='unfinishedParse'>"
			Do ..WriteStatus($$$ERROR(5001,"Not at end:line="_x.stream.line_":pos="_x.stream.pos_":lastPos="_x.stream.lastPos_":length="_x.stream.length_":"_$EXTRACT(x.stream.input,x.stream.pos,x.stream.lastPos)_"."))
			Write "</span>"
			Do output.AddToIndex(" Unfinished parse","ERROR","unfinishedParse")
			Do output.AddToIndexError(" Unfinished parse","Unfinished parsing")
		}

		Do output.end()

		Set zh(5,"render end")=$ZHOROLOG-zh,zh=$ZHOROLOG

		Do ##class(PXW.Xref.Build).Build(%NS,"CLS",ClassName)

		Set zh(6,"xref")=$ZHOROLOG-zh,zh=$ZHOROLOG
		Kill element,x,output

	} Else {
		Do ..WriteStatus(sc)
		Do ##class(PXW.Xref.Build).Build(%NS,"CLS",ClassName)
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
				If error="" {
					Write "<a onclick='HiliteElement("""_anchor_"SPAN"");' class='"_"CDEF"_type_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
				} Else {
					Write "<a onclick='HiliteElement("""_anchor_"SPAN"");' class='"_output.#ErrorClass_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
				}
		}
		Write "<hr>"
	}
    Write "<a href=# onclick='MakeStringsInteresting(); '>Strings</a>"
}

ClassMethod methodAName(Name As %String) As %String
{
	Quit "method"_Name
}

ClassMethod propertyAName(Name As %String) As %String
{
	Quit "property"_Name
}

ClassMethod HREFFrom(Output Class As %String, Output Path As %String, Output InstanceClass As %String, Output LineNumber As %Integer, Output Debug As %String, Output PropertyParameter As %String)
{
	#define ReqGet(%name) %request.Get(%name)
	Set Class=$$$ReqGet("C")
	Set Path=$$$ReqGet("P")
	Set InstanceClass=$$$ReqGet("I")
	Set LineNumber=$$$ReqGet("LN")
	Set Debug=$$$ReqGet("DEBUG")
	Set PropertyParameter=$$$ReqGet("PP")
}

/// Class=name of base class to display
/// Path=name of properties/methods to follow (eg .race.circuit.name)
/// Caller class is the class that is being displayed (not the class of my code doing the call)
/// PropertyParameter is the name of the parameter from the property definition (eg property x as %String(XMLNAME=xxx); - "XMLNAME" will be in PP)
ClassMethod HREFTo(Class As %String, Path As %String = "", LineNumber As %Integer = "", NameSpace As %String = "", CallerClass As %String = "", PropertyParameter As %String = "") As %String
{
	If NameSpace'="",$DATA(%NS) Set ons=%NS
	Set href=##super()
	If $DATA(ons) Set %NS=ons
	Set sep="&"
	
	Set cls=Class,instance=""

	Set package=""
	If CallerClass'="" Set package=$PIECE(CallerClass,".",1,*-1)

	Set cls=##class(PXW.DEV.Dictionary.ClassDefinitionObject).FullClassName(cls,package)

	Set href=href_sep_"C="_..EscapeURL(cls),sep="&"
	If instance'="" Set href=href_sep_"I="_..EscapeURL(instance),sep="&"
	If LineNumber'="" Set href=href_sep_"LN="_..EscapeURL(LineNumber),sep="&"
	If PropertyParameter'="" Set href=href_sep_"PP="_..EscapeURL(PropertyParameter),sep="&"
	Set href=href_sep_"P="_..EscapeURL(Path),sep="&"

	; must go last
	; always put the bookmark on, because the link to stored procedures is not working correctly yet
	Set href=href_"#bookmark"
	; do not add anything here
	Quit href
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.class,.name,,,,.pp)

	Set class=..GetClassToLoad(class,name,,.method,pp)

	If method'="" {
		Quit class_":"_method_""
	} Else {
		Quit class
	}
}

ClassMethod WriteClassDir(Class As %String)
{
	ZWrite %NS,Class
	Set ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%OpenId(%NS)
	Set rs=ClassServer.ListClassDetailsWild(Class,1)

	Write "<table>"
	Write "<thead>"
	Write "<tr><th>Type</th><th>Name</th><th>Modified</th></tr>"
	Write "</thead><tbody>"
	While rs.%Next() {
		Write "<tr>"
		Write "<td>"_..EscapeHTML(rs.%Get("ClassType"))_"</td>"
		Write "<td>"
			Write "<a class='CDEFClassName' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.%Get("Name"))_"'>"
			Write ..EscapeHTML(rs.%Get("Name")) 
			Write "</a>"
		Write "</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("TimeChanged"))_"</td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
}

/// Write out extra javascript here, the SCRIPT tags are already in place
ClassMethod WriteScripts()
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
	Write "      if (objs[i].className=='EmbeddedCOS') {",!
	Write "          objs[i].className=objs[i].className+' '+clsOFF; //",! ;objs[i].className+' '+cls;",!
	Write "      }",!
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

}
