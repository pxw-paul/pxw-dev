Class PXW.Tools.DEV.Analysis.COS Extends PXW.Tools.DEV.HTML.output
{

Property This As %String;

Property ThisMethod As %String;

Property displaying As %String;

Property ClassServer As PXW.DEV.Dictionary.ClassDefinitionObject;

Method begin()
{
	Set ..displaying=""
}

Method middle(element As PXW.DEV.Element)
{
	Do ..writeElement(element)
}

Method end()
{
}

Method writeElement(element As PXW.DEV.Element)
{
	If element.type="OneClassmember" {
        ; a class memeber element is like this:
        ; Element=OneClassmember PXW.DEV.BNF.Element @1835 
        ; .Element=ClassMethod PXW.DEV.BNF.Element @1893
        ; ..type=keyword:/UdlStatement/ClassDefinition/ClassMemberSection/ClassMemberList/OneClassmember/ClassMethod
        ; .. Method
        ; ..Element=MethodName PXW.DEV.BNF.Element @1910
        ; ...Element=ClassItemIdentifier PXW.DEV.BNF.Element @1946
        Set item=element.partsGetAt(1)
        Set nameE=item.partsGetAt(2)
        If $LISTFIND($LISTBUILD("PropertyName","MethodName","ClassParameterName","IndexName","TriggerName","ForeignkeyName","StorageName","QueryName","XdataName"),nameE.type) {
            Set name=nameE.ToString(0)
            Set ..ThisMethod=name
      	}
		;d ..Reset()
        ;;w "<pre>RESET</pre>"
		;$$$DEBUG("Resetting")
		;;s ..ReturnType=element.ReturnType
        Set ..Analyser=##class(PXW.DEV.BNF.Analyse.COS).%New(..ClassServer)
        Set ..Analyser.This=..This
		Do ..Analyser.middle(element)
        ;zw ..Analyser


		/*m warnings=..Analyser.ElementWarnings
		s akey="" 
		f  {
			s akey=$o(warnings(akey))
			q:akey=""

			s line=warnings(akey)
			; new section
			i ..displaying="" {
				s ..displaying=..This
				d ..output("<br>")
			}
			s html="<span class='CDEFClassName'>"_$ZCONVERT(..This,"O","HTML")_"</span>:"
			s html=html_"<a class='COSObjectMember' href='"_##class(PXW.Tools.DEV.Class).HREFTo(..This,..ThisMethod)_"'>"_$ZCONVERT(..ThisMethod,"O","HTML")_"</a>"
			w !
			d ..output(html)
			d ..output($zconvert(" "_line,"O","HTML"))
		}*/
	} 

	
	For  {
		Set a=element.partsGetNext(.akey)
		Quit:akey=""
		
		If a.%IsA("PXW.DEV.Element") {
			Do ..writeElement(a)
		} Else {
			Do ..writeAtom(a)
		}
	}
}

/// The only method that should actually do any output during the middle processing.
/// This does not really write code, its just writing the description of the errors/warnings it finds.
/// In fact should it be working this way at all? 
Method writeAtom(atom As PXW.DEV.Atom)
{
	If $ISOBJECT(..Analyser),$DATA(..Analyser.ElementWarnings(+atom)) {
		Set line=..Analyser.ElementWarnings(+atom)
		; new section
		If ..displaying="" {
			Set ..displaying=..This
			Do ..output("<br>")
		}
        Set html="<span class='CDEFClassName'>"_$ZCONVERT(..This,"O","HTML")_"</span>:"
        Set html=html_"<a class='COSObjectMember' href='"_##class(PXW.Tools.DEV.Class).HREFTo(..This,..ThisMethod)_"'>"_$ZCONVERT(..ThisMethod,"O","HTML")_"</a>"
        Write !
        Do ..output(html)
        Do ..output($ZCONVERT(" "_line,"O","HTML"))
	}
}

}
