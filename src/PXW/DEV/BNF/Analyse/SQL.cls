Class PXW.DEV.BNF.Analyse.SQL Extends PXW.DEV.BNF.Analyse.analyser
{

Parameter CodeType = "CLS";

Parameter Language = "SQL";

Property ClassServer As PXW.DEV.Dictionary.ClassDefinitionObject;

Property SqlProgram As %Boolean;

/// Keyed by column reference element
/// the data is $lb(fulltablereference,fullfieldname)
/// where fullfieldname is all the implicit joins strung together
Property columnReferences As %List [ MultiDimensional ];

Property columnReferencesElement [ MultiDimensional ];

/// SelectedColumnsByName(colname)=table
Property SelectedColumnsByName [ MultiDimensional ];

Property WithClauseAnalysis As PXW.DEV.BNF.Analyse.SQL [ MultiDimensional ];

/// Keyed by alias
Property tableReferences As PXW.DEV.Element [ MultiDimensional ];

/// keyed by alias
Property withReferences As PXW.DEV.Element [ MultiDimensional ];

/// keyed by element
Property SelectCommandAnalysis As PXW.DEV.BNF.Analyse.SQL [ MultiDimensional ];

Method %OnNew(ClassServer As PXW.DEV.Dictionary.ClassDefinitionObject = "") As %Status
{
	Set ..ClassServer=ClassServer
	Quit $$$OK
}

/// Full table should be full_table.name 
Method SetColumnReference(element As PXW.DEV.Element, fulltable As %String, fullfieldname As %String)
{
    Set ..columnReferences(+element)=$LISTBUILD(fulltable,fullfieldname)
    Set ..columnReferencesElement(+element)=element
}

Method GetColumnReference(element As PXW.DEV.Element, Output fulltable As %String, Output fullfieldname As %String)
{
    Set list=$GET(..columnReferences(+element))
    Set fulltable=$LISTGET(list,1)
    Set fullfieldname=$LISTGET(list,2)
}

Method NextColumnReference(ByRef element As PXW.DEV.Element, Output fulltable As %String, Output fullfieldname As %String) As %Boolean
{
    Set found=0
    Set key=+element
    Set key=$ORDER(..columnReferencesElement(key))
    If key'="" {
        Set element=$GET(..columnReferencesElement(key))
        Do ..GetColumnReference(element,.fulltable,.fullfieldname)
        Set found=1
    }
    Quit found
}

Method checkElement(element As PXW.DEV.Element)
{
    If element.type="QuerySpecification" {
        Do ..SqlProgramCheck(element)
    }
    If element.type="WithCommand" {
        Do ..WithCommand(element)
    }
    If element.type="SelectCommand" {
        Do ..SelectCommand(element)
    }
    If element.type="InsertCommand" {
        Do ..InsertCommand(element)
    }
    If element.type="DeleteCommand" {
        Do ..DeleteCommand(element)
    }
}

Method SqlProgramCheck(element As PXW.DEV.Element)
{
    #dim a as PXW.DEV.Atom
    If element.type="WithCommand" {
        Do ..WithCommand(element)
    }
    If element.type="SelectCommand" {
        set sqlanalyse=..%New(..ClassServer)
        Set sqlanalyse.This=..This
        Merge sqlanalyse.withReferences=..withReferences
        Do sqlanalyse.checkElement(element)
        Set ..SelectCommandAnalysis(+element)=sqlanalyse
    }
	For  {
		Set part=element.partsGetNext(.akey)
		Quit:akey=""
		
	    If part.%IsA("PXW.DEV.Element") {
			Do ..SqlProgramCheck(part)
		} ElseIf part.%IsA("PXW.DEV.Atom") {
            ;
		}
	}
}

Method WithCommand(element As PXW.DEV.Element)
{
   #dim withClauseList as %ListOfObjects
	Do element.findElementsByType("WithClause",.withClauseList)
	;zw element,withClauseList
	For i=1:1:withClauseList.Count() {
		#dim withE as PXW.DEV.Element
		Set withE=withClauseList.GetAt(i)
		Set aliasE=withE.findFirstElementByType("AliasName")
 	    If $ISOBJECT(aliasE) {
 		    Set aliasname=aliasE.ToString(0)
			Set selectE=withE.findFirstElementByType("SelectCommand")
			Set analyser=..%New()
			Set analyser.ClassServer=..ClassServer
			Do analyser.SelectCommand(selectE)
			Set ..WithClauseAnalysis(aliasname)=analyser
            Set ..withReferences(aliasname)=withE
	    }
	}
}

Method SelectCommand(element As PXW.DEV.Element)
{
    #dim from as PXW.DEV.Element
    Set from=""
    Set tableexpE=element.findFirstElementByType("TableExpression",0)
    If $ISOBJECT(tableexpE) {
        Set from=tableexpE.findFirstElementByType("FromClause",0)
    }
    Kill tableelements,tables,columnelements,columns
    If $ISOBJECT(from) {
        Do ..findElementsByTypeNoSubQueries(from,"TableReference",.tableelements)
        Do ..findElementsByTypeNoSubQueries(from,"Join",.joins)
        If $ISOBJECT($GET(joins)) {
            For ji=1:1:joins.Count() {
                Do ..findElementsByTypeNoSubQueries(joins.GetAt(ji),"TableReference",.tableelements)
            }
        }
        If $ISOBJECT($GET(tableelements)) {
            #dim tref
            For ti=1:1:tableelements.Count() {
                Set tablename="",tablealias=" "
                Set tref=tableelements.GetAt(ti)
                ;w "<pre>tref="_tref.ToString(0)_"</pre>"
                Set tablenameE=tref.findFirstElementByType("TableName")
                If $ISOBJECT(tablenameE) Set tablename=tablenameE.ToString(0)
                ;w "<pre>" d tablenameE.write() zw tablename w "</pre>"
                Set tablealiasE=tref.findFirstElementByType("AliasName")
                If $ISOBJECT(tablealiasE) Set tablealias=tablealiasE.ToString(0)
                Set tables(tablealias)=tablename
                Set ..tableReferences(tablealias)=tref
            }
        }

        ; Work out all the column references and which tables they are on.
        ; This includes all the joins and where clauses etc
        ; eg SELECT col1,col2,col1+col2 as total FROM table WHERE col3=1
        ; will index col1,col2 and col3, with col1 and col2 referenced several times
        Do ..findElementsByTypeNoSubQueries(element,"ColumnReference",.columnelements)
        If $ISOBJECT($GET(columnelements)) {
            For ci=1:1:columnelements.Count() {
                Set columnname="",tablealias="",columnjoin=""
                Set cref=columnelements.GetAt(ci)
                Set fulltable=..FindTable(cref,.tables)
                Set columnnameE=cref.findFirstElementByType("ColumnName",0)
                If $ISOBJECT(columnnameE) Set columnname=columnnameE.ToString(0)
                Set columnjoinE=cref.findFirstElementByType("ColumnReferenceImplicit",0)
                If $ISOBJECT(columnjoinE) Set columnjoin=columnjoinE.ToString(0)

                ; wrap the entire column up as a single thing and work out later what 
                ; it refers to if its clicked on. EG Race->Circuit->Name
                If fulltable'="" {
                    Do ..SetColumnReference(cref,fulltable,columnname_columnjoin)
                } Else {
                    Do ..SetColumnReference(cref,"",columnname_columnjoin)                        
                }
            }
        }

        ; Work out all the column references and which tables they are on.
        ; This includes all the joins and where clauses etc
        ; eg SELECT col1,col2,col1+col2 as total FROM table WHERE col3=1
        ; will index col1,col2,total with col1 and col2 having information about which table they relate to.
        Do ..findElementsByTypeNoSubQueries(element,"DerivedColumn",.derivedColumns)
        If $ISOBJECT($GET(derivedColumns)) {
            For ci=1:1:derivedColumns.Count() {
                Set colE=derivedColumns.GetAt(ci)
                Set colname="unknown"_ci
                Do ..GetDerivedColumnInfo(colE,.colname,.cref)
                ;zw colE,colname
                Set fulltable=..FindTable(cref,.tables)
                Set ..SelectedColumnsByName(colname)=fulltable
            }
        }
    }
    ;w "<pre>" zw $this w "</pre>"
}

/// Pass in an element of type DerivedColumn and a default name. 
/// DervivedColumns are columns from the select list, 
/// SELECT col1,col2,col1+col2 as total FROM table WHERE col3=1
/// col1,col2 and total are the DerivedColumns, 
/// col1 and col2 will return the ColumnReference type element because they are direct refs to a table
/// For cols that use implict joins only the first table in the chain is returned.
ClassMethod GetDerivedColumnInfo(DerivedColumn As PXW.DEV.Element, ByRef ColName As %String, Output ColumnReference As PXW.DEV.Element)
{
    Set ColName="unknown"
    Set ColumnReference=""
    ; if the column is just a reference to another column
    Do DerivedColumn.findElementsByType("ColumnReference",.colrefs,2)
    If $ISOBJECT($GET(colrefs)),colrefs.Count()=1 {
        Set ColumnReference=colrefs.GetAt(1)
        Set colnameE=colrefs.GetAt(1).findFirstElementByType("ColumnName",0)
        If $ISOBJECT(colnameE) {
            Set ColName=$$$UPPER(colnameE.ToString(0))
        }
    }
 
    Set asclause=DerivedColumn.findFirstElementByType("AsClause",0)
    If $ISOBJECT(asclause) {
        Set colnameE=asclause.findFirstElementByType("ColumnName",0)
        If $ISOBJECT(colnameE) {
            Set ColName=$$$UPPER(colnameE.ToString(0))
        }
    } 
    ; remove quotes surrounding any names
    Set ColName=$TRANSLATE(ColName,"""","")
}

Method InsertCommand(element As PXW.DEV.Element)
{
    #dim from as PXW.DEV.Element
    Set tableE=element.findFirstElementByType("DirectTable",0)
    If $ISOBJECT(tableE) {
        Set table=tableE.ToString(0)

        Set methodE=element.findFirstElementByType("InsertMethod")
        Set methodFirstE=methodE.partsGetAt(1)
        If methodFirstE.type="InsertValuesList" {
            Do ..findElementsByTypeNoSubQueries(methodE,"ColumnName",.columnelements)
            If $ISOBJECT($GET(columnelements)) {
                For ci=1:1:columnelements.Count() {
                    Set columnnameE=columnelements.GetAt(ci)
                    Set columnname=columnnameE.ToString(0)
                    Set fulltable=..ClassServer.GetFullTableName(table,..This)
                    Do ..SetColumnReference(columnnameE,fulltable,columnname)
                    
                }
            }
        }
    }
}

Method DeleteCommand(element As PXW.DEV.Element)
{
    #dim from as PXW.DEV.Element
    Set tableE=element.findFirstElementByType("DirectTable",0)
    If $ISOBJECT(tableE) {
        Set table=tableE.ToString(0)

        Do ..findElementsByTypeNoSubQueries(element,"ColumnName",.columnelements)
        If $ISOBJECT($GET(columnelements)) {
            For ci=1:1:columnelements.Count() {
                Set columnnameE=columnelements.GetAt(ci)
                Set columnname=columnnameE.ToString(0)
                Set fulltable=..ClassServer.GetFullTableName(table,..This)
                Do ..SetColumnReference(columnnameE,fulltable,columnname)          
            }
        }
    }
}

ClassMethod findElementsByTypeNoSubQueries(Object As PXW.DEV.Element, Type As %String, ByRef OutputList As %ListOfObjects)
{
    #dim ele as PXW.DEV.Element
    If Object.type=Type {
        If '$ISOBJECT($GET(OutputList)) { 
            Set OutputList=##class(%Library.ListOfObjects).%New()
        }
        Do OutputList.Insert(Object)				
    }
	For i=1:1:Object.partsCount() {
		Set ele=Object.partsGetAt(i)
		If ele.%IsA("PXW.DEV.Element") {
            Set derived=ele.findFirstElementByType("DerivedTable",0)
            Set subquery=ele.findFirstElementByType("SubquerySpecification",0)
			If $ISOBJECT(derived) || $ISOBJECT(subquery) {
				; do nothing for select
			} Else {
				Do ..findElementsByTypeNoSubQueries(ele,Type,.OutputList)
			}
		}
	}
}

/// Pass in an element of type ColumnReference, and the known tables keyed by alias
/// returns the full table name of the column
Method FindTable(cref As PXW.DEV.Element, ByRef tables) As %String
{
    If '$ISOBJECT(cref) Quit ""

    Set columnname="",tablealias=""
    Set tablealiasE=cref.findFirstElementByType("AliasName")
    If $ISOBJECT(tablealiasE) Set tablealias=tablealiasE.ToString(0)
    Set columnnameE=cref.findFirstElementByType("ColumnName",0)
    If $ISOBJECT(columnnameE) Set columnname=columnnameE.ToString(0)

    ; if there is no alias and there is 1 table only then we can use that as the alias
    ; note than on SUB SELECTS the parent tables are available.
    If tablealias="",$ORDER(tables(""))=$ORDER(tables(""),-1) Set tablealias=$ORDER(tables("")) 
    ; if still not found then try all the tables looking for one that has this field
    ; note the array will have " " as the first key, which means if this is a sub select then likely the first one will be the current table
    ; this solves solves the issue of sql like this:
    ; SELECT res.Code ,
    ;        (select Code from f1_data.race where id=res.Race)
    ; FROM f1_data.result as res
    ; we want the Code on the sub select to be from RACE rather than the parent "res"
    ;w !,"tabelalias="_tablealias_",columnname="_columnname_", coltext="_cref.ToString(0)
    If tablealias="" {
        Set a2=""
        For  {
            Set a2=$ORDER(tables(a2))
            Quit:a2=""
            ;s class=$g(tables($$$UPPER(a2)))
            Set table=$GET(tables(a2))
            If table'="",$ISOBJECT(..ClassServer) {
                Set class=..ClassServer.GetClassNameFromTableName(table,..This)   
                Set pname=..ClassServer.GetPropertyNameSQL(class,columnname)
                If pname'="" {
                    Set tablealias=a2
                    Quit  
                }
            }
        }
    }
    
    Set fulltable=""
    If tablealias'="" {
        Set fulltable=$GET(tables(tablealias))
        If fulltable="" {
            ; table not found by looking up the alias so maybe the alias is the table name:
            ; SELECT race.* FROM f1_data.race
            Set ta=""
            For  {
                Set ta=$ORDER(tables(ta),1,ft)
                Quit:ta=""

                If $PIECE(ft,".",*)=tablealias {
                    Set fulltable=ft
                    Set:$ISOBJECT(..ClassServer) fulltable=..ClassServer.GetFullTableName(fulltable,..This)
                }
            }
        } Else {
             If '$DATA(..withReferences(fulltable)) {
                Set:$ISOBJECT(..ClassServer) fulltable=..ClassServer.GetFullTableName(fulltable,..This)
            }
         }
    }
    Quit fulltable
}

}
