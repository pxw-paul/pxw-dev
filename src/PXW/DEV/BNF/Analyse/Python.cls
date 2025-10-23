Include PXW.Debuggers.Macros

Class PXW.DEV.BNF.Analyse.Python Extends PXW.DEV.BNF.Analyse.analyser
{

Parameter CodeType = "CLS";

Parameter Language = "PYTHON";

/// Keep track of variable types passed in as parameters
/// ..ParameterVariables(varname)=type
Property ParameterVariables As %String [ MultiDimensional ];

Method Reset()
{
	Kill ..ParameterVariables
}

Method middle(element As PXW.DEV.Element)
{
 	Do ..checkElement(element)
}

Method IsParameterVariable(var As %String) As %Boolean
{
	If var="" Quit 0
	If $DATA(i%ParameterVariables(var)) Quit 1
	Quit 0
}

/// best to analyse the entire codeblock all at once.
Method checkElement(element As PXW.DEV.BNF.Elements.Python)
{
	#dim a as PXW.DEV.Atom

    If element.type="Param" {
        Set param=element.ToString(0)
        If param'="" Set ..ParameterVariables(param)=1
    }

	Set allAtOnce=1
	If allAtOnce {
		Set akey=""
		For  {
			Set a=element.partsGetNext(.akey)
			Quit:akey=""
			
			If a.%IsA("PXW.DEV.Element") {
				Do ..checkElement(a)
			} 
		}
	}
}

}
