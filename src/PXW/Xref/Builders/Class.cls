Include PXW.Debuggers.Macros

Class PXW.Xref.Builders.Class Extends PXW.Xref.Builder
{

Parameter CodeType = "CLS";

/// The command used for the call (set/kill)
Property CalledByKeyword As %String;

Property CalledByCommand As %String;

/// The routine, class doing the call
Property CalledByClassName As %String;

/// Line label, method
Property CalledByItemName As %String [ InitialExpression = "class" ];

Property Analyser As PXW.DEV.BNF.Analyse.COS;

Property ClassElementLineNumber As %Integer;

Property ERROR As %String;

/// the object that will act as the class data server
Property ClassServer As PXW.DEV.Dictionary.ClassDefinitionObject;

Property ThisItemType As %String;

/// Are we in a view
Property InView As %Boolean [ InitialExpression = 0 ];

/// in a WITH
Property WithName As %String;

Property SQLPaths As %String [ MultiDimensional ];

Property SqlProgramAnalyser As PXW.DEV.BNF.Analyse.SQL;

/// d ##class(PXW.Xref.Builders.Class).test()
ClassMethod test()
{
	; GET RID OF %NS
	Set %NS="LOCAL_USER",cls="PXW.Xref.Builders.Class"
	Set x=..%New()
	Set cs=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)
	Do cs.Load(cls,.text)
	Do x.Build(%NS,cls,text)
}

Method Build(Namespace As %String, ItemKey1 As %String, PreLoadedText As %String = "") As %Status
{
	#dim ele as PXW.DEV.Element

	;;; YUCK
	Set %NS=Namespace
	
	Set sc=$$$OK

    Set ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(Namespace)
	Set text=PreLoadedText

    Do ClassServer.CacheClearClassDetails(ItemKey1,1) ; pretend the class is deleted so that it REALLY clears it

	If $$$ISOK(sc) {
 		Set ..ClassServer=ClassServer
		Try {
			Set x=##class(PXW.DEV.BNF.Run.ClassDefinition).%New()
  		    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
  			
			Set element=##class(PXW.DEV.Element).%New()
			While x.cheese(element) {
   				Do ..xrefElement(element)
   				If ..ERROR'="" $$$ThrowStatus($$$ERROR(5001,..ERROR))
				Set element=##class(PXW.DEV.Element).%New()
			}
			If 'x.stream.EOF() Set sc=$$$ERROR(5001,"Not at end:"_x.stream.line_":"_x.stream.pos_":"_x.stream.length_":"_$EXTRACT(x.stream.input,x.stream.lastPos,x.stream.lastPos+20))
		} Catch e {
			Set sc=e.AsStatus()
		}
	}
	Quit sc
}

Method SaveAnalysis(atom As PXW.DEV.Atom, Description As %String) As %Status
{
	Set adata=##class(PXW.Xref.AnalysisData).%New()
	Set adata.ItemKey1=..CalledByClassName
	Set adata.ItemKey2=..CalledByItemName
	Set adata.ItemType="CLS"
	Set adata.LineNumber=atom.line
	Set adata.Description=Description
	Set sc=adata.%Save()
	If $$$ISERR(sc) {
		$$$DEBUG($EXTRACT($SYSTEM.Status.GetErrorText(sc),1,100))
	}
	Quit sc
}

Method SaveCDEFCref(ItemKey1 As %String, LineNumber As %Integer, ItemKey2 As %String)
{
	Set ik2=$SELECT($DATA(ItemKey2):ItemKey2,1:"_class")
	$$$DEBUG("Saving CDEF "_ItemKey1_", "_ik2)
	Set xref=##class(PXW.Xref.Data).%New()
	Set xref.CalledByType=..#CodeType
	Set xref.CalledByKey1=..CalledByClassName
	Set xref.CalledByKey2=..CalledByItemName
	Set xref.CalledByKey3=0 ; definition of property/method etc
	Set xref.CalledByCommand="_"_..CalledByCommand ; _Extends,_Type etc
	Set xref.ItemType="CLS"
	Set xref.ItemKey1=..ClassServer.FullClassName(ItemKey1,$PIECE(..CalledByClassName,".",1,*-1))
	Set xref.ItemKey2=ik2
    Set xref.LineNumber=LineNumber
	Set sc=$$$OK
	If 'xref.AlreadyExists() {
		Set sc=xref.%Save()
		If $$$ISERR(sc) {
			$$$DEBUG($EXTRACT($SYSTEM.Status.GetErrorText(sc),1,100))
		}
	}
}

Method SaveCOSXref(ItemType As %String, ItemKey1 As %String, ItemKey2 As %String, CalledByCommand As %String, Atom As PXW.DEV.Atom = "")
{
	;i ItemKey2["Variables" zw ItemType,ItemKey1,ItemKey2
	$$$DEBUG("Saving COS "_ItemType_","_ ItemKey1_","_ItemKey2_","_CalledByCommand)
	Set xref=##class(PXW.Xref.Data).%New()
	Set xref.CalledByType=..#CodeType
	Set xref.CalledByKey1=..CalledByClassName
	Set xref.CalledByKey2=..CalledByItemName
	Set xref.CalledByCommand=CalledByCommand
	Set xref.ItemType=ItemType
	Set xref.ItemKey1=ItemKey1
	Set xref.ItemKey2=ItemKey2
	If $ISOBJECT(Atom) {
		Set xref.CalledByKey3=Atom.line-..ClassElementLineNumber
		Set xref.LineNumber=Atom.line
	} Else {
		Set xref.LineNumber=0
	}

	Set sc=$$$OK
	If 'xref.AlreadyExists() {
		Set sc=xref.%Save()
		If $$$ISERR(sc) {
			$$$DEBUG($EXTRACT($SYSTEM.Status.GetErrorText(sc),1,100))
		}
	}
	If $$$ISOK(sc),ItemType="CLS" {
		Set origin="",stub=""
		If ..ClassServer.GetMethodDetails(ItemKey1,ItemKey2,,.origin,.stub),origin'=ItemKey1 {
			; also xref the origin class
			Do ..SaveCOSXref(ItemType,origin,ItemKey2,CalledByCommand,Atom)
		} ElseIf ..ClassServer.GetPropertyDetails(ItemKey1,ItemKey2,,,,.origin),origin'=ItemKey1 {
			; also xref the origin class
			Do ..SaveCOSXref(ItemType,origin,ItemKey2,CalledByCommand,Atom)
		}
		If (stub'="") {
			If ($PIECE(stub,".",*)="q") {
				; if the item is a function based on a query (eg GetFunc) then xref the query
				Set query=$PIECE(stub,".",1)
				Do ..SaveCOSXref(ItemType,ItemKey1,query,CalledByCommand,Atom)
			} ElseIf $PIECE(stub,".",*)="a" {
				; if the item is a function based on a property (eg ThingGetLogicalToDisplay) then xref the property
				Set prop=$PIECE(stub,".",1)
				Do ..SaveCOSXref(ItemType,ItemKey1,prop,CalledByCommand,Atom)
			} ElseIf $PIECE(stub,".",*)="i" {
				; if the item is a function based on an index (eg PKOpen) then xref the property
				Set index=$PIECE(stub,".",1)
				Do ..SaveCOSXref(ItemType,ItemKey1,index,CalledByCommand,Atom)
			}

		}
	}
}

Method SaveSQLXref(ItemType As %String, ItemKey1 As %String, ItemKey2 As %String, CalledByCommand As %String, Atom As PXW.DEV.Atom = "", CalledByKey2 As %String = "")
{
	Set sc=$$$OK
	$$$DEBUG("Saving SQL "_ItemType_","_ ItemKey1_","_ItemKey2_","_CalledByCommand)
	Set xref=##class(PXW.Xref.Data).%New()
	Set xref.CalledByType=..#CodeType 
	Set xref.CalledByKey1=..CalledByClassName
	Set xref.CalledByKey2=$SELECT($GET(CalledByKey2)'="":CalledByKey2,1:..CalledByItemName)

	If $ISOBJECT(Atom) {
		Set xref.CalledByKey3=Atom.line-..ClassElementLineNumber
		Set xref.LineNumber=Atom.line ;+..LineOffset
	} Else {
		Set xref.LineNumber=0
	}

	Set xref.CalledByCommand=CalledByCommand
	Set xref.ItemType=ItemType
	Set xref.ItemKey1=ItemKey1
	Set xref.ItemKey2=ItemKey2
	If 'xref.AlreadyExists() {
		Set sc=xref.%Save()
		If $$$ISERR(sc) {
			$$$DEBUG($EXTRACT($SYSTEM.Status.GetErrorText(sc),1,100))
		}
	}


	If $$$ISOK(sc),ItemType="CLS" {
		If ..ClassServer.GetMethodDetails(ItemKey1,ItemKey2,,.origin),origin'=ItemKey1 {
			Do ..SaveCOSXref(ItemType,origin,ItemKey2,CalledByCommand,Atom)
		} ElseIf ..ClassServer.GetPropertyDetails(ItemKey1,ItemKey2,,,,.origin),origin'=ItemKey1 {
			Do ..SaveCOSXref(ItemType,origin,ItemKey2,CalledByCommand,Atom)
		}
	}
}

Method xrefElement(element As PXW.DEV.Element)
{
    #dim a as PXW.DEV.Atom

	Do ..GenericRedirect(element)

	If element.type="WithClause" {
       Set aliasE=element.findFirstElementByType("AliasName")	
	   Set oldwith=..WithName
	   Set ..WithName=aliasE.ToString(0)
	}
 	; from SQL
	Set oldInView=..InView


	For  {
		Set part=element.partsGetNext(.akey)
		Quit:akey=""
		
	    If part.%IsA("PXW.DEV.Element") {
			Do ..xrefElement(part)
		} ElseIf part.%IsA("PXW.DEV.Atom") {
            Set type=$$$UPPER($PIECE(part.type,":",1))
            ; this is the word "method" or "property" etc
            If type="KEYWORD" {
               Set ..CalledByCommand=part.value
            }
			If type="CDEFKEYWORD" {
               Set ..CalledByCommand=part.value
            }

			If $ISOBJECT(..Analyser),$DATA(..Analyser.ElementWarnings(+part)) {
				Set line=..Analyser.ElementWarnings(+part)
				Do ..SaveAnalysis(part,line)
			}

			; type="ERROR" happens when a RECOVERY takes place
			; the part should contain a bit of code up to the point of the error
			If type="ERROR" {
				If ..ERROR="" {
					Set ..ERROR=part.ToString()
				}
			}
		}
	}

	Set ..InView=oldInView
	If $DATA(oldwith) Set ..WithName=oldwith
}

Method xrefCDEFAttributeViewquery(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="AttributeViewquery")
{
		
	Set ..InView=1	
	Set ..CalledByItemName="" ; no name until we hit columns
	Set ..SqlProgramAnalyser=""
	Quit ""
}

Method xrefCDEFClassQuery(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassQuery")
{
    Set ..SqlProgramAnalyser=""
	Quit ""
}

Method xrefCDEFClassDefinition(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassDefinition")
{
	Set cnameE=element.findFirstElementByType("ClassName")
	If $ISOBJECT(cnameE) {
		Set ..CalledByClassName=cnameE.ToString(0)
	}
	Quit ""
}

Method xrefCDEFItemName(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="PropertyName,MethodName,ClassParameterName,IndexName,TriggerName,ForeignkeyName,StorageName,QueryName,XdataName")
{
	Set name=element.ToString(0)
	Set ..CalledByItemName=name        
	Set ..ClassElementLineNumber=element.FirstAtom().line
	Set overrides=""
	If $LISTFIND($LISTBUILD("MethodName"),element.type) {
		Set overrides=..ClassServer.GetMethodOverrides(..CalledByClassName_"||"_name)
	}
	If $LISTFIND($LISTBUILD("PropertyName"),element.type) {
		Set overrides=..ClassServer.GetPropertyOverrides(..CalledByClassName_"||"_name)
	}
	If $LISTFIND($LISTBUILD("ClassParameterName"),element.type) {
		Set overrides=..ClassServer.GetParameterOverrides(..CalledByClassName_"||"_name)
	}
	If overrides'="" {
		Set ..CalledByCommand="Override" 
		Do ..SaveCDEFCref(overrides,..ClassElementLineNumber,name)
	}
	Quit ""
}

Method xrefCDEFMethodReference(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="MethodReference")
{
	Set name=element.ToString(0)
	Set a=element.FirstAtom()
	Do ..SaveCDEFCref(..CalledByClassName,a.line,name)
	Quit ""
}

Method xrefCDEFClassReference(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassReference")
{
	Set name=element.ToString(0)
	Set a=element.FirstAtom()
	Do ..SaveCDEFCref(name,a.line)
	Quit ""
}

Method xrefCDEFOneClassmember(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="OneClassmember")
{
	Set ..Analyser=##class(PXW.DEV.BNF.Analyse.COS).%New(..ClassServer)
	Set ..Analyser.This=..CalledByClassName
	If ..Analyser Do ..Analyser.checkElement(element)

	Set item=element.partsGetAt(1)
	Set typeE=item.partsGetAt(1)
	Set ..ThisItemType=typeE.ToString(0)
	Quit ""
}

Method xrefCDEFTypeClassReference(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="TypeClassReference")
{
	;Element=TypeClassReference PXW.DEV.BNF.Element @134
    ;.Element=ClassReference PXW.DEV.BNF.Element @310
    ;..type=ClassReference:
    ;.. %String
    ;.Element=TypeParameters PXW.DEV.BNF.Element @208
    ;..type=punctuation:
    ;.. (
    ;..Element=TypeParametersList PXW.DEV.BNF.Element @86
    ;...Element=TypeParameterItem PXW.DEV.BNF.Element @385
    ;....Element=ClassItemIdentifier PXW.DEV.BNF.Element @347
    ;.....type=ClassItemIdentifier:
    ;..... MAXLEN
    ;....type=punctuation:
    ;.... =
    ;....Element=Number PXW.DEV.BNF.Element @309
    ;.....type=Number:
    ;..... 1
    ;..type=punctuation:
    ;.. )
	Set crefE=element.findFirstElementByType("ClassReference",0)
	If $ISOBJECT(crefE) {
		Set class=crefE.ToString(0)
	
		Set paramE=element.findFirstElementByType("TypeParameters",0)
		If $ISOBJECT(paramE) {
			Set list=##class(%ListOfObjects).%New()
			Do paramE.findElementsByType("ClassItemIdentifier",list,2)
			For i=1:1:list.Count() {
				Set itemE=list.GetAt(i)
				Set a=itemE.FirstAtom()
				;d ..wrapElementHTML(itemE,"<a href='"_##class(PXW.Tools.DEV.Class).HREFTo(class,itemE.ToString(0),,,..This)_"'>","</a>")
				Set ..CalledByCommand="Override" 
				If $LISTFIND($LISTFROMSTRING("Property","Relationship"),..ThisItemType) {
					;Do ..wrapElementHTML(itemE,"<a href='"_..HREFToClass(..This,..ThisMethod,itemE.ToString(0))_"'>","</a>")
					If ..ClassServer.GetPropertyParameterDetails(..CalledByClassName,..CalledByItemName,itemE.ToString(0),.ppsource) {
						Do ..SaveCDEFCref(ppsource,a.line,itemE.ToString(0))
					}
				} Else {
					Do ..SaveCDEFCref(class,a.line,itemE.ToString(0))
				}
			}
		}
	}

	Quit ""
}

Method xrefCDEFXdataSql(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="XdataSql")
{
    Set ..SqlProgramAnalyser=""
    Quit ""
}

/*
Method xrefCDEF(element as PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="")
{
	quit ""
}
*/
Method xrefCOSClassExpression(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassExpression")
{
	Set classnameele=element.findFirstElementByType("ClassReference",0)
	Set classname=classnameele.ToString(0)
	Do ..FollowObjectChainForType(element,classname)
	Quit ""
}

Method xrefCOSSqlBody(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="SqlBody")
{
    Set ..SqlProgramAnalyser=""
    Quit ""
}

Method xrefCOSThisThing(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="ThisObject,ThisObjectDirectProperty,ThisObjectSet,ThisObjectDirectPropertySet")
{
	If ..CalledByClassName'="" {
		Set classname=..CalledByClassName
		If classname'="" Do ..FollowObjectChainForType(element,classname)
	}
	Quit ""
}

Method xrefCOSVariable(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="Variable,VariableSet,ObjectVariable")
{
	Set variablename=element.ToStringAtomsOnly(0)
	; variable could be something like {*} or {field}  so the name above (using atoms only) will not find anything
	; don't worry about that at the moment!
	If variablename'="" {
		; when working out a type use the #DIM type if there is one
		Set classname=$GET(..Analyser.DimmedTypes(variablename))
		If classname="" {
			Set classname=$GET(..Analyser.VariablesTypes(variablename))
		}
		If classname'="" {
			Do ..FollowObjectChainForType(element,classname)
		}
	}
	Quit ""
}

Method xrefCOSGlobal(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="GlobalRef,GlobalRefs")
{
	Set setmode="fetch"
	If element.type="GlobalRefSet" Set setmode="SET"

	Set fullrefE=element.findFirstElementByType("GlobalRefFull",0)
	If $ISOBJECT(fullrefE) {
		; On a global clicking on the ^ will take directly to the XREF since we don't
		; have any other details about the global at the moment.
		; Clicking on the name of the global highlights it like a regular variable
		Set globalElement=fullrefE.findFirstElementByType("GlobalName",0)
		Set upa=fullrefE.FirstAtom() ; ^ is always at the start
		Set namea=globalElement
		If $ISOBJECT(namea) {
			Set subsE=fullrefE.findFirstElementByType("SubscriptParameterList",0)
			Set subs=$SELECT($ISOBJECT(subsE):..Analyser.SimplifySubscripts(subsE),1:"")
			Do ..SaveCOSXref("GBL",namea.ToStringAtomsOnly(0),subs,setmode,upa)            
		}
	} Else {
		; not sure what we can do with naked refs here (other than make them stand out as a bad thing)
	}
	Quit ""
}

Method xrefCOSMacrocall(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="Macrocall")
{
	Set atom=element.FirstAtom()
	Set macroname=element.ToString(0)
	Set macroname=$PIECE(macroname,"(",1)
	If macroname?1"$$$"1.E {
		Set macroname=$PIECE(macroname,"$$$",2)
	}
	If ..ClassServer.GetMacroLocation(..CalledByClassName,macroname,.source) {
		If source'="" {
			; includename.inc is returned so file as INC and remove this from the name
			;Set type=$$$UPPER($PIECE(source,".",*))
			Set source=$PIECE(source,".",1,*-1)
			Do ..SaveCOSXref("INC",source,macroname,"_macro",atom)
		}
	}
	Quit ""
}

/*
Method xrefCOS(element as PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="")
{
	quit ""
}
*/
Method xrefSQLProgram(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="QuerySpecification")
{
    If ..SqlProgramAnalyser="" {
		Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
    	Set sqlanalyse.This=..CalledByClassName
    	Set sqlanalyse.SqlProgram=1
    	Do sqlanalyse.checkElement(element)
    	Set ..SqlProgramAnalyser=sqlanalyse
	}
	Quit ""
}

Method xrefSQLSelectCommand(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="SelectCommand")
{
	#dim cref as PXW.DEV.Element
	Do ..SQLInternalXREF(element)
    If $ISOBJECT(..SqlProgramAnalyser) {
        Set sqlanalyse=$GET(..SqlProgramAnalyser.SelectCommandAnalysis(+element))
    } Else {
        ; certain types of subquery are not being coverded by the program analyse yet, so treat separately for now
        Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
        Set sqlanalyse.This=..CalledByClassName
        Do sqlanalyse.checkElement(element)
    }
	Set cref=""
	While sqlanalyse.NextColumnReference(.cref,.fulltable,.fieldname) {
		Kill CalledByItem
		If fulltable'="" {
			If ..InView {
				Set CalledByItem=""_$GET(..SQLPaths(+cref),"unk")
			}
			Kill patharray

			If $DATA(sqlanalyse.withReferences(fulltable)) {
				If ..InView {
					Set atom=cref.FirstAtom()
					Set command=element.type					
					; if this is a reference to a field in a "WITH" table then file a xref to it
					Do ..SaveSQLXref("CLS",..CalledByClassName,fulltable_"."_fieldname,command,atom,.CalledByItem)
				}
			} Else {
				Do ..ClassServer.GetClassPathFromTable(fulltable,fieldname,.patharray)			
				Set atom=cref.FirstAtom()
				Set command=element.type
				For i=1:1:$GET(patharray) {
					Set data=patharray(i)
					Set class=$LISTGET(data,1),item=$LISTGET(data,2)
					If class'="",item'="" {
						Do ..SaveSQLXref("CLS",class,item,command,atom,.CalledByItem)
					} 
				}
			}
		} Else {
			If ..InView {
				Set aliasNameE=cref.findFirstElementByType("AliasName",0)
				Set columnNameE=cref.findFirstElementByType("ColumnName",0)
				Set command=element.type
				Set atom=cref.FirstAtom()
				Set CalledByItem=""_$GET(..SQLPaths(+cref),"unk")
				If $ISOBJECT(aliasNameE),$ISOBJECT(columnNameE) {
					Do ..SaveSQLXref("CLS",..CalledByClassName,aliasNameE.ToString(0)_"."_columnNameE.ToString(0),command,atom,.CalledByItem)
				}
			}
		}

	}

	Quit ""
}

Method xrefSQLInsertCommand(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="InsertCommand")
{
	Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
	Set sqlanalyse.This=..CalledByClassName
	Do sqlanalyse.checkElement(element)
	Set columnNameE=""
	While sqlanalyse.NextColumnReference(.columnNameE,.fulltable,.fieldname) {
		Kill patharray
		Do ..ClassServer.GetClassPathFromTable(fulltable,fieldname,.patharray)
		Set atom=columnNameE.FirstAtom()
		Set command=element.type
		For i=1:1:$GET(patharray) {
			Set data=patharray(i)
			Set class=$LISTGET(data,1),item=$LISTGET(data,2)
			If class'="",item'="" {
				Do ..SaveSQLXref("CLS",class,item,command,atom)
			}
		}
	}
	Quit ""
}

Method xrefSQLDeleteCommand(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="DeleteCommand")
{
	Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
	Set sqlanalyse.This=..CalledByClassName
	Do sqlanalyse.checkElement(element)
	Set columnNameE=""
	Kill tables
	While sqlanalyse.NextColumnReference(.columnNameE,.fulltable,.fieldname) {
		Kill patharray
		Do ..ClassServer.GetClassPathFromTable(fulltable,fieldname,.patharray)
		Set atom=columnNameE.FirstAtom()
		Set command=element.type
		For i=1:1:$GET(patharray) {
			Set data=patharray(i)
			Set class=$LISTGET(data,1),item=$LISTGET(data,2)
			If class'="",item'="" {
				Do ..SaveSQLXref("CLS",class,item,command,atom)
				If '$DATA(tables(class)) {
					Set tabatom=element.FirstAtom()
					Do ..SaveSQLXref("CLS",class,"_table",command,tabatom)
					Set tables(class)=1
				}
			}
		}
	}
	Quit ""
}

Method xrefSQLStoredProcName(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="StoredProcName")
{
	Set spNameE=element
	If $ISOBJECT(spNameE) {
		Set spname=spNameE.ToString(0)
		Set class=..ClassServer.GetClassNameFromStoredProc(spname,.method,..CalledByClassName)
		Set cbk2=$GET(..SQLPaths(+element),"unk")
		If class'="" {
			Set atom=element.FirstAtom()
			Set command=element.type
			Do ..SaveSQLXref("CLS",class,method,command,atom,cbk2)
		}
	}
	Quit ""
}

/*
Method xrefSQL(element as PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="")
{
	quit ""
}
*/
Method FollowObjectChainForType(ParentElement As PXW.DEV.Element, StartClassName As %String)
{
    If (ParentElement.type="ThisObject") || (ParentElement.type="ThisObjectSet") {
        Set this=ParentElement.findFirstElementByType("ThisObjectSelf",0) ; ..property
        If $ISOBJECT(this) {
            Set objectchain=this.findFirstElementByType("ObjectChainNoDot",0)
        } Else {
            Set this=ParentElement.findFirstElementByType("ThisObjectThis",0) ; $this.property
            If $ISOBJECT(this) {
                Set objectchain=this.findFirstElementByType("ObjectChain",0)
            }
        }
    } ElseIf (ParentElement.type="ThisObjectDirectProperty") || (ParentElement.type="ThisObjectDirectPropertySet") {
        Set objectchain=ParentElement.findFirstElementByType("ObjectChainItem",0) ; i%property
    } Else {
        Set objectchain=ParentElement.findFirstElementByType("ObjectChain",1) ; var.property
    }
    Set path="",sep=""
    While $ISOBJECT(objectchain) {
        
        Set propertyatom=""
        ; the objectchain has the "." and the name
        For  {
            Set a=objectchain.partsGetNext(.akey)
            Quit:akey=""

            If a.%IsA("PXW.DEV.Atom"),a.value'="." {
                Set propertyatom=a
            }
        }

        Set path=path_sep_propertyatom.value,sep="."
		;d ..wrapAtomHTML(propertyatom,"<a class='COSObjectsProperty' href='"_##class(PXW.Tools.DEV.Class).HREFTo(StartClassName,path)_"'>","</a>")

        Set objectchain=objectchain.findFirstElementByType("ObjectChain",0) 
    }
	If path'="" {
		Do ..ClassServer.GetClassPath(StartClassName,path,.patharray)
		Set atom=ParentElement.FirstAtom()
		Set command=ParentElement.type
		For i=1:1:$GET(patharray) {
			Set data=patharray(i)
			Set class=$LISTGET(data,1),item=$LISTGET(data,2)
			If $EXTRACT(item,1)="#" Set item=$EXTRACT(item,2,*) ; strip the # from parameters
			If class'="",item'="" {
				Do ..SaveCOSXref("CLS",class,item,command,atom)
			}
		}
	}
}

/// Recursive, pass in Element, get out the ..Index of what element is where on the path, path is the current path
Method SQLInternalXREF(Element As PXW.DEV.Element, table As %String = "", column As %String = "")
{
	If '$DATA(..SQLPaths(+Element)) {

		If Element.type="SubquerySpecification" {
			
		}

		If Element.type="DerivedTable" {
			Set TableAsClauseE=Element.findFirstElementByType("TableAsClause",0)
			If $ISOBJECT(TableAsClauseE) {
				Set TableNameE=TableAsClauseE.findFirstElementByType("AliasName",0)
				If $ISOBJECT(TableNameE) {
					Set table=TableNameE.ToString(0)
					Set column=""
				}
			}
		}
		If Element.type="DerivedColumn" {
			Do ##class(PXW.DEV.BNF.Analyse.SQL).GetDerivedColumnInfo(Element,.colname)
			If column="" Set column=colname 
		}
		Set ..SQLPaths(+Element)=$SELECT(column'="":"column:"_$SELECT(table'="":$$$UPPER(table)_".",..WithName'="":$$$UPPER(..WithName)_".",1:"")_$$$UPPER(column),1:"")
		Set ..SQLPaths(+Element,"string")=Element.ToString(0)
		Set akey=""
		For  {
			Set atom=Element.partsGetNext(.akey)
			Quit:akey=""
			
			If atom.%IsA("PXW.DEV.Element") {
				Do ..SQLInternalXREF(atom,table,column)
			}
		}
	}
}

}
