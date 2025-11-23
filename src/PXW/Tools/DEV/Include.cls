Class PXW.Tools.DEV.Include Extends PXW.Tools.DEV.CodeDisplayPage
{

Parameter CodeType = "INC";

ClassMethod WriteMainBody(ByRef scratch)
{
	Do ..HREFFrom(.inc,.cc,.macro,.debug)

	If inc["*" Do ..WriteIncludeDir(inc) Quit
    If inc="",cc'="" {
		Set inc=..GetIncludeFileName(.macro)
    }
    If inc'="" {
	    Do ..WriteInclude(inc,macro,debug,.scratch)
    }
}

ClassMethod GetIncludeFileName(Output macroname) As %String
{
	Do ..HREFFrom(.inc,.cc,.macroname)
    If inc="",cc'="" {
        Set cs=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)
		Set macroname=$PIECE(macroname,"(",1)
		If macroname?1"$$$" Set macroname=$PIECE(macroname,"$$$",2)
        If cs.GetMacroLocation(cc,macroname,.inc,.line) {
            ;w !,"Macro "_macro_" for "_cc_" found "_inc
            If $PIECE(inc,".",*)="inc" Set inc=$PIECE(inc,".",1,*-1)
        } Else {
        }
    }
	Quit inc
}

ClassMethod WriteInclude(Include As %String, MacroToHilite As %Integer = "", Debug As %String, ByRef scratch)
{
	New %path
	If $PIECE(Include,".",*)="INC" Set Include=$PIECE(Include,".",1,*-1)

	Set sc=##class(PXW.DEV.Dictionary.Include).GetIncludeStudioText(Include,.text,.linesOfCode)
	If $$$ISOK(sc) {
		;s parser=##class(PXW.DEV.ClassDefinition.Parser).NewFromString(text)

		Write "<pre>"
		Set output=##class(PXW.Tools.DEV.HTML.bnf).%New()
		Set output.This=Include
		Set output.ThisType="INC"
        Set output.BookMark=MacroToHilite
		; we can attempt to analyse as if it was COS (in a CLS type bit of code)
		Set output.Analyser=##class(PXW.DEV.BNF.Analyse.analyser).NewForLanguage("CLS","COS")
		Set output.Analyser.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)
		Set scratch=output
		If Debug="$PATHS" Set output.showPaths=1,%path=""

		Set element=##class(PXW.DEV.Element).%New()
        Set x=##class(PXW.DEV.BNF.Run.COS).%New()
        Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
		Try {
			Set ok=x.CosCodeBlock(element)
			If 'ok $$$ThrowStatus($$$ERROR(5001,"Could not parse"))
			Set x.element=element

			Do output.Analyser.checkElement(element)

			Do output.middle(element)
	
		} Catch e {
			Do ..WriteStatus(e.AsStatus())
		}
		;zw zh
		Write "</pre>"
	} Else {
		Do ..WriteStatus(sc)
	}
}

ClassMethod WriteIncludeDir(Routine As %String)
{
	; if the input contains % then escape it
	Set rtn=Routine,escape=""
	Set rs=##class(PXW.DEV.Dictionary.Include).ListIncludes(rtn,escape)
	 
	Write "<table>"
	Write "<thead>"
	Write "<tr><th>Type</th><th>Name</th><th>Modified</th></tr>"
	Write "</thead><tbody>"
	While rs.%Next() {
		Write "<tr>"
		Write "<td>"_..EscapeHTML(rs.%Get("Lang"))_"</td>"
		Write "<td>"
			Write "<a class='COSObjectsClass' href='"_##class(PXW.Tools.DEV.Include).HREFTo(rs.%Get("Name"))_"'>"
			Write ..EscapeHTML(rs.%Get("Name")) 
			Write "</a>"
		Write "</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("Date"))_"</td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
}

ClassMethod WriteNav(ByRef scratch)
{	
	If $ISOBJECT($GET(scratch)) {
		Set output=scratch
		While output.NextIndexItemByName(.name,.type,.anchor,.error) {
				If error="" {
					Write "<a class='"_"CDEF"_type_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
				} Else {
					Write "<a class='"_output.#WarningClass_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
				}
		}
		Write "<hr>"
	}
    Write "<span class=button href=# onclick='MakeStringsInteresting(); '>Strings</span>"
}

ClassMethod HREFTo(Include As %String = "", CallingClass As %String = "", Macro As %String = "") As %String
{
	Set href=##super()
	Set sep="&"
	If Include'="" Set href=href_sep_"I="_..EscapeURL(Include)
    If CallingClass'="" Set href=href_sep_"CC="_..EscapeURL(CallingClass)
    If Macro'="" {
        If Macro?1"$$$".E {
            Set href=href_sep_"M="_..EscapeURL($PIECE(Macro,"$$$",2))
        } Else {
            Set href=href_sep_"M="_..EscapeURL(Macro)
        }
    }

	; must go last
	If Macro'="" Set href=href_"#BookMark"
	Quit href
}

ClassMethod HREFFrom(Output Include As %String, Output CallingClass As %String, Output Macro As %String, Output Debug As %String)
{
	Set Include=%request.Get("I")
	Set CallingClass=%request.Get("CC")
	Set Macro=%request.Get("M")
	Set Debug=%request.Get("DEBUG")
}

ClassMethod GetTitle() As %String
{
	Set inc=..GetIncludeFileName(.macro)
	Set inc=inc_".INC"
	If $GET(macro)'="" Set inc=inc_":"_macro
	Quit inc
}

}
