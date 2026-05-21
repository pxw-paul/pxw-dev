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
		Set output.ThisType=..#CodeType
        Set output.BookMark=MacroToHilite
		Set output.Analyser=##class(PXW.DEV.BNF.Analyse.analyser).NewForLanguage(..#CodeType,"COS")
		Set output.Analyser.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)
		Set scratch=output
		If Debug="$PATHS" Set output.showPaths=1,%path=""

		Set element=##class(PXW.DEV.Element).%New()
        Set x=##class(PXW.DEV.BNF.Run.COS).%New()
        Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
	
		Try {
			;Set ok=x.CosCodeBlock(element)
			set ok=x.OneCosStatement(element)
			while ok {
				;If 'ok $$$ThrowStatus($$$ERROR(5001,"Could not parse"))
				Set x.element=element

				Do output.Analyser.checkElement(element)
				;W !,"------------",! D element.write()
				Do output.middle(element)
				Set element=##class(PXW.DEV.Element).%New()
				set ok=x.OneCosStatement(element)
			}
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
	Do ##class(PXW.Tools.DEV.Code).WriteCodeList("INC",Routine)
}

ClassMethod WriteNav(ByRef scratch)
{
	
	If $ISOBJECT($GET(scratch)) {
		Set output=scratch
		While output.NextIndexItemByName(.name,.type,.anchor,.error) {
				If error="" {
					Write "<a class='"_"CDEF"_type_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
				} Else {
					Write "<a class='"_$$$classWarning_"' href=#"_anchor_">"_..EscapeHTML(name)_"</a>"
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
	If Include'="" Set href=href_sep_"I="_$$$URLENCODE(Include)
    If CallingClass'="" Set href=href_sep_"CC="_$$$URLENCODE(CallingClass)
    If Macro'="" {
        If Macro?1"$$$".E {
            Set href=href_sep_"M="_$$$URLENCODE($PIECE(Macro,"$$$",2))
        } Else {
            Set href=href_sep_"M="_$$$URLENCODE(Macro)
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

ClassMethod WriteScripts()
{
	do ##class(PXW.Tools.DEV.Class).WriteScripts()
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
	do ##class(PXW.Tools.DEV.Class).WriteStyles()
}

}
