Class PXW.DEV.BNF.Format.SQLShowPlan Extends PXW.DEV.BNF.processor
{

property placeHolder as PXW.DEV.Element [multidimensional];

/// keyed by +element
property relocated as %Boolean [multidimensional];

method FormatElement(element as PXW.DEV.Element) {
    ; find all Call Module and Module definitions and copy the module to the end of the call
    Do ..formatProcess(element,"PASS1")
    ; now disconnect all the original modules from their content containers
    Do ..formatProcess(element,"PASS2")
}

Method formatProcess(element As PXW.DEV.Element,When as %String)
{
	$$$DEBUGMethodBegin
	Do ..processSpecificElement(element,When)
	Set partkey=""
	For  {
		Set part=element.partsGetNext(.partkey)
		Quit:partkey=""
		
		If part.IsElement {
			Do ..formatProcess(part,When)
		} 
	}
	$$$DEBUGMethodEnd
}



/// For each call module X, rememeber this is calling X
Method format1CallModules(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="CallModule,CallModules",When="PASS1")
{
    Do element.findElementsByType("ModuleName",.list,0)
    If $ISOBJECT(list) {
        For i=1:1:list.Count() {
            Set nameE=list.GetAt(i)
            If $ISOBJECT(nameE) {
                Set name=nameE.ToString(0)
                If name'="" {
                    Set ..placeHolder(name)=element
                }
            }
        }
    }
    Quit ""
}

Method format1CallSubqueries(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="CallSubquery,CallSubqueies",When="PASS1")
{
    Do element.findElementsByType("SubqueryName",.list,0)
    If $ISOBJECT(list) {
        For i=1:1:list.Count() {
            Set nameE=list.GetAt(i)
            If $ISOBJECT(nameE) {
                Set name=nameE.ToString(0)
                If name'="" {
                    Set ..placeHolder(name)=element
                }
            }
        }
    }
    Quit ""
}

/// When module X is reached, move it to the end of the place holder
Method format1Module(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ModuleSection",When="PASS1")
{
    #dim attE,nameE,locationE as PXW.DEV.BNF.Element
    Set modname=..GetAttributeValue(element,"name")
    If modname'="" {
        Set locationE=$GET(..placeHolder(modname))
        If $ISOBJECT(locationE) {
            Do locationE.AddPart(element)
            Set ..relocated(+element)=1
        }
    } Else {
    }
    Quit ""
}

/// When module X is reached, move it to the end of the place holder
Method format1Subquery(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="SubquerySection",When="PASS1")
{
    #dim attE,nameE,locationE as PXW.DEV.BNF.Element
    Set modname=..GetAttributeValue(element,"name")
    If modname'="" {
        Set locationE=$GET(..placeHolder(modname))
        If $ISOBJECT(locationE) {
            Do locationE.AddPart(element)
            Set ..relocated(+element)=1
        }
    } Else {
    }
    Quit ""
}



Method format2Content(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Content",When="PASS2")
{
    Set key=""
    For {
        Set modele=element.partsGetNext(.key)
        Quit:key=""
        If $ISOBJECT(modele), $GET(..relocated(+modele)) {
            If modele.type="ModuleSection" {
                 Do element.partsRemove(key)
            } ElseIf modele.type="SubquerySection" {
               Do element.partsRemove(key)
            }
        }
    }
    Quit ""
}



method GetAttributeValue(element As PXW.DEV.BNF.Element, name As %String) As %String
{
    Set key="",val=""
    For {
        Set attE=element.findNextElement(.key)
        Quit:key=""

        If attE.IsElement,$PIECE(attE.type,":",1)="Attribute" {
            Set nameE=attE.partsGetAt(1)
            Set valueE=attE.partsGetAt(3)
            If nameE.ToString(0)=name {
                Set val=valueE.ToString(0)
            }
        }
    }
    Set val=$TRANSLATE(val,"'""","") ; attribute values are wrapped in quotes
    Quit val
}

}
