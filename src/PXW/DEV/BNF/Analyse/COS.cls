Include PXW.Debuggers.Macros

Class PXW.DEV.BNF.Analyse.COS Extends PXW.DEV.BNF.Analyse.analyser
{

Parameter CodeType = "CLS,INC,INT,MAC";

Parameter Language = "COS";

/// Keep track of variable types 
/// ..VariableTypes(varname)=type
Property VariablesTypes As %String [ MultiDimensional ];

/// Keep track of variable types #dimmed by programmer, assumed to be more accurate than can be derived
/// ..DimmedTypes(varname)=type
Property DimmedTypes As %String [ MultiDimensional ];

/// Keep track of variable types passed in as parameters
/// ..ParameterVariables(varname)=type
Property ParameterVariables As %String [ MultiDimensional ];

/// The return type (string) of the current method
Property ReturnType As %String;

/// The return type Element of the current method
Property ReturnTypeElement As PXW.DEV.BNF.Elements.COS;

/// Set this when a quit from method is found
Property QuitFound As %Boolean;

/// Set when method is Abstract, which means some checks are turned off
Property MethodIsAbstract As %Boolean;

/// Server that provide class information
Property ClassServer As PXW.DEV.Dictionary.ClassDefinitionObject;

/// VariablesSet(varname)=element ; means the variable is set, and the element is the variable element that set it
Property VariablesSet As PXW.DEV.BNF.Elements.COS [ MultiDimensional ];

/// VariablesUsed(varname)=element ; means the variable is used, and the element is the variable element that set it, element may be null
Property VariablesUsed As PXW.DEV.BNF.Elements.COS [ MultiDimensional ];

/// Set by codemode attribute (generator etc)
Property CodeMode As %String;

/// ..DefinedMacros(macroname)=""
Property DefinedMacros As %String [ MultiDimensional ];

/// Flag to stop many single letter commands showing as problems in a single analysis
Property ShortCommand As %Boolean;

/// List of variables that count as "bad" - ie keywords
Property BadVars As %String [ MultiDimensional ];

/// List of variables that count as "bad" - ie keywords that have been used
Property BadVarsUsed As %String [ MultiDimensional ];

/// Temp store of strings if we can work out what they are.
/// stringVars(varname)=string value text
/// stringVars(varname,"element")=string value as element
Property stringVars [ MultiDimensional ];

/// Temp store of elements that are setting strings and their value (eg set str="a",str=str_"b" will have 2 entries one set to a on set to ab
/// stringVars(+element)=string value text
/// stringVars(+element,"element")=string value as element
/// The element is the element that points to the variable being set (ie set STR="a" points to STR)
Property stringVarsElement [ MultiDimensional ];

/// Temp store of the final element that sets the var
/// (+element)=value
/// (+element,"element")=value as element
Property stringVarsElementLast [ MultiDimensional ];

Method %OnNew(ClassServer As PXW.DEV.Dictionary.ClassDefinitionObject = "") As %Status
{
	$$$DEBUGMethodBegin
	Set ..ClassServer=ClassServer

	Set list="BREAK,CASE,CATCH,CLOSE,CONTINUE,DO,ELSE,ELSEIF,ENDIF,EXECUTE,FOR,GOTO,HALT,HANG,IF,JOB,KILL,LOCK,MERGE,NEW,OPEN,PIECE,QUIT,READ,RET,RETURN,TCOMMIT,THROW,TROLLBACK,TRY,TSTART,USE,VIEW,WHILE,WRITE,XECUTE"
	For i=1:1:$LENGTH(list,",") {
		Set w=$PIECE(list,",",i),..BadVars(w)=""
	}
	$$$DEBUGMethodEnd
	Quit $$$OK
}

Method Reset()
{
	$$$DEBUGMethodBegin
	Kill ..VariablesTypes
	Kill ..DimmedTypes
	Kill ..ElementWarnings
	Kill ..ParameterVariables
	Kill ..DefinedMacros
	Kill ..BadVarsUsed
	Kill ..stringVars
	Kill ..stringVarsElement
	Set ..ShortCommand=0
	Set ..QuitFound=0
	Set ..MethodIsAbstract=0
	Set ..CodeMode=""
	
	If $ISOBJECT(..ClassServer) {
		Set var=""
		For  {
			Set type=..ClassServer.KnownVariables.GetNext(.var)
			Quit:var=""

			Set ..VariablesTypes(var)=type
		}
	}
	Set ..ReturnType=""
	Set ..ReturnTypeElement=""
	$$$DEBUGMethodEnd
}

Method IsParameterVariable(var As %String) As %Boolean
{
	If var="" Quit 0
	If $DATA(i%ParameterVariables(var)) Quit 1
	Quit 0
}

/// best to analyse the entire codeblock all at once.
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

	; AFTER full analysis we can flag a couple of things
	If element.type="OneClassmember" {
		Do ..checkOneClassMemeberFINAL(element)
	}
}

/// Check to see if Classname is a subclass of the given superclass
Method IsExtension(Classname As %String, SuperClass As %String) As %Boolean
{
	If ..ClassServer.GetClassDetails(Classname,,,.primarysuper) {
		If primarysuper[("~"_SuperClass_"~") Quit 1
	}
	Quit 0
}

/*
set a=##class(PXW.DEV.BNF.Analyse.COS).%New(),a.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
; Atom and Element are quite compatible based on the Particle being at depth 2
USER>w a.IsCompatible("PXW.DEV.Atom","PXW.DEV.Element",.c,.d),! zw c,d
1
c="PXW.DEV.Particle"
d=2

USER>w a.IsCompatible("PXW.DEV.Element","PXW.DEV.Atom",.c,.d),! zw c,d
1
c="PXW.DEV.Particle"
d=2


; Particle and Element are very compatible based on the Particle being at depth 1 (ie Element extends Particle)
USER>w a.IsCompatible("PXW.DEV.Particle","PXW.DEV.Element",.c,.d),! zw c,d
1
c="PXW.DEV.Particle"
d=1


USER>w a.IsCompatible("PXW.DEV.Element","PXW.DEV.Particle",.c,.d),! zw c,d
1
c="PXW.DEV.Particle"
d=1

; Element and This class share the compatible %RegisteredObject at a depth of 3, is that really compatible depends on usage of the objects
USER>w a.IsCompatible("PXW.DEV.Element","PXW.DEV.BNF.Analyse.COS",.c,.d),! zw c,d
1
c="%Library.RegisteredObject"
d=3
*/
method IsCompatible(Classname1 as %String, Classname2 as %String, output commonClass as %String, output depth as %String) as %Boolean {

	$$$DEBUGMethodBegin
	Set commonClass="",depth=0,result=0
	If ..ClassServer.GetClassDetails(Classname1,,,.super1),..ClassServer.GetClassDetails(Classname2,,,.super2) {
		Set common1="",d1=0
		For i=2:1:$LENGTH(super1,"~")-1 {
			Set cls=$PIECE(super1,"~",i)
			If common1="",super2[("~"_cls_"~") Set common1=cls,d1=i-1
		}
		Set common2="",d2=0
		For i=2:1:$LENGTH(super2,"~")-1 {
			Set cls=$PIECE(super2,"~",i)
			If common2="",super1[("~"_cls_"~") Set common2=cls,d2=i-1
		}
		If d1>0,d1<d2 {
			Set commonClass=common1,depth=d1,result=1
		} ElseIf d2>0 {
			Set commonClass=common2,depth=d2,result=1
		}
		$$$DEBUG($$$debugFormat("super1={super1}, super2={super2}"))
	}
	$$$DEBUGMethodEnd
	Quit result
}

Method checkCDEFOneClassMember(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="OneClassmember")
{
	Do ..Reset()
	Quit ""
}

Method checkCosReturnTypeClassReference(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ReturnTypeClassReference")
{
	$$$DEBUGMethodBegin
	Set crE=element.findFirstElementByType("ClassReference",0)
	If $ISOBJECT(crE) {
		Set ..ReturnType=crE.ToString(0)
		Set ..ReturnTypeElement=element
	}
	$$$DEBUGMethodEnd
	Quit ""
}

/// Look for short commands.
Method checkCosCommand(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="CosCommand")
{

	$$$DEBUGMethodBegin
	If '..ShortCommand {
		Set directiveE=element.findFirstElementByType("CosDirective",0)
		; directives count as a command (is this right?) but start with a # atom so would end up being counted as short
		; therefore only check if its NOT a directive
		If '$ISOBJECT(directiveE) {
			Set a=element.FirstAtom()
			If $LENGTH(a.value)=1 {
				Do ..AddElementWarning(element,"Short command")
				Set ..ShortCommand=1
			}
		}
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCDEFFormalSpecItem(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="FormalSpecItem")
{
	#dim itemE as PXW.DEV.Element
	/*
		ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.ClassToDisplay")
		
		Element=FormalSpecItem PXW.DEV.BNF.Elements.ClassDefinition @7112
		.Element=VariableSet PXW.DEV.BNF.Elements.ClassDefinition @6156
		..type=VariableSet:
		.. ObjList
		.Element=AsTypeClassReference PXW.DEV.BNF.Elements.ClassDefinition @6605
		..type=CDEFKeyword:
		.. As
		..Element=TypeClassReference PXW.DEV.BNF.Elements.ClassDefinition @7031
		...Element=ClassReference PXW.DEV.BNF.Elements.ClassDefinition @6660
		....type=ClassReference:
		.... %ListOfObjects
		...Element=TypeParameters PXW.DEV.BNF.Elements.ClassDefinition @6609
		....type=punctuation:
		.... (
		....Element=TypeParametersList PXW.DEV.BNF.Elements.ClassDefinition @6965
		.....Element=TypeParameterItem PXW.DEV.BNF.Elements.ClassDefinition @6361
		......Element=ClassItemIdentifier PXW.DEV.BNF.Elements.ClassDefinition @6618
		.......type=ClassItemIdentifier:
		....... ELEMENTTYPE
		......type=punctuation:
		...... =
		......Element=String PXW.DEV.BNF.Elements.ClassDefinition @6985
		.......type=String:
		....... "PXW.DEV.ClassToDisplay"
		....type=punctuation:
		.... )

		nav to AsTypeClassReference.TypeClassReference.TypeParameters.TypeParametersList
		for each TypeParameterItem
		  nav to ClassItemIdentifier looking for ELEMENTTYPE
		  get String
	*/
	$$$DEBUGMethodBegin
	; for listOfObjects we want to know the element type if there is one
	Set elementType=""
	Do element.findElementsXPath("AsTypeClassReference/TypeClassReference/TypeParameters/TypeParametersList/TypeParameterItem[ClassItemIdentifier=ELEMENTTYPE]/String",.listOfElementTypes)
	For i=1:1:listOfElementTypes.Count() { 
		Set itemE=listOfElementTypes.GetAt(i)
		Set atom=itemE.FirstAtom()
		Set elementType=$TRANSLATE(atom.value,"""","")
	}

	Set modeE=element.findFirstElementByType("FormalSpecMode",0)
	Set mode=$SELECT($ISOBJECT(modeE):modeE.ToString(0),1:"")
	Set varE=element.findFirstElementByType("VariableSet",0)
	If $ISOBJECT(varE) {
		Set var=varE.ToString(0)
		Set typeE=element.findFirstElementByType("ClassReference",1) ; go deep because of optional group
		Set type=$SELECT($ISOBJECT(typeE):typeE.ToString(0),1:"")
		Set ..ParameterVariables(var)=type
		If type'="" {
			Set ..VariablesTypes(var)=type
			Set ..DimmedTypes(var)=type ; count the formal spec definition as the dimmed type (definitive)
			If elementType'="" {
				Set ..VariablesTypes(var,"ELEMENTTYPE")=elementType
				Set ..DimmedTypes(var,"ELEMENTTYPE")=elementType ; count the formal spec definition as the dimmed type (definitive)
			}
		} Else {
			; for me, byref means you pass stuff in and out so it could be array
			; or something modifiable so don't check the type
			If mode="" {
				Do ..AddElementWarning(varE,var_" no type specified on formal spec")
			}
		}
	}
	$$$DEBUGMethodEnd
	Quit ""
}

/// When setting a variable keep track of what is being set to what, enabling a derivation of what variable holds what.
/// Also keep track of what string variables being set. This enables things like looking for code within string
/// that is executed in directly (especially sql)
Method checkCosSetItem(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="SetItem")
{
	; work out what is being set
	$$$DEBUGMethodBegin
	Do element.findElementsXPath("SetValueExpression/VariableSet",.variablelist)
	For i=1:1:variablelist.Count() {
		Set varE=variablelist.GetAt(i)
		Set var=varE.ToString(0)
		Set currentlySetting(var)=varE
		; if its JUST a variable then we are interested in keeping track of it
		If varE.partsCount()=1 {
			Set ..VariablesSet(var)=varE
			Set currentStringVars(var)=varE
		} Else {
			; its an array or some sort of object.property, so its a var being used
			Set varname=varE.FirstAtom().ToString(0)
			Set ..VariablesUsed(varname)=varE
			; if its very complicated (eg object.property) then we will not deal with string tracking for the moment (its doing my head in)
			;Set currentStringVars(varname)=varE
			;Set currentStringVarsArray(varname)=varE
			
		}
	}

	; work out what its being set to
	Set value=element.findFirstElementByType("SetExpression",0)
	Set derivedtype=..DeriveTypeReturned(value)
	Set var=""
	For {
		Set var=$ORDER(currentlySetting(var),1,velement)
		Quit:var=""

		Do ..checkAndRecordVariableType(velement,var,derivedtype)
	}

	; work out if this is being set to a string, we can "easily" keep track of these
	Set string=..SimplifyStringExpressionAsElement(value,.stringElement)
	Set var=""
	For {
		Set var=$ORDER(currentStringVars(var),1,velement)
		Quit:var=""

		If string'="" {
			; array so treat as concatenate string
			If $DATA(currentStringVarsArray(var)) {
				Set string=$GET(..stringVars(var))_string
				Set oldStrElement=$GET(..stringVars(var,"element"))
				If $ISOBJECT(oldStrElement) {
					Set newStrElement=oldStrElement.%ConstructClone(0)
					Do newStrElement.partsCopy(oldStrElement)
					Do newStrElement.partsCopy(stringElement)
					Set stringElement=newStrElement
				}
			}

			; we need to store quite a few copies of this keyed by various things
			; these are the current/final state of things
			; stringVars(varname)=string                	; simple string stored on the variable name  - this is current the view of the string
			; stringVars(varname,"element")=stringElement   ; the string stored as an element
			; stringVars(varname,"last")=variableElement   	; a pointer to the last element that updated this string
			;
			; these are store by the source element so contains the "history" of how the string is constructed
			; stringVarsElement(variableElement)=string      				; simple string stored on the source object element
			; stringVarsElement(variableElement,"element")=stringElement   ; the string stored as an element
			;
			; this final bit is an index to hold just the final state of things keyed by source element, 
			; this is so we can look up to see if this is the last time the string was updated, so we know its complete.
			; stringVarsElementLast(variableElement)=varname					; an index to show its the last one, it does not need to be set to anything
			; stringVarsElementLast(variableElement,"element")=stringElement	; an index to show its the last one, it does not need to be set to anything

			Set oldLast=$GET(..stringVars(var,"last"))
			If $ISOBJECT(oldLast) {
				Kill ..stringVarsElementLast(+oldLast)  
			}
			Set ..stringVars(var)=string
			Set ..stringVars(var,"last")=velement
			Set ..stringVars(var,"element")=stringElement
			Set ..stringVarsElement(+velement)=string
			Set ..stringVarsElement(+velement,"element")=stringElement
			Set ..stringVarsElementLast(+velement)=var
			Set ..stringVarsElementLast(+velement,"element")=stringElement
		} Else {
			Kill ..stringVars(var)
		}
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkAndRecordVariableType(VariableElement As PXW.DEV.BNF.Elements.COS, Variable As %String, DerivedType As %String)
{
	$$$DEBUGMethodBegin
	Set var=Variable
	Set velement=VariableElement
	Set derivedtype=..FullClassName(DerivedType)
	Set dimmedtype=..FullClassName($GET(..DimmedTypes(var)))
	Set currenttype=..FullClassName($GET(..VariablesTypes(var)))
	If dimmedtype'="",derivedtype'="",dimmedtype'=derivedtype {
		;If (..IsExtension(derivedtype,dimmedtype)=0) && (..IsExtension(dimmedtype,derivedtype)=0) {
		;	Do ..AddElementWarning(velement,"Derived type of "_var_" ("_derivedtype_") differs to dimmed type ("_dimmedtype_")")
		;}
		If ..IsCompatible(derivedtype,dimmedtype,.cls,.depth) {
			Do:depth>1 ..AddElementWarning(velement,"Derived type of "_var_" ("_derivedtype_") differs to dimmed type ("_dimmedtype_") but they are compatible via "_cls_" at depth "_depth)
		} Else {
			Do ..AddElementWarning(velement,"Derived type of "_var_" ("_derivedtype_") differs to dimmed type ("_dimmedtype_")")
		}
	}
	; assume the programmer is right, i.e. prefer the dimmed type
	Set finaltype=..FullClassName($SELECT(dimmedtype'="":dimmedtype,1:derivedtype))

	If currenttype'="",finaltype'="",currenttype'=finaltype {
		; if the current type is a superclass of the new type then this is allowed
		;If ..IsExtension(finaltype,currenttype) || ..IsExtension(currenttype,finaltype){
		;	; not an error
		;} Else {
		;	Do ..AddElementWarning(velement,"Change of type on "_var_" from "_currenttype_" to "_finaltype)
		;}
		If ..IsCompatible(finaltype,currenttype,.cls,.depth) {
			Do:depth>2 ..AddElementWarning(velement,"Change of type on "_var_" from "_currenttype_" to "_finaltype_" but they are compatible via "_cls_" at depth "_depth)
		} Else {
			Do ..AddElementWarning(velement,"Change of type on "_var_" from "_currenttype_" to "_finaltype)
		}
	}
	; we have a type so remember it, dont bother storing when it went to null, thats normally not useful
	If finaltype'="" {
		Set ..VariablesTypes(var)=finaltype
	}
	$$$DEBUGMethodEnd
}

Method checkCosVariable(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="Variable,ByrefVariable")
{
	$$$DEBUGMethodBegin
	;  variable name part is the only bit we are interested in
	Set varname=element.FirstAtom().ToString(0)
	Set ..VariablesUsed(varname,+element)=element
	Set uvar=$$$UPPER(varname)
	If $DATA(..BadVars(uvar)) {
		If '$DATA(..BadVarsUsed(uvar)) {
			Do ..AddElementWarning(element,varname_" bad variable name")
			Set ..BadVarsUsed(uvar)=element
		}
	}
	; ByRef variables are BEING set so dont check for undef, {var} are actually property names so skip those too
	If element.type'="ByrefVariable",$EXTRACT(varname,1)'="%",$EXTRACT(varname,1)'="{",'$DATA(..VariablesSet(varname)),'$DATA(..ParameterVariables(varname)) {
		Do ..AddElementWarning(element,varname_" Possible UNDEF")
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosVariableSet(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="VariableSet")
{
	$$$DEBUGMethodBegin
	;  variable name part is the only bit we are interested in
	Set varname=""
	Set varname=element.FirstAtom().ToString(0)
	If varname'="" {
		Set ..VariablesSet(varname)=element
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosObjectVariable(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="ObjectVariable")
{
	$$$DEBUGMethodBegin
	;  variable name part is the only bit we are interested in
	Set varname=element.FirstAtom().ToString(0)
	Set ..VariablesUsed(varname)=element
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosMacroCall(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="MacroCall")
{
	$$$DEBUGMethodBegin
	; Find direct variables, these 'could' be being set by the macro.
	; We should look at the macro and work out what its doing to be really clever, for now just count them as being set so we avoid undef
	Do element.findElementsXPath("MacroParameterList/MacroParameter/Expression/Factor/Primary/Variable",.variablelist)
	If $ISOBJECT($GET(variablelist)) {
		For i=1:1:variablelist.Count() {
			Set varE=variablelist.GetAt(i)
			Set varname=varE.FirstAtom().ToString(0)
			Set ..VariablesSet(varname)=varE
		}
	}
	$$$DEBUGMethodEnd
	Quit ""
}


Method checkCosDirectiveDefine(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="CosDirectiveDefine")
{
	$$$DEBUGMethodBegin
	Set nameE=element.findFirstElementByType("CosDirectiveDefineName")
	If $ISOBJECT(nameE) {
		Set macname=nameE.ToString(0)
		Set:macname'="" ..DefinedMacros(macname)=""
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosDirectiveDimItemSet(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="CosDirectiveDimItemSet")
{
	$$$DEBUGMethodBegin
	Set classele=element.findFirstElementByType("ClassReference")
	If $ISOBJECT(classele) {
		Set classname=classele.ToString(0)
		Do element.findElementsByType("VariableSet",.variablelist,0)
		For i=1:1:variablelist.Count() {
			Set var=variablelist.GetAt(i).ToString(0)
			Set ..DimmedTypes(var)=classname
		}
		Set dimexprE=element.findFirstElementByType("DimExpression")
		If $ISOBJECT(dimexprE) {
			Set derivedtype=..DeriveTypeReturned(dimexprE)
			Set fullret=..FullClassName(classname),fullder=..FullClassName(derivedtype)
			If ..IsCompatible(fullret,fullder,.cls,.depth) {
				Do:depth>1 ..AddElementWarning(element,"dimmed as "_fullret_" does not match derived "_fullder_" but they are compatible via "_cls_" at depth "_depth)
			} Else {
				Do ..AddElementWarning(element,"dimmed as "_fullret_" does not match derived "_fullder)
			}
		}
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosDirectiveDimItemNoSet(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="CosDirectiveDimItemNoset")
{
	$$$DEBUGMethodBegin
	Set classele=element.findFirstElementByType("ClassReference")
	If $ISOBJECT(classele) {
		Set classname=classele.ToString(0)
		Do element.findElementsByType("VariableNodef",.variablelist,0)
		For i=1:1:variablelist.Count() {
			Set var=variablelist.GetAt(i).ToString(0)
			Set ..DimmedTypes(var)=classname
		}
		/*set dimexprE=element.findFirstElementByType("DimExpression")
		if $ISOBJECT(dimexprE) {
			Set derivedtype=..DeriveTypeReturned(dimexprE)
			if ..FullClassName(classname)'=..FullClassName(derivedtype) {
				do ..AddElementWarning(dimexprE,"Dimmed as "_classname_" does not match derived:"_derivedtype)
			}
		}*/
	}
	$$$DEBUGMethodEnd
	Quit ""
}
Method checkCosDoItem(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="DoItem")
{
	$$$DEBUGMethodBegin
	If element.partsCount()>0 {
		; treat this like a method call so we get the byref things set
		; eg Do ..method(.var1,.var2)
		Set variableElement=element.partsGetAt(1)
		; not really interested in the return type, we just want the method checked for byref 
		Do ..DeriveTypeReturned(variableElement)
	}	
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosForCommand(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="ForCommand")
{
	$$$DEBUGMethodBegin
	; the variables on a for loop do not "need" to be used so we will not check for undef on them, but we will keep track of them being used
	Do element.findElementsXPath("ForParameters/ForParameter/LvalueExpression/VariableSet",.variablelist)
	If $ISOBJECT($GET(variablelist)) {
		For i=1:1:variablelist.Count() {
			Set varE=variablelist.GetAt(i)
			Set varname=varE.FirstAtom().ToString(0)
			Set ..VariablesUsed(varname)=varE
		}
	}
	$$$DEBUGMethodEnd
	Quit ""
}
Method checkCosIncrementFunctionCall(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="IncrementFunctionCall")
{
	$$$DEBUGMethodBegin
    Set varE=element.findFirstElementByType("VariableSet",0)
    If $ISOBJECT(varE) {
		Set var=varE.ToString(0)
		; if its JUST a variable then we are interested in keeping track of it
		If varE.partsCount()=1 {
			Set ..VariablesUsed(var,+element)=varE
		} Else {
			; its an array or some sort of object.property, so its a var being used
			Set varname=varE.FirstAtom().ToString(0)
			Set ..VariablesUsed(varname,+element)=varE
		}        
    }
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosQuitCommand(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="QuitCommand,ReturnCommand")
{
	$$$DEBUGMethodBegin
	If element.type="QuitCommand" {
		Set quitexpE=element.findFirstElementByType("QuitExpression",1)	
	} ElseIf element.type="ReturnCommand" {
		Set quitexpE=element.findFirstElementByType("ReturnExpression",1)
	} Else {
		Set quitexpE=""
	}
	If $ISOBJECT(quitexpE) {
		Set derivedtype=..DeriveTypeReturned(quitexpE)
		If derivedtype="" {
			If quitexpE.ToString(0)="""""" {
				; if the return value is null ("") then this is always ok
				Set derivedtype=..ReturnType
			} Else {
				If ..ClassServer.GetClassDetails(..ReturnType,.classtype) {
					If $$$UPPER(classtype)="DATATYPE" {
						Set derivedtype=..ReturnType
					}
				}
			}
		}
		If ..ReturnType="" {
			Do ..AddElementWarning(element,"return type is not set, derived type="_derivedtype)
		} ElseIf  ..FullClassName(..ReturnType)'=..FullClassName(derivedtype) {
			;If (..IsExtension(..FullClassName(..ReturnType),..FullClassName(derivedtype))) || (..IsExtension(..FullClassName(derivedtype),..FullClassName(..ReturnType))) {
			;	; the derived type subclass of the expected type, which is fine
			;} Else {
			;	Do ..AddElementWarning(element,"return type="_..ReturnType_", derived type="_derivedtype)
			;}
			Set fullret=..FullClassName(..ReturnType),fullder=..FullClassName(derivedtype)
			If ..IsCompatible(fullret,fullder,.cls,.depth) {
				Do:depth>1 ..AddElementWarning(element,"return type="_fullret_", derived type="_fullder_" but they are compatible via "_cls_" at depth "_depth)
			} Else {
				Do ..AddElementWarning(element,"return type="_fullret_", derived type="_fullder)
			}
		}
		Set ..QuitFound=1
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosTryCommand(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="TryCommand")
{
	$$$DEBUGMethodBegin
	;  variable name part is the only bit we are interested in
	; A try is defined like this "TRY" code "CATCH" variable code
	; so the only direct variable on the try is the exception
	Set varE=element.findFirstElementByType("Variable",0)
	If $ISOBJECT(varE) {
		Set varname=varE.FirstAtom().ToString(0)
		Set ..VariablesSet(varname)=element
		Set ..VariablesTypes(varname)="%Exception.AbstractException"
	}
	$$$DEBUGMethodEnd
	Quit ""
}


Method checkOneClassMemeberFINAL(element As PXW.DEV.BNF.Elements.COS)
{
	$$$DEBUGMethodBegin
	Set var=$CHAR($ASCII("%")+1) ; skip over % variables, we don't care if they are used they might be used in deeper, untrackable ways
	For  {
		Set var=$ORDER(..VariablesSet(var))
		Quit:var=""
		; if its a parameter variable we count this as being used
		; {*} is special variable that is used on computed fields, ignore those
		If '$DATA(..VariablesUsed(var)),'$DATA(..ParameterVariables(var)),var'="{*}" {
			Set report=1
			If var="SQLCODE" {
				; SQLCODE is a special case, some people check SQLCODE, some check %ROWCOUND
				If $DATA(..VariablesUsed("%ROWCOUNT")) {
					Set report=0
				}
			}
			If report {
				Set vsetE=..VariablesSet(var)
				Do ..AddElementWarning(vsetE,var_" Set but not used")
			}
		}
	}

	/// Non abstract method where there is a return type but no quit to match it
	If $$$LOWER(..CodeMode)'="expression",'..MethodIsAbstract,..ReturnType'="",..QuitFound=0 {
		If $$$LOWER(..CodeMode)["generator" {
			Do ..AddElementWarning(..ReturnTypeElement,"GeneratOR method should return %Status, even if the generatED code doesn't.")
		} Else {
			Do ..AddElementWarning(..ReturnTypeElement,"No Quit for method that has a ReturnType")
		}
	}
	$$$DEBUGMethodEnd
}
Method checkCDEFAttributeCodeModeType(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="AttributeCodemodetype")
{
	$$$DEBUGMethodBegin
	; if [codemode=objectgenerator] then the ReturnType of the method for analysis purposes is %Status
	Set codemode=$$$UPPER(element.ToString(0))
	Set ..CodeMode=codemode
	If codemode="OBJECTGENERATOR" {
		Set ..ReturnType="%Library.Status"
		Set ..ReturnTypeElement=element
	} ElseIf codemode="GENERATOR" {
		Set ..ReturnType="%Library.Status"
		Set ..ReturnTypeElement=element
		Set ..VariablesUsed("%code")="" ; % vars are not checked anyway, but leaving here in case this changes in the future
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCDEFMethodAttribute(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="MethodAttribute")
{
	$$$DEBUGMethodBegin
	Set attribE=element.findFirstElementByType("AttributeAbstract")
	If $ISOBJECT(attribE) {
		Set ..MethodIsAbstract=1
	}
	$$$DEBUGMethodEnd
	Quit ""
}

Method checkCosSqlCommand(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="SqlCommand")
{
	$$$DEBUGMethodBegin
	; &sql will always set SQLCODE - should it set the element to the SQL command itself? Lets see what happens.
	Set ..VariablesSet("SQLCODE")=element
	$$$DEBUGMethodEnd
	Quit ""
}

/// Check in-line sql for setting of variables.
Method checkSqlSelectIntoVariable(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="SelectIntoVariable")
{
	$$$DEBUGMethodBegin
	;  variable name part is the only bit we are interested in
	Set varname=""
	Set varE=element.findFirstElementByType("Variable",1)
	If $ISOBJECT(varE) Set varname=varE.FirstAtom().ToString(0)
	If varname'="" {
		Set ..VariablesSet(varname)=element
	}
	$$$DEBUGMethodEnd
	Quit ""
}
Method FollowObjectChainForType(ParentElement As PXW.DEV.BNF.Elements.COS, StartClassName As %String, ElementTypeClassName As %String = "") As %String
{
	#dim fpE,fparamsE as PXW.DEV.BNF.Elements.COS
	Set type=StartClassName
    Set classname=StartClassName
    Set objectchain=ParentElement.findFirstElementByType("ObjectChain",0)
	If '$ISOBJECT(objectchain) Set objectchain=ParentElement.findFirstElementByType("ObjectChainNoDot",0)
	Set collection="",elementtype=""
    While $ISOBJECT(objectchain) {
		;d objectchain.write()
		Set fspec=""
        ; the objectchain has the "." and the name
        Set propertyname=objectchain.ToStringAtomsOnly(0)
		Set propertyname=$SELECT($EXTRACT(propertyname,1)=".":$PIECE(propertyname,".",2),1:propertyname)
				
		If collection'="",propertyname?1"Get".AN {
			Set collection=""
			If ElementTypeClassName'="" {
				; special case for List.Get methods where we know the element type already
				Set type=ElementTypeClassName
			} Else {
				; or we might be able to derive it
				If ..ClassServer.GetParameterDetails(classname,"ELEMENTTYPE",,,.elementtype) {
					Set type=elementtype
				}
			}
		} Else {
			Set found=..ClassServer.GetPropertyDetails(classname,propertyname,.type,.collection,.ElementTypeClassName)
			If 'found {
				Set type=..ClassServer.GetMethodReturnType(classname,propertyname,.fspec)
				Set collection="",elementtype=""
			}
		}
		If fspec'="" {
			Set fparamsE=objectchain.findFirstElementByType("FunctionParameterList",0)
			If $ISOBJECT(fparamsE) {
				Set fpk="",count=0
				For  {
					Set fpE=fparamsE.findNextElement(.fpk)
					Quit:fpk=""
					Set count=count+1
					If fpE.type="FunctionParameter" {
						Set byrefE=fpE.findFirstElementByType("ByrefVariable",0)
						If $ISOBJECT(byrefE) {
							Set var=byrefE.ToString(0)
							If var'="" {
								Set btype=$LISTGET($LISTGET(fspec,count),2)
								If btype'="" {
									Do ..checkAndRecordVariableType(byrefE,var,btype)
								}
							}
						}
					}
				}
			} Else {
				Do ..AddElementWarning(objectchain,"Looks like a method "_$GET(classname)_"."_$GET(propertyname)_" but no parameter list found")
			}
		}

        Set objectchain=objectchain.findFirstElementByType("ObjectChain",0)
        Set classname=type
    }
	
    Quit type
}

/// Returns the name of the class of the type of thing
Method DeriveTypeReturned(ValueElement As PXW.DEV.BNF.Elements.COS) As %String
{
	#dim element as PXW.DEV.BNF.Elements.COS

	; some kind of set with indirection so type cannot be derived
	; S @x
	If '$ISOBJECT(ValueElement) Quit ""
	If 'ValueElement.IsElement Quit ""

	If ValueElement.type="Expression" {
		Set expression=ValueElement
	} Else {
		Set expression=ValueElement.findFirstElementByType("Expression",0)
	}

	// If we call from a DO then there is no expression
	If $ISOBJECT(expression),expression.type="Expression" {
		Set simple=..SimplifyExpression(expression,.variableElement)
		If simple'="-" Quit "" ; it's a number or string
	} Else {
		Set variableElement=ValueElement
	}

	If '$ISOBJECT(variableElement) Quit "" ; its something else we cannot deal with
	
	Set finaltype=""
    ; looking for ##class
	If variableElement.type="Classexpr" {
		Set hhclass=variableElement.findFirstElementByType("ClassExpression",0)
		Set super=variableElement.findFirstElementByType("SuperExpression",0)
		If $ISOBJECT(hhclass) {
			Set classnameele=hhclass.findFirstElementByType("ClassReference",0)
			Set classname=classnameele.ToString(0)
			Set finaltype=..FollowObjectChainForType(hhclass,classname)
		} Else {
			; ##super()
			If $ISOBJECT(super) {
				Set superclass=..ClassServer.GetMethodOverrides(..This_"||"_..ThisMethod)
				If superclass'="" {
					Set type=..ClassServer.GetMethodReturnType(superclass,..ThisMethod)
					Set finaltype=..FollowObjectChainForType(super,type)
					;zw type,finaltype
				}
			}
		}
	}
    If finaltype'="" Quit finaltype

    ; looking for variable eg obj.property
	If variableElement.type="Variable" {
		Set finaltype=""
		Set variablename=variableElement.ToStringAtomsOnly(0)
		; when working out a type use the #DIM type if there is one
		; possible that name cannot be determined at this point eg {*}
		If variablename'="" {
			Set classname=$GET(..DimmedTypes(variablename))
			Set elementtype=$GET(..DimmedTypes(variablename,"ELEMENTTYPE"))
			If classname="" Set classname=$GET(..VariablesTypes(variablename))
			If classname'=""	Set finaltype=..FollowObjectChainForType(variableElement,classname,elementtype)
		}
	}
	If finaltype'="" Quit finaltype

	; this is not quite right but expressions are sooo complicated, need a generic
	; get "first thing in expression" method
	If variableElement.type="ThisObject" {
		Set thisobjectselfE=variableElement.findFirstElementByType("ThisObjectSelf",0)
		; otherwise its ..property
		If $ISOBJECT(thisobjectselfE) {
			Set finaltype=..FollowObjectChainForType(thisobjectselfE,..This)
		} Else {
			; check for $this.property
			Set thisobjectthisE=variableElement.findFirstElementByType("ThisObjectThis",0)
			If $ISOBJECT(thisobjectthisE) {
				Set finaltype=..FollowObjectChainForType(thisobjectthisE,..This)
			}
		}
	}
	If finaltype'="" Quit finaltype
	
	Quit finaltype
}

Method FullClassName(name As %String) As %String
{
	If name="" Quit ""
	If $ISOBJECT(..ClassServer) {
		Set fullname=..ClassServer.FullClassName(name)
	} Else {
		Set fullname=name
	}
	
	Quit fullname
}

/// Pass in an expression element, this will return:
/// - if the expression is ONLY a variable (which could be an object with . etc or a global).
/// the String if the expression is ONLY a string.
/// the Number if the expression is ONLY a number.
/// If there is anything else eg 1+1, then this is complex (for now) so it will return -.
Method SimplifyExpression(expressionElement As PXW.DEV.BNF.Elements.COS, Output variableElement As PXW.DEV.BNF.Elements.COS) As %String
{

	; var+1 as an expression looks like this:
	;.Element=Expression PXW.DEV.BNF.Element @19
	;..Element=Factor PXW.DEV.BNF.Element @8
	;...Element=Primary PXW.DEV.BNF.Element @3
	;....Element=Variable PXW.DEV.BNF.Element @54
	;.....type=Variable:/Expression/Factor/Primary/Variable
	;..... var
	;..Element=ExpressionRep76 PXW.DEV.BNF.Element @15
	;...Element=ExpressionRep76Grp75 PXW.DEV.BNF.Element @4
	;....Element=Dyadicop PXW.DEV.BNF.Element @2
	;.....type=punctuation:/Expression/Dyadicop
	;..... +
	;....Element=Factor PXW.DEV.BNF.Element @33
	;.....Element=Primary PXW.DEV.BNF.Element @45
	;......Element=Number PXW.DEV.BNF.Element @28
	;.......type=number:/Expression/Factor/Primary/Number
	;....... 1
	
	; more than 1 child means complex
	Set variableElement=""
	If expressionElement.partsCount()>1 Quit "-"


	Set factorE=expressionElement.partsGetAt(1)
	Set primaryOrMonE=factorE.partsGetAt(1)
	; 1 as an expression looks like this:
	;.Element=Expression PXW.DEV.BNF.Element @1
	;..Element=Factor PXW.DEV.BNF.Element @63
	;...Element=Primary PXW.DEV.BNF.Element @2
	;....Element=Number PXW.DEV.BNF.Element @37
	;.....type=number:/Expression/Factor/Primary/Number
	;..... 1

	; var as an expression looks like this:
	;.Element=Expression PXW.DEV.BNF.Element @19
	;..Element=Factor PXW.DEV.BNF.Element @8
	;...Element=Primary PXW.DEV.BNF.Element @3
	;....Element=Variable PXW.DEV.BNF.Element @54
	;.....type=Variable:/Expression/Factor/Primary/Variable
	;..... var

	; -1 as an expression
	;..Element=Factor PXW.DEV.BNF.Element @33
	;...Element=Monadicop PXW.DEV.BNF.Element @63
	;....type=keyword:/Expression/Factor/Monadicop
	;.... -
	;...Element=Primary PXW.DEV.BNF.Element @54
	;....Element=Number PXW.DEV.BNF.Element @11
	;.....type=number:/Expression/Factor/Primary/Number
	;..... 1
	
	Set type=""
	If primaryOrMonE.type="Primary" {
		; simple
		Set lowest=primaryOrMonE.partsGetAt(1)
		If lowest.type="Number" {
			Set type=lowest.ToString(0)
		} ElseIf lowest.type="String" {
			Set type=lowest.ToString(0)
		} Else {
			Set type="-"
			Set variableElement=lowest
		} 
	} Else {
		; -expression
		; simple
		Set mlowest=factorE.partsGetAt(2)
		If mlowest.type="Number" {
			Set type=primaryOrMonE.ToString(0)
		} Else {
			Set type="-"
		} 
	}
	Quit type
}

/// Pass in a list of subscripts and this will return a string that looks like this
/// -:"string":222:-
/// where - means its a variable 
///       "string" is a constant string
///       222 is a constant number
/// The subscripts are delimited by : 
Method SimplifySubscripts(element As PXW.DEV.Element) As %String
{
	Set simple=""
	If (element.type="SubscriptParameterList") || (element.type="ArrayParameterList") {
		Set sep=""
		For i=1:1:element.partsCount() {
			Set exp=element.partsGetAt(i)
			If $ISOBJECT(exp),exp.type="Expression" {
				Set type=..SimplifyExpression(exp)
				Set simple=simple_sep_type,sep=":"
			}
		}

	}
	Quit simple
}

/// Returns a simplifed, decoded, string from the given expression.
/// EG. 
/// "a"_"b"      we get "ab" back
/// "a"_var_"b"  if we already know what var is then (xxx) we get that back "axxxb"
/// "a"_(complex thing)_"b" we get "a?b"
/// It will also add these atoms to the stringElement, so that we can do more with it later if necessary
Method SimplifyStringExpressionAsElement(ValueElement As PXW.DEV.BNF.Elements.COS, Output stringElement As PXW.DEV.BNF.Elements.COS) As %String
{
	#dim partE,factorE,primaryE,finalE,expressionE as PXW.DEV.BNF.Elements.COS
	Set stringElement=##class(PXW.DEV.Element).%New()
	If '$ISOBJECT(ValueElement) Quit ""
	If ValueElement.type="Expression" {
		Set expressionE=ValueElement
	} Else {
		Set expressionE=ValueElement.findFirstElementByType("Expression",0)
	}
	
	; sql_"Select * from table where x="_xx_" and y=2"      as an expression looks like this:
    ;Element=Expression PXW.DEV.BNF.Elements.COS @8724
    ;.Element=Factor PXW.DEV.BNF.Elements.COS @8640
    ;..Element=Primary PXW.DEV.BNF.Elements.COS @8256
    ;...Element=Variable PXW.DEV.BNF.Elements.COS @8916
    ;....type=Variable:/Expression/Factor/Primary/Variable
    ;.... sql
    ;.Element=Dyadicop PXW.DEV.BNF.Elements.COS @8939
    ;..type=punctuation:/Expression/Dyadicop
    ;.. _
    ;.Element=Factor PXW.DEV.BNF.Elements.COS @8410
    ;..Element=Primary PXW.DEV.BNF.Elements.COS @8273
    ;...Element=String PXW.DEV.BNF.Elements.COS @8784
    ;....type=String:/Expression/Factor/Primary
    ;.... "Select * from table where x="
    ;.Element=Dyadicop PXW.DEV.BNF.Elements.COS @8356
    ;..type=punctuation:/Expression/Dyadicop
    ;.. _
    ;.Element=Factor PXW.DEV.BNF.Elements.COS @9127
    ;..Element=Primary PXW.DEV.BNF.Elements.COS @8928
    ;...Element=Variable PXW.DEV.BNF.Elements.COS @8435
    ;....type=Variable:/Expression/Factor/Primary/Variable
    ;.... xx
    ;.Element=Dyadicop PXW.DEV.BNF.Elements.COS @8258
    ;..type=punctuation:/Expression/Dyadicop
    ;.. _
    ;.Element=Factor PXW.DEV.BNF.Elements.COS @8498
    ;..Element=Primary PXW.DEV.BNF.Elements.COS @8806
    ;...Element=String PXW.DEV.BNF.Elements.COS @8654
    ;....type=String:/Expression/Factor/Primary
    ;.... " and y=2"	

	Set string="",isString=1
	For i=1:1:expressionE.partsCount() {
		Set partE=expressionE.partsGetAt(i)
		If $ISOBJECT(partE) {
			If partE.type="Factor" {
				Set factorE=partE
				Set primaryE=factorE.partsGetAt(1)
				If $ISOBJECT(primaryE),primaryE.type="Primary" {
					Set finalE=primaryE.partsGetAt(1)
					If $ISOBJECT(finalE) {
						Set atom=finalE.FirstAtom()
						Set newatom=atom.%ConstructClone(0)
						Set newatom.start=""
						Set newatom.end=""
						Set newatom.type="String"
						If finalE.type="String" {
							Set newatom.value=$REPLACE(atom.value,"""""","""") ; store without encode quotes
							Set string=string_newatom.value
							Do stringElement.AddPart(newatom)
						} ElseIf finalE.type="Number" {
							Set string=string_atom.value
							Do stringElement.AddPart(newatom)
						} ElseIf finalE.type="SubExpression" {
							Set string=string_"?"
							Set newatom.value="?"
							Do stringElement.AddPart(newatom)
						} ElseIf finalE.type="Variable" {
							Set varname=atom.value
							Set string=string_$GET(..stringVars(varname))
							Set varElem=$GET(..stringVars(varname,"element"))
							Do:$ISOBJECT(varElem) stringElement.partsCopy(varElem)
						} Else {
							Set string=string_"?"
							Set newatom.value="?"
							Do stringElement.AddPart(newatom)
						}
					}
				} Else {
					Set isString=0 ; not primary thing
				}
			} ElseIf partE.type="Dyadicop",partE.ToString(0)="_" {
				; concat is ok
			} Else {
				Set isString=0
			}			
		}
	}
	If isString=0 Set string=""
	If string="?" Set string=""
	Quit string
}

}
