Class PXW.DEV.BNF.Compilers.projection Extends %Projection.AbstractProjection
{

/// Name of the class that should be generated
Parameter GenerateTo;

/// Name of the class that should be generated using new compiler
Parameter GenerateToNew;

/// So you can edit the projection easily to turn off generate
Parameter oGenerateTo;

/// So you can edit the projection easily to turn off generate
Parameter oGenerateToNew;

/// This method is invoked when a class is compiled
ClassMethod CreateProjection(cls As %String, ByRef params As %String) As %Status
{
    Set genclass=$GET(params("GenerateTo"),"UNDEF")
    If genclass="UNDEF" Quit $$$ERROR(5001,"GenerateTo parameter is not set")
 
    If genclass'="UNDEF" {
        If genclass'="" {
            If '$GET(^PXW.DEV.BNF("AUTOCOMPILE")) {
                Write !,"AUTOCOMPILE is OFF, Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("""_cls_""","""_genclass_""") " ;  manually"
                Set sc=$$$OK
            } Else {
                Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload(cls,genclass)
            }
        } Else {
            Set sc=$$$OK
        }
    }
    Quit sc
}

}
