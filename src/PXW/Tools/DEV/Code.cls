/// Redirects to the correct viewer based on the type of code to be viewed
Class PXW.Tools.DEV.Code Extends PXW.Tools.Page
{

ClassMethod WriteMainBody(ByRef scratch)
{

    Do ..HREFFrom(.CodeReference,.utype,.name)
    if utype="DIRECTRUN" {
        do $CLASSMETHOD(name,"WriteMainBody",.scratch)
    } else {
        If name'="" {
            ; no type so do lookup
            If utype="" {
                Do ..WriteCodeList(utype,name)
            } Else {
                ; name is not known
                If name["*" {
                    Do ..WriteCodeList(utype,name)
                } Else {
                    ;Do ..WriteCode(utype,name)
                    Write "No direct link yet"
                }
            }
        } Else {
            Write "Nothing to search for"
        }
    }
}

ClassMethod WriteCodeList(Type As %String, Name As %String)
{
    Write "<table>"
    Write "<thead>"
    Write "<tr><th>Type</th><th>SubType</th><th>Name</th><th>Modified</th></tr>"
    Write "</thead><tbody>"
    
    If Name'="" {
        Set rs=##class(%Library.ResultSet).%New(..%ClassName(1)_":"_"SelectTypes")
        $$$ThrowOnError(rs.Execute(%NS,Type))

        While rs.%Next() {
            Set typ=rs.%Get("Type")
            Set page=rs.%Get("Page")
            Set interface=##class(PXW.DEV.Dictionary.CodeInterface).%OpenId(rs.%Get("ID"))
            Set rs2=interface.List(Name)
            While interface.ListNext(rs2,.subtyp,.name,.timechanged,.id) {
                Write "<tr>"
                Write "<td>"_..EscapeHTML(typ)_"</td>"
                Write "<td>"_..EscapeHTML(subtyp)_"</td>"
                Write "<td>"
                If page="" {
                    Write "<span title='CodeType ("_typ_") has no display page defined'>"
                    Write ..EscapeHTML(name) 
                    Write "</span>"
                    
                } Else {
                    Write "<a class='"_$$$classProgramName_"' href='"_$CLASSMETHOD(page,"HREFToID",id,name,subtyp)_"'>"
                    Write ..EscapeHTML(name) 
                    Write "</a>"
                }
                Write "</td>"
                Write "<td>"_..EscapeHTML(timechanged)_"</td>"
                Write "</tr>",!
            }
        }
    }

    Write "</tbody></table>"
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
    ; Work out what type of code is being searched, eg *.CLS
    Do ..HREFFrom(.CodeReference,.utype,.name)

    if utype="DIRECTRUN" {
        do $CLASSMETHOD(name,"WriteNav",.scratch)
    } else {
        Set type=$PIECE(CodeReference,".",*)
        Set utype=$$$UPPER(type)

        If ##class(PXW.DEV.Dictionary.CodeType).%ExistsId(utype) {
            Set name=$PIECE(CodeReference,".",1,*-1)
        } Else {
            Set name=CodeReference
            Set utype=""
        }
        Set rs=##class(%Library.ResultSet).%New(..%ClassName(1)_":"_"SelectTypes")
        $$$ThrowOnError(rs.Execute(%NS,""))

        While rs.%Next() {
            Set cref=name_"."_rs.%Get("Type")
            Set class=$s($$$UPPER(rs.%Get("Type"))=utype:"class='"_$$$classHilite_"'",1:"")
            Write "<a "_class_" href='"_..HREFTo(cref)_"'>"_..EscapeHTML(cref)_"</a>",!
        }

        ; find all tools that match    
        Write "<hr>" 
        Set rs=##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
        $$$THROWONERROR(sc,rs.Execute(##class(PXW.Tools.Page).%ClassName(1)))
        
        Set pattern=""
        For i=1:1:$LENGTH(CodeReference,"*") {
            Set part=$PIECE(CodeReference,"*",i)
            If part'="" {
                Set pattern=pattern_"1"""_$$$UPPER(part)_""""
            }
            If i<$LENGTH(CodeReference,"*") {
                Set pattern=pattern_"0.E"
            } 
        }
        While rs.Next() {
            Set name=rs.Data("Name")
            Set HREFto=##class(%Dictionary.MethodDefinition).%OpenId(name_"||HREFTo")
            If $isobject(HREFto),name'=..%ClassName(1) {
                ;If (pattern="") || (name?@pattern) || ($PIECE(name,".",*)?@pattern) {
                If (pattern="") || ($$$UPPER(name)?@pattern) {
                    Set type=$PARAMETER(name,"ToolType")
                    Set css="toolTypeInternal"
                    If $$$UPPER(type)="CODE" Set css="toolTypeCode"
                    Write "<a class='"_css_"' href='"_$CLASSMETHOD(name,"HREFTo")_"'>"_..EscapeHTML(name)_"</a>",!
                }
            }
        }
    }
}

/// Write out extra javascript here, the SCRIPT tags are already in place.
ClassMethod WriteScripts()
{
    Do ..HREFFrom(.CodeReference,.utype,.name)

    if utype="DIRECTRUN" {
        do $CLASSMETHOD(name,"WriteScripts")
    } else {
    }
}

/// Write out extra styles here, the STYLE tags are already in place.
/// <p>
/// Be careful with putting colours in here. You do not know how the colours will 
/// work with the current %STYLE selected by the user.
/// </p><p> 
/// You can put layout changing things here, EG if a page needs extra DIVs
/// the layout information can go here. 
/// </p>
ClassMethod WriteStyles()
{
    Do ..HREFFrom(.CodeReference,.utype,.name)

    if utype="DIRECTRUN" {
        do $CLASSMETHOD(name,"WriteStyles")
    } else {
    }
}

Query SelectTypes(Namespace As %String, Type As %String) As PXW.LIB.SQL.Query [ SqlProc ]
{
    SELECT ci.ID
        , ci.Namespace
        , ci.Type
        , cti.Class as Page
      FROM PXW_DEV_Dictionary.CodeInterface as ci
      LEFT OUTER JOIN PXW_DEV_Dictionary.CodeTypeIndex as cti
                    ON cti.Usage='CodeDisplay' AND cti.CodeType=ci.Type
      WHERE ci.Namespace=:Namespace
        AND ((:Type IS NULL) OR (ci.Type=:Type))
}

ClassMethod WriteHeadForm(Page As %String)
{
    Do ..HREFFrom(.CodeReference,.utype,.name)
    Set CR=$S(utype="DIRECTRUN":"",1:CodeReference)
    If Page=..%ClassName(1) {
        ;Do ..HREFFrom(.CR)
    } ElseIf Page="PXW.Tools.DEV.Class" {
        Do ##class(PXW.Tools.DEV.Class).HREFFrom(.CR)
        Set CR=$PIECE(CR,".",1,*-1)
        If CR'="" Set CR=CR_".*"
    }

    ; find all tools
    Set rs=##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	$$$THROWONERROR(sc,rs.Execute(##class(PXW.Tools.Page).%ClassName(1)))
	
    set datalist="<datalist id='toolsAvailable'>"
	While rs.Next() {
		Set name=rs.Data("Name")
		Set HREFto=##class(%Dictionary.MethodDefinition).%OpenId(name_"||HREFTo")
		If $isobject(HREFto) {
                ;Set type=$PARAMETER(name,"ToolType")
                ;Set css="toolTypeInternal"
                ;If $$$UPPER(type)="CODE" Set css="toolTypeCode"
                Set toolname=$PARAMETER(name,"ToolName")
                if toolname'="" {
                    set datalist=datalist_"<option value='"_..EscapeHTML(name_".DIRECTRUN")_"'>"_..EscapeHTML(toolname)_"</option>"
                }
        }
	}
    set datalist=datalist_"</datalist>"

   &html<
    <form id=toolsFormCodeReference action='PXW.Tools.DEV.Code.cls'>
					<fieldset id=toolsCodeReference>
						<legend>Code reference</legend>
						<input type=hidden name=IFRAME value='0'>
						<input type=hidden name=%NS value='#(%NS)#'>
						<input list=toolsAvailable autofocus accesskey=R placeholder="Class.Name.cls" size=20
							title='Enter Code Reference:#($CHAR(10))#routine.INT, package.name.CLS'
						type=text id=toolInputCodeReference name=CR value='#(CR)#' size=10>
						<input type=submit value='Go'>
					</fieldset>
				</form>
                #(datalist)#
    >
}

ClassMethod HREFFrom(Output CodeReference As %String, Output CodeType As %String, Output Name As %String)
{
	#define ReqGet(%name) %request.Get(%name)
	Set CodeReference=$$$ReqGet("CR")

    Set type=$PIECE(CodeReference,".",*)
    Set utype=$$$UPPER(type)

    If utype="DIRECTRUN" {
        set nam=$PIECE(CodeReference,".",1,*-1)
    } elseif ##class(PXW.DEV.Dictionary.CodeType).%ExistsId(utype) {
        Set nam=$PIECE(CodeReference,".",1,*-1)
    } Else {
        Set nam=CodeReference
        Set utype=""
    }
    Set CodeType=utype
    Set Name=nam
}

ClassMethod HREFTo(CodeReference As %String) As %String
{
	If $DATA(%NS) Set ons=%NS
	Set href=##super()
	If $DATA(ons) Set %NS=ons
	Set sep="&"
	Set href=href_sep_"CR="_..EscapeURL(CodeReference),sep="&"
	Quit href
}

}
