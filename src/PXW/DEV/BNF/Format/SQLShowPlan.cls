Class PXW.DEV.BNF.Format.SQLShowPlan Extends PXW.DEV.BNF.processor
{

property placeHolder as PXW.DEV.Element [multidimensional];

/// keyed by +element
property relocated as %Boolean [multidimensional];

method FormatElement(element as PXW.DEV.Element) {
    ; find all Call Module and Module definitions and copy the module to the end of the call
    do ..formatProcess(element,"PASS1")
    ; now disconnect all the original modules from their content containers
    do ..formatProcess(element,"PASS2")
}

Method formatProcess(element As PXW.DEV.Element,When as %String)
{
	$$$DEBUGMethodBegin
	do ..processSpecificElement(element,When)
	set partkey=""
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
    do element.findElementsByType("ModuleName",.list,0)
    if $isobject(list) {
        for i=1:1:list.Count() {
            s nameE=list.GetAt(i)
            if $isobject(nameE) {
                set name=nameE.ToString(0)
                if name'="" {
                    set ..placeHolder(name)=element
                }
            }
        }
    }
    Quit ""
}

Method format1CallSubqueries(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="CallSubquery,CallSubqueies",When="PASS1")
{
    do element.findElementsByType("SubqueryName",.list,0)
    if $isobject(list) {
        for i=1:1:list.Count() {
            s nameE=list.GetAt(i)
            if $isobject(nameE) {
                set name=nameE.ToString(0)
                if name'="" {
                    set ..placeHolder(name)=element
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
        set locationE=$g(..placeHolder(modname))
        if $ISOBJECT(locationE) {
            do locationE.AddPart(element)
            set ..relocated(+element)=1
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
        set locationE=$g(..placeHolder(modname))
        if $ISOBJECT(locationE) {
            do locationE.AddPart(element)
            set ..relocated(+element)=1
        }
    } Else {
    }
    Quit ""
}



Method format2Content(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Content",When="PASS2")
{
    set key=""
    for {
        set modele=element.partsGetNext(.key)
        q:key=""
        if $isobject(modele), $g(..relocated(+modele)) {
            if modele.type="ModuleSection" {
                 do element.partsRemove(key)
            } elseif modele.type="SubquerySection" {
               do element.partsRemove(key)
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
