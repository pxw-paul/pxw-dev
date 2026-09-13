Class PXW.DEV.BNF.Analyse.analyser Extends PXW.DEV.BNF.processor
{

Parameter CodeType;

Parameter Language;

/// Name of the class being analysed
Property This As %String;

/// Name of the method being analysed
Property ThisMethod As %String;

/// Warnings assigned to elements
/// ..ElementWarnings(+elementid)="text of the warning"
Property ElementWarnings As %String [ MultiDimensional ];

Method checkElement(element As PXW.DEV.Element)
{
	#dim a as PXW.DEV.Atom

	Do ..processSpecificElement(element)

	Set akey=""
	For  {
		Set part=element.partsGetNext(.akey)
		Quit:akey=""
		
		If part.IsElement {
			Do ..checkElement(part)
		} 
	}
}

Method AddElementWarning(element As PXW.DEV.Element, text As %String)
{
	; errors will be reported on atoms
	Set a=element.FirstAtom()
	If $ISOBJECT(a) {
		Set ..ElementWarnings(+a)=$GET(..ElementWarnings(+a))_text_" "
	}
}

ClassMethod RegisterType() As %Status
{
    Set sc=$$$OK 
    Set codetypes=..#CodeType
    If codetypes'="" {
		For i=1:1:$LENGTH(codetypes,",") {
			Set codetype=$PIECE(codetypes,",",i)
			Set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.CodeTypeIndex).RegisterType("Analyse:"_..#Language,codetype,..%ClassName(1))
		}
    }
    Quit sc
}

ClassMethod NewForLanguage(CodeType As %String, Language As %String) As PXW.DEV.BNF.Analyse.analyser
{
	#dim obj as PXW.DEV.BNF.Analyse.analyser
	Set obj=##class(PXW.DEV.Dictionary.CodeTypeIndex).NewClassForUsage("Analyse:"_Language,CodeType)
	Quit obj
}

}
