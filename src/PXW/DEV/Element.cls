/// The base class for groups of atoms that make up an element.
/// Elements can be subclassed to store extra data. 
Class PXW.DEV.Element Extends PXW.DEV.Particle
{

/// This needs to be set to the name of the Base class
/// EG for COS it should be set to PXW.DEV.COS.Element
/// nothing that extends COS should override this parameter
Parameter Base = "PXW.DEV.Element";

Property type As %String [ InitialExpression = {$ZCONVERT($CLASSNAME(),"U")} ];

/// property parts as temp.mylist;
/// Property parts As list Of PXW.DEV.Particle [ Private ];
Method AddPart(Part As PXW.DEV.Particle)
{
	$$$DEBUG("Adding "_Part.%ClassName(1)_":"_Part.type_":"_$zconvert(Part.ToString(),"O","JSON")_":"_$s(Part.%IsA("PXW.DEV.Atom"):Part.line_","_Part.col,1:""))
	;d ..parts.Insert(Part)
	; this is faster than the list of objects - not much, 20%, but on dealing with millions of things its something
	Set i=$INCREMENT(%PXWparts(+$THIS))
	Set %PXWparts(+$THIS,i)=Part
}

Method partsGetAt(key As %Integer) As PXW.DEV.Particle
{
	#dim part as PXW.DEV.Particle
	set part=$GET(%PXWparts(+$THIS,key))
	Quit part
}

Method partsGetNext(ByRef key As %Integer = "") As PXW.DEV.Particle
{
	#dim %PXWparts as PXW.DEV.Particle
	;q ..parts.GetNext(.key)
	Set key=$ORDER(%PXWparts(+$THIS,key))
	If key'="" {
		Set obj=%PXWparts(+$THIS,key)
	} Else {
		Set obj=""
	}
	Quit obj
}

Method partsCount() As %Integer
{
	;q ..parts.Count()
	Quit +$GET(%PXWparts(+$THIS))
}

Method partsCopy(Source As PXW.DEV.Element)
{
	Set count=$GET(%PXWparts(+Source))
	For i=1:1:count Set %PXWparts(+$THIS,$INCREMENT(%PXWparts(+$THIS)))=%PXWparts(+Source,i)
}

Method partsClear()
{
	Kill:$DATA(%PXWparts(+$THIS)) %PXWparts(+$THIS)
}

Method %OnClose() As %Status
{
	Kill:$DATA(%PXWparts(+$THIS)) %PXWparts(+$THIS)
	Quit $$$OK
}

Method GetString(Part As PXW.DEV.Element) As %String
{
	If $ISOBJECT(Part) Quit Part.ToString(0)
	Quit ""
}

Method ToString(wspace As %String = "") As %String
{
	#dim a as PXW.DEV.Atom
	#dim e as PXW.DEV.Element
	
	Set str=""
	Set akey=""
	For  {
		Set a=..partsGetNext(.akey)
		Quit:akey=""

		Set str=str_a.ToString(wspace)
	}
	Quit str
}

Method ToStringAtomsOnly(wspace As %String = "") As %String
{
	#dim a as PXW.DEV.Atom
	#dim e as PXW.DEV.Element
	
	Set str=""
	Set akey=""
	For  {
		Set a=..partsGetNext(.akey)
		Quit:akey=""

		If a.%IsA("PXW.DEV.Atom") Set str=str_a.ToString(wspace)
	}
	Quit str
}

Method write(indent As %String = "")
{
	Set akey=""
	Write indent_"Element="_..type_" "_..%ClassName(1)_" @"_+$THIS,!
	For  {
		Set a=..partsGetNext(.akey)
		Quit:akey=""
		
		Do a.write(indent_".")
	}
}

Method writeFull(indent As %String = "")
{
	Set akey=""
	Write indent_"Element="_..type_" "_..%ClassName(1)_" @"_+$THIS,!
	
	For  {
		Set a=..partsGetNext(.akey)
		Quit:akey=""
		
		Do a.writeFull(indent_".")
	}
}

Method writeDebug(indent As %String = "")
{
	Set akey=""
	$$$DEBUG(indent_"Element="_..type_" "_..%ClassName(1)_" @"_+$THIS)
	For  {
		Set a=..partsGetNext(.akey)
		Quit:akey=""
		
		Do a.writeDebug(indent_".")
	}
}

Method LastAtom() As PXW.DEV.Atom
{
	#dim element as PXW.DEV.Element
	#dim atom as PXW.DEV.Atom
	Set part=..partsGetAt(..partsCount())
	If part.%IsA("PXW.DEV.Element") Set element=part Quit element.LastAtom()
	Set atom=part
	Quit atom
}

Method FirstAtom() As PXW.DEV.Atom
{
	#dim element as PXW.DEV.Element
	#dim atom as PXW.DEV.Atom
	Set part=..partsGetAt(1)
	If part.%IsA("PXW.DEV.Element") Set element=part Quit element.FirstAtom()
	Set atom=part
	Quit atom
}

/// STOP USING THIS - go for findElementsByType or findElementsByClass
Method findElementTypes(ClassName As %String, ByRef OuputArray As %String)
{
	If ..%IsA(ClassName) Set OuputArray(+$THIS)=$THIS
	For i=1:1:..partsCount() {
		Set ele=..partsGetAt(i)
		If ele.%IsA("PXW.DEV.Element") {
			Do ele.findElementTypes(ClassName,.OuputArray)
		}
	}
}

Method findFirstElementByType(Type As %String, deep As %Boolean = 1) As PXW.DEV.Element
{
	#dim ele,founda as PXW.DEV.Element

	Set uType=$$$UPPER(Type)
	Set found=""
	If deep {
		If $$$UPPER(..type)=uType {
			Set found=$THIS
		} Else {
			For i=1:1:..partsCount() {
				Set ele=..partsGetAt(i)
				If ele.%IsA("PXW.DEV.Element") {
					Set found=ele.findFirstElementByType(Type,deep)
					If $ISOBJECT(found) Quit ; quit loop
				}
			}
		}
	} Else {
		For i=1:1:..partsCount() {
			Set ele=..partsGetAt(i)
			If ele.%IsA("PXW.DEV.Element"),$$$UPPER(ele.type)=uType {
				Set found=ele
				Quit ; loop
			}
		}
	}
	Quit found
}

Method findNextElement(ByRef key As %Integer) As PXW.DEV.Element
{
	#dim ele as PXW.DEV.Element
	do {
		Set ele=..partsGetNext(.key)
	 	If ele="" Quit
	} While 'ele.%IsA("PXW.DEV.Element") 
	Quit ele
}

Method countElements() As %Integer
{
	Set count=0,k=""
	While $isobject(..findNextElement(.k)) {
		Set count=count+1
	}
	quit count
}

/// deep = 0 means look only at the children of this object
/// deep = 1 means go deep until we find what we need but do not go deeper
/// deep = 2 means go through ALL paths finding all elements of that type
Method findElementsByType(Type As %String, ByRef OutputList As %Library.ListOfObjects, deep As %Boolean = 2)
{
	Set uType=$$$UPPER(Type)
	If deep=2 {
		If $$$UPPER(..type)=uType {
			If '$ISOBJECT($GET(OutputList)) { 
				Set OutputList=##class(%Library.ListOfObjects).%New()
			}
			Do OutputList.Insert($THIS)
		}
		For i=1:1:..partsCount() {
			Set ele=..partsGetAt(i)
			If ele.%IsA("PXW.DEV.Element") {
				Do ele.findElementsByType(Type,.OutputList,2)
			}
		}
	} ElseIf deep=1 {
		Set godeeper=1
		If $$$UPPER(..type)=uType {
			If '$ISOBJECT($GET(OutputList)) { 
				Set OutputList=##class(%Library.ListOfObjects).%New()
			}
			Do OutputList.Insert($THIS)
			Set godeeper=0
		}
		If godeeper {
			For i=1:1:..partsCount() {
				Set ele=..partsGetAt(i)
				If ele.%IsA("PXW.DEV.Element") {
					Do ele.findElementsByType(Type,.OutputList,1)
				}
			}
		}
	} Else {
		For i=1:1:..partsCount() {
			Set ele=..partsGetAt(i)
			If ele.%IsA("PXW.DEV.Element"),$$$UPPER(ele.type)=uType {
				If '$ISOBJECT($GET(OutputList)) { 
					Set OutputList=##class(%Library.ListOfObjects).%New()
				}
				Do OutputList.Insert(ele)				
			}
		}
	}
}

Method findElementsByClass(ClassName As %String, ByRef OuputArray As %String)
{
	If ..%IsA(ClassName) Set OuputArray(+$THIS)=$THIS
	For i=1:1:..partsCount() {
		Set ele=..partsGetAt(i)
		If ele.%IsA("PXW.DEV.Element") {
			Do ele.findElementTypes(ClassName,.OuputArray)
		}
	}
}

Method findElementsByTypePath(Path As %String, ByRef OutputList As %Library.ListOfObjects)
{
	
	; find everything on the first step of the path
	Set stepI=1,deep=0
	Set step1=$PIECE(Path,",",stepI)
	If step1="*" Set deep=1,stepI=stepI+1,step1=$PIECE(Path,",",stepI)

	Set list1=##class(%Library.ListOfObjects).%New()
	Do ..findElementsByType(step1,list1,deep)
	
	; go along each step after and find all the sub elements that are in the previous list
	; each time we go along the steps we use the output of the previous step as the input of
	; of the next search
	; list1 from above builds list2, list1 is reset to list2 and it runs again
	; if the step is * this means anything will do (look deep)
	; otherwise just look a the next level
	Set stepI=stepI+1,deep=0
	For si=stepI:1:$LENGTH(Path,",") {
		Set step2=$PIECE(Path,",",si)
		If step2="*" {
			Set deep=1
		} Else {
			Set list2=##class(%Library.ListOfObjects).%New()
			For i=1:1:list1.Count() {
				Set item1=list1.GetAt(i)
				Do item1.findElementsByType(step2,list2,deep)		
			}
			Set list1=list2
			Set deep=0
		}
	}
	Set OutputList=list1
}

Method %OnNew(type As %String) As %Status
{
	Set ..type=$GET(type)
	Quit $$$OK
}

}
