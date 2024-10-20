Class PXW.Tools.DEV.Routine Extends PXW.Tools.DEV.CodeDisplayPage
{


Parameter CodeType="INT";


ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.rtn,.lbl,.plus,.debug)
	If rtn["*" Do ..WriteRoutineDir(rtn) Quit

	
	Do ..WriteRoutine(rtn,lbl,plus,.debug)
}

ClassMethod WriteRoutine(Routine As %String, Label As %String = "", Plus As %String = "", Debug As %String = "")
{
	If $PIECE(Routine,".",*)="INT" Set Routine=$PIECE(Routine,".",1,*-1)

	Set zh=$ZHOROLOG
	Set sc=##class(PXW.DEV.Dictionary.Routine).GetRoutineStudioText(Routine,.text,.linesOfCode)
	Set zh(1)=$ZHOROLOG-zh,zh=$ZHOROLOG
	If $$$ISOK(sc) {
		;s parser=##class(PXW.DEV.ClassDefinition.Parser).NewFromString(text)

		Write "<pre>"
		Set output=##class(PXW.Tools.DEV.HTML.bnf).%New()
		Set output.HiliteLabel=Label
		Set output.HilitePlus=Plus

		If Debug="$PATHS" Set output.showPaths=1

		Set element=##class(PXW.DEV.Element).%New()
        Set x=##class(PXW.DEV.BNF.Run.COS).%New()
        Set x.stream=##class(PXW.DEV.InputStream).NewString(text) 
		Set zh(2)=$ZHOROLOG-zh,zh=$ZHOROLOG
		Try {
			Set ok=x.CosCodeBlock(element)
			If 'ok $$$ThrowStatus($$$ERROR(5001,"Could not parse"))
			Set zh(3)=$ZHOROLOG-zh,zh=$ZHOROLOG
			Set x.element=element

			Set zh(4)=$ZHOROLOG-zh,zh=$ZHOROLOG
			Do output.middle(element)
			Set zh(5)=$ZHOROLOG-zh,zh=$ZHOROLOG

		} Catch e {
			Do ..WriteStatus(e.AsStatus())
		}
		ZWrite zh
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
	Set rs=##class(PXW.DEV.Dictionary.Routine).ListRoutines(rtn,escape)
	 
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
}

ClassMethod HREFTo(Routine As %String) As %String
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
ClassMethod WriteScripts() As %Status
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

/// Write out extra styles here, the STYLE tags are already in place
ClassMethod WriteStyles() As %Status
{
	;.block { background-color:#f0f0f0; }
	;.comment { color:green; }
 	;.comment .typo { background:none; }
 	;.description { border:1px dotted green; color:black; margin-left:50px; }
	;.description .html { color:black; }
	;.description .typo { background-color:#FFEECC; }
	;.error { background-color:red; color:white; }
	;.endofsection { border-bottom:1px dotted silver; width:100%; }
	;.external { font-weight:bold; }
	;.fetch { cursor:pointer; }
	;PRE.formattedtext { white-space: pre-wrap;       /* css-3 */
	;				white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
 	;				white-space: -pre-wrap;      /* Opera 4-6 */
 	;				white-space: -o-pre-wrap;    /* Opera 7 */
 	;				word-wrap: break-word;       /* Internet Explorer 5.5+ */
	;			}
	;A.global:visited { color:red; }
	;.global { color:red; }
	;.hiddennew { display:none; }
	&html<
	.hiliteSET { background-color:lightgreen; }
	.hiliteSET1 { background-color:#EFEF00; } /* don't like this (numbers on each class) but cant get .parameters .parameters selector to work */
	.hiliteSET2 { background-color:#DF00DF; }
	.hiliteSET3 { background-color:#00CFCF; }
	.hiliteSET4 { background-color:#BFBF00; }
	.hiliteSET5 { background-color:#AF00AF; }
	.hiliteSET6 { background-color:#009F9F; }
	.hiliteSET7 { background-color:#8F8F00; }
	.hiliteSET8 { background-color:#7F007F; }
	.hiliteGET1 { background-color:#FEFFBF; } /* don't like this (numbers on each class) but cant get .parameters .parameters selector to work */
	.hiliteGET2 { background-color:#FFBFFE; } /* colours by http://www.2createawebsite.com/build/hex-colors.html */
	.hiliteGET3 { background-color:#BFFFFE; }
	.hiliteGET4 { background-color:#FEFFBF; }
	.hiliteGET5 { background-color:#FFBFFE; }
	.hiliteGET6 { background-color:#BFFFFE; }
	.hiliteGET7 { background-color:#FEFFBF; }
	.hiliteGET8 { background-color:#FFBFFE; }
	>
	;.html { color:darkgreen; }
	;.html .tag { color:purple; }
	;.html .comment { color:darkgreen; font-style:italic;}
	;.html .cos { color:black; }
	;.html .typo { background-color:#FFEECC; }
	;.KILL { font-weight:bold; }
	;.known { cursor:hand; }
	;.label { color:blue; }
	;.line { }
	;.macro { color:darkblue; }
	;.MERGE { font-weight:bold; }
	;.method { border-top:1px dotted silver; margin-top:20px; }
	;.method .description { color:#006000; margin-left:50px; }
	;.notcalled { color:#8080ff; }
	;.pattern { color:darkorange; }
	;.postconditional { background-color:#e8e8e8; }
	;.SET { font-weight:bold; }
	;.sql { color:darkcyan; }
	;.string { color:purple; }
	;.string .typo { background-color:#FFEECC; }
	;.subscript { }
	;.unknownclass { background-color:#FFDDDD; }
	;.unnewed { /* background-color:cyan;*/ }
	;.unset { /* background-color:cyan;*/ }
	
	;.formalspectable { width:100%; font-size:0.75em; }
	;.formalspectable td { border-bottom:1px solid black; width:33%; white-space:pre; }

	/*.parameters:hover { border:1px dotted black; }*/
	/* these need to be here (rather than in my preferred alphabetical order) because the .typo thing
	   has to come after the typo one above */
	;.parameters1:hover { background-color:#EFEFFF; } /* don't like this but cant get .parameters .parameters selector to work */
	;.parameters1:hover .typo { background-color:transparent; }
	;.parameters2:hover { background-color:#DFFFDF; }
	;.parameters3:hover { background-color:#FFCFCF; }
	;.parameters4:hover { background-color:#BFBFFF; }
	;.parameters5:hover { background-color:#AFFFAF; }
	;.parameters6:hover { background-color:#FF9F9F; }
	;.parameters7:hover { background-color:#8F8FFF; }
	;.parameters8:hover { background-color:#7FFF7F; }
	
	;pre.example {
    ;	border: 1px solid black;
    ;	font-family: courier new,courier,monospace;
    ;	text-align: left;
    ;	margin-top: 5px;
    ;	margin-bottom: 5px;
    ;	padding-left: 10px; padding-top: 0px; padding-bottom: 0px;
	;	background: #F0F0F0; 
	;	overflow-x: auto;
    ;}

 	;.tabledescription { }
	;.tabledescription .html { color:black; }
	;.tabledescription .typo { background-color:#FFEECC; }
}

}
