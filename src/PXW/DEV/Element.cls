/// The base class for groups of atoms that make up an element.
/// Elements can be subclassed to store extra data. 
Class PXW.DEV.Element Extends PXW.DEV.Particle
{

/// This needs to be set to the name of the Base class
/// EG for COS it should be set to PXW.DEV.COS.Element
/// nothing that extends COS should override this parameter
Parameter Base = "PXW.DEV.Element";

Property type As %String;

/// property parts as temp.mylist;
/// Property parts As list Of PXW.DEV.Particle [ Private ];
Method AddPart(Part As PXW.DEV.Particle)
{
	;$$$DEBUG("Adding "_Part.%ClassName(1)_":"_Part.type_":"_$zconvert(Part.ToString(),"O","JSON")_":"_$s(Part.%IsA("PXW.DEV.Atom"):Part.line_","_Part.col,1:""))
	;d ..parts.Insert(Part)
	; this is faster than the list of objects - not much, 20%, but on dealing with millions of things its something
	Set %PXWparts(+$THIS,$INCREMENT(%PXWparts(+$THIS)))=Part
}

Method partsGetAt(key As %Integer) As PXW.DEV.Particle
{
	#dim part as PXW.DEV.Particle
	Set part=$GET(%PXWparts(+$THIS,key))
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

/// Copy all the parts from the source element into the current element, adding to the end of the parts (not replacing)
Method partsCopy(Source As PXW.DEV.Element)
{
	Set src=+Source,this=+$THIS,c2=$GET(%PXWparts(this))
	For i=1:1:$GET(%PXWparts(src)) Set %PXWparts(this,$INCREMENT(c2))=%PXWparts(src,i)
	Set %PXWparts(this)=c2
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
	Do {
		Set ele=..partsGetNext(.key)
	 	If ele="" Quit
	} While 'ele.%IsA("PXW.DEV.Element") 
	Quit ele
}

Method countElements() As %Integer
{
	Set count=0,k="",xx=3
	While $ISOBJECT(..findNextElement(.k)) {
		Set count=count+1
	}
	Quit count
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

/*
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
*/
/// Use an XPath type syntax to navigate
/// eg https://www.w3schools.com/xml/xpath_syntax.asp
/// NOT dealing with * for the time being, it makes life complicated, and we should know our own paths
/// only supports 1 condition level check (because its all based on PIECES)
///  eg; p1/p2[sub1=xxx] is ok
///      p2/p2[sub1/sup2=xxx] will not work
Method findElementsXPath(Path As %String, ByRef OutputList As %Library.ListOfObjects(ELEMENTTYPE="PXW.DEV.Element"))
{
	#dim item1 as PXW.DEV.Element

	; find everything on the first step of the path
	Set stepI=1
	Set step1=$PIECE(Path,"/",stepI)
	;If step1="*" Set deep=1,stepI=stepI+1,step1=$PIECE(Path,"/",stepI)

	Set stepField=$PIECE(step1,"[",1),stepCondition=$PIECE($PIECE(step1,"[",2,*),"]",1)
	Set list1=##class(%Library.ListOfObjects).%New()
	Do ..findElementsXPathCondition(stepField,stepCondition,list1)
	
	; go along each step after and find all the sub elements that are in the previous list
	; each time we go along the steps we use the output of the previous step as the input of
	; of the next search
	; list1 from above builds list2, list1 is reset to list2 and it runs again
	; if the step is * this means anything will do (look deep)
	; otherwise just look a the next level
	Set stepI=stepI+1,deep=0
	For si=stepI:1:$LENGTH(Path,"/") {
		Set step2=$PIECE(Path,"/",si)
		Set stepField=$PIECE(step2,"[",1),stepCondition=$PIECE($PIECE(step2,"[",2,*),"]",1)
		Set list2=##class(%Library.ListOfObjects).%New()
		For i=1:1:list1.Count() {
			Set item1=list1.GetAt(i)
			Do item1.findElementsXPathCondition(stepField,stepCondition,list2)		
		}
		Set list1=list2
	}
	Set OutputList=list1
}

/// Condition only supports = at the moment
Method findElementsXPathCondition(Type As %String, Condition As %String, ByRef OutputList As %Library.ListOfObjects)
{
	Set condfield=$PIECE(Condition,"=",1)
	Set condvalue=$PIECE(Condition,"=",2,*)
	Set uType=$$$UPPER(Type)
	For i=1:1:..partsCount() {
		Set ele=..partsGetAt(i)
		If ele.%IsA("PXW.DEV.Element"),$$$UPPER(ele.type)=uType {
			If '$ISOBJECT($GET(OutputList)) { 
				Set OutputList=##class(%Library.ListOfObjects).%New()
			}
			If condfield'="" {
				Do ele.findElementsXPath(condfield,.itemsToCheck)
				Set ok=1
				For j=1:1:itemsToCheck.Count() {
					Set condE=itemsToCheck.GetAt(j)
					Set value=condE.ToString()
					If value'=condvalue {
						Set ok=0
					}
				}
				If ok {
					Do OutputList.Insert(ele)
				}
			} Else {
				Do OutputList.Insert(ele)
			}
		}
	}
}

Method %OnNew(type As %String) As %Status
{
	Set ..type=$GET(type)
	Quit $$$OK
}

}
