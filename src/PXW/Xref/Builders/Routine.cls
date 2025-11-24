Class PXW.Xref.Builders.Routine Extends PXW.Xref.Builders.Class
{

Parameter CodeType = "INT";

Method Build(Namespace As %String, ItemKey1 As %String, PreLoadedText As %String = "") As %Status
{
	#dim ele as PXW.DEV.Element
	
	Set sc=$$$OK

    Set ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(Namespace)
	Set text=PreLoadedText

    Do ClassServer.CacheClearClassDetails(ItemKey1,1) ; pretend the class is deleted so that it REALLY clears it

	If $$$ISOK(sc) {
        set ..Analyser=##class(PXW.DEV.BNF.Analyse.analyser).NewForLanguage("CLS","COS")
 		Set ..ClassServer=ClassServer
        Set ..CalledByClassName=ItemKey1
		Try {
			Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
  		    Set parser.stream=##class(PXW.DEV.InputStream).NewString(text)
  			
			Set element=##class(PXW.DEV.Element).%New()
			if parser.CosCodeBlock(element) {
   				Do ..xrefElement(element)
   				If ..ERROR'="" $$$ThrowStatus($$$ERROR(5001,..ERROR))
				Set element=##class(PXW.DEV.Element).%New()
			}
			If 'parser.stream.EOF() Set sc=$$$ERROR(5001,"Not at end:"_parser.stream.line_":"_x.stream.pos_":"_parser.stream.length_":"_$EXTRACT(parser.stream.input,parser.stream.lastPos,parser.stream.lastPos+20))
		} Catch e {
			Set sc=e.AsStatus()
		}
	}
	Quit sc
}

}
