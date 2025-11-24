Class PXW.Tools.DEV.MAC Extends PXW.Tools.DEV.CodeDisplayPage
{

Parameter CodeType = "MAC";

ClassMethod WriteMainBody(ByRef scratch)
{
	Do ..HREFFrom(.rtn,.lbl,.plus,.debug)
	If rtn["*" Do ..WriteRoutineDir(rtn) Quit

	
	Do ..WriteRoutine(rtn,lbl,plus,.debug,.scratch)
}

ClassMethod WriteRoutine(Routine As %String, Label As %String = "", Plus As %String = "", Debug As %String = "", Output scratch)
{
	If $PIECE(Routine,".",*)="MAC" Set Routine=$PIECE(Routine,".",1,*-1)

	Set zh=$ZHOROLOG
    set server=##class(PXW.DEV.Dictionary.MAC).OpenNamespace(%NS)
	Set sc=server.GetRoutineStudioText(Routine,.text,.linesOfCode)
	Set zh(1)=$ZHOROLOG-zh,zh=$ZHOROLOG
	If $$$ISOK(sc) {
		;s parser=##class(PXW.DEV.ClassDefinition.Parser).NewFromString(text)

		Write "<pre>"
		Set output=##class(PXW.Tools.DEV.HTML.bnf).%New()
		Set output.HiliteLabel=Label
		Set output.HilitePlus=Plus
		Set scratch=output
		If Debug="$PATHS" Set output.showPaths=1

		Set element=##class(PXW.DEV.Element).%New()
        Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
        Set parser.stream=##class(PXW.DEV.InputStream).NewString(text) 
		Set zh(2)=$ZHOROLOG-zh,zh=$ZHOROLOG
		Try {
			Set ok=parser.CosCodeBlock(element)
			If 'ok $$$ThrowStatus($$$ERROR(5001,"Could not parse"))
			Set zh(3)=$ZHOROLOG-zh,zh=$ZHOROLOG
			Set parser.element=element

			Set zh(4)=$ZHOROLOG-zh,zh=$ZHOROLOG
			Do output.middle(element)
			Set zh(5)=$ZHOROLOG-zh,zh=$ZHOROLOG
			If 'parser.stream.EOF() {
				Write "<span id='unfinishedParse'>"
				Do ..WriteStatus($$$ERROR(5001,"Not at end:line="_x.stream.line_":pos="_x.stream.pos_":lastPos="_x.stream.lastPos_":length="_x.stream.length_":"_$EXTRACT(x.stream.input,x.stream.pos,x.stream.lastPos)_"."))
				Write "</span>"
				Do output.AddToIndex(" Unfinished parse","ERROR","unfinishedParse")
				Do output.AddToIndexError(" Unfinished parse","Unfinished parsing")
			}

		} Catch e {
			Do ..WriteStatus(e.AsStatus())
		}
		;ZWrite zh
		Write "</pre>"
	} Else {
		Do ..WriteStatus(sc)
	}
}

ClassMethod WriteRoutineDir(Routine As %String)
{
	; if the input contains % then escape it
	Set rtn=Routine,escape=""
	/*i rtn["%" {
		s escape="\"
		s cls=$replace(cls,"%",escape_"%")
	}
	i cls["_" {
		s escape=$g(escape,"\")
		s cls=$replace(cls,"_",escape_"_")
	}
	s cls=$replace(cls,"*","%") ; make the selection a LIKE compatible thing
	*/
	/*Set rs=##class(PXW.DEV.Dictionary.Routine).ListRoutines(rtn,escape)
	 
	Write "<table>"
	Write "<thead>"
	Write "<tr><th>Type</th><th>Name</th><th>Modified</th></tr>"
	Write "</thead><tbody>"
	While rs.%Next() {
		Write "<tr>"
		Write "<td>"_..EscapeHTML(rs.%Get("Lang"))_"</td>"
		Write "<td>"
			Write "<a class='COSObjectsClass' href='"_##class(PXW.Tools.DEV.Routine).HREFTo(rs.%Get("Name"))_"'>"
			Write ..EscapeHTML(rs.%Get("Name")) 
			Write "</a>"
		Write "</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("Date"))_"</td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
	*/
	Do ##class(PXW.Tools.DEV.Code).WriteCodeList("MAC",Routine)
}

ClassMethod HREFTo(Routine As %String = "") As %String
{
	Set href=##super()

	Set rtn=Routine,lbl="",plus=""
	If Routine["^" {
		Set rtn=$PIECE(Routine,"^",2)
		Set labelplus=$PIECE(Routine,"^",1)
		Set lbl=$PIECE(labelplus,"+",1)
		Set plus=$PIECE(labelplus,"+",2)
	}

	Set sep="&"
	Set href=href_sep_"R="_..EscapeURL(rtn)
	If lbl'="" Set href=href_sep_"L="_..EscapeURL(lbl)
	If plus'="" Set href=href_sep_"P="_..EscapeURL(plus)
	If lbl'="" Set href=href_"#Bookmark"
	Quit href
}

ClassMethod HREFToK123(Routine As %String, Label As %String = "", LineNumber As %Integer = "") As %String
{
	If Label'="" {
		Set href=..HREFTo(Label_"^"_Routine)
	} Else {
		Set href=..HREFTo(Routine)
	}
	Quit href
}

ClassMethod HREFFrom(Output Routine As %String, Output Label As %String, Output Plus As %String, Output Debug As %String)
{
	Set Routine=%request.Get("R")
	Set Label=%request.Get("L")
	Set Plus=%request.Get("P")
	Set Debug=%request.Get("DEBUG")
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.rtn)
	Quit rtn
}

/// Write out extra javascript here, the SCRIPT tags are already in place
ClassMethod WriteScripts()
{
	Write "var hiliterun=1;"
	Write "function HiliteSets(id) {",!
	Write "    var objs=document.getElementsByTagName('span');",!
	Write "    var cls='hiliteSET'+hiliterun;",!
	Write "    var clsf='hiliteGET'+hiliterun;",!
	Write "    for (var i=0; i<objs.length; i++) {",!
	Write "      if (objs[i].getAttribute('varid')==id) objs[i].className=cls; //",! ;objs[i].className+' '+cls;",!
	Write "      if (objs[i].getAttribute('fetchid')==id) objs[i].className=clsf; //",! ;objs[i].className+' '+cls;",!
	Write "    }",!
	Write "    hiliterun=hiliterun+1; if (hiliterun>8) hiliterun=1;",!
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

}
