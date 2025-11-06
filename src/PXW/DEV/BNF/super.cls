Include (PXW.Debuggers.Macros, PXW.DEV.BNF.macros)

Class PXW.DEV.BNF.super Extends %RegisteredObject
{

Property stream As PXW.DEV.InputStream;

/// object containing any whitespace leading up to whatever object we are going to return
Property whitespace As PXW.DEV.Atom;

/// object containing any comment leading up to whatever object we are going to return
Property comment As PXW.DEV.Atom;

Property element As PXW.DEV.Element;

/// This gets set when the comment or whitespace check needs to be done
Property needsWScheck As %Boolean [ InitialExpression = 1 ];

/// Set to CDEF, COS
Property commentMode As %String [ InitialExpression = "COS" ];

Property streamlen As %Integer;

/// Set to 1 if you want to stop skipping whitespace at the end of line (eg #dim command)
Property stopAtEOL As %Boolean [ InitialExpression = 0 ];

/*
method stopAtEOLSet(val) as %Status
{
    $$$DEBUG("Setting stopAtEOL="_val_", "_$g(%path))
    s i%stopAtEOL=val
    q $$$OK 
}
*/
/// Set to 1 if you never want to skip whitespace (eg on postconditional)
Property stopAtWhitespace As %Boolean [ InitialExpression = 0 ];

/// temporary storge of the last keyword read
Property keyword As %String;

Parameter keywordAtomType = "Keyword";

/// temporary storage of last peek
Property peeked As %String;

Property peekedlen As %Integer;

/// copy of the stream
Property streaminput As %Integer;

/// a place to store things during the parsing, eg as a store of last result from recursion
Property memo As %String [ MultiDimensional ];

Parameter KeywordPattern = "1.A";

Method streamSet(val As PXW.DEV.InputStream) As %Status
{
    If $ISOBJECT(val) {
        Set i%stream=val
        Set ..streamlen=$LENGTH(val.input)
        Set ..streaminput=val.input
    }
    Quit $$$OK
}

ClassMethod test1(text As %String, method As %String, ByRef element As PXW.DEV.Element, debugToFile As %Boolean = 0, debuggerObject As PXW.Debuggers.Basic = "")
{
    New %path Set %path=""
    If debuggerObject="" {
        Set debugger="PXW.Debuggers.Basic"
        If debugToFile {
            Set debugger="PXW.Debuggers.BasicToFile"
        }
    } Else {
        Set debugger=debuggerObject
    }
    $$$DEBUGNew(debugger)
    $$$DEBUG("Testing="_text)
    $$$DEBUG("method="_method)
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    Set x=..%New()
    ;s x.element=element
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    $$$DEBUG("ok="_ok)
    $$$DEBUG("x.element.ToString()="_element.ToString())
    $$$DEBUG("Testing complete")
    $$$DEBUG("")
    If debugToFile {
        Set debug=$$$debugObject
        Write !,"Debug file "_debug.file
    }
}

Method getBookmark(ByRef bookmark As %String)
{
    ;$$$DEBUGMethodBegin
    
    Set bookmark=$LISTBUILD(..stream.pos,..stream.col,..stream.line,..stream.startOfLinePos,..needsWScheck,..stopAtEOL,..stopAtWhitespace) 
    Set bookmark("ws")=..whitespace
    Set bookmark("c")=..comment

    ;$$$DEBUGMethodEnd
}

Method gotoBookmark(ByRef bookmark As %String)
{
    ;quit
    $$$DEBUGMethodBegin
    Set forward=(..stream.pos<$LISTGET(bookmark,1))
    $$$DEBUG("Going "_$SELECT(forward:"forward",1:"back")_" from:"_$ZCONVERT(..peek(20),"O","JSON"))
    
    Set $LISTBUILD(pos,col,line,startOfLinePos,needsWScheck,stopeol,stopws)=bookmark
    Set ..stream.pos=pos,..stream.col=col,..stream.line=line,..stream.startOfLinePos=startOfLinePos
    Set ..needsWScheck=needsWScheck
    Set ..stopAtEOL=stopeol
    Set ..stopAtWhitespace=stopws
    Set ..whitespace=bookmark("ws")
    Set ..comment=bookmark("c") 

    Set ..keyword="",..peekedlen=0 

    $$$DEBUG("Going "_$SELECT(forward:"forward",1:"back")_"   to:"_$ZCONVERT(..peek(20),"O","JSON"))
    $$$DEBUGMethodEnd
}

Method peek(number As %Integer) As %String [ CodeMode = expression ]
{
$EXTRACT(..streaminput,..stream.pos,..stream.pos+number-1)
}

/*
Method peek(number As %Integer) As %String [ CodeMode = expression ]
{
$EXTRACT(..streaminput,..stream.pos,..stream.pos+number-1)
    ;Set p=..stream.pos
    ;Quit $EXTRACT(..streaminput,p,p+number-1)
    ;Quit $EXTRACT(..streaminput,..stream.pos,..stream.pos+number-1)
    ;Quit ..peeked

}
*/
Method peekKeyword() As %String [ CodeMode = objectgenerator ]
{
    #define CODE(%l) do %code.WriteLine(%l)
    $$$CODE($CHAR(9)_"i ..keyword'="""" q ..keyword")
    $$$CODE($CHAR(9)_"$$$DEBUGMethodBegin")
    $$$CODE($CHAR(9)_"s i=0,testword=""""")
    $$$CODE($CHAR(9)_"do {")
    $$$CODE($CHAR(9)_$CHAR(9)_"s word=testword")
    $$$CODE($CHAR(9)_$CHAR(9)_"s ch=..stream.Peek(i)")
    $$$CODE($CHAR(9)_$CHAR(9)_"s testword=word_ch")
    $$$CODE($CHAR(9)_$CHAR(9)_"s i=i+1 ;$$$DEBUG(""word=""_testword)" )
    $$$CODE($CHAR(9)_"} while ch'="""",testword?"_%parameter("KeywordPattern"))
    $$$CODE($CHAR(9)_"s ..keyword=word")
    $$$CODE($CHAR(9)_"$$$DEBUGMethodEnd")
    $$$CODE($CHAR(9)_"q word")
    Quit $$$OK
}

Method next(number As %Integer = 1) As %String
{
    ;$$$DEBUGMethodBegin
    Set value=..stream.NextMany(number)
    Set ..keyword="",..peekedlen=0
    ;$$$DEBUGMethodEnd
    Quit value
}

Method nextChars(chars As %String) As %String
{
    Set value=..stream.NextChars(chars)
    Set ..keyword=""
    Quit value
}

Method nextNotEOL(number As %Integer) As %String
{
    ;$$$DEBUGMethodBegin
    Set value=..stream.NextNOTEol(number)
    Set ..keyword="",..peekedlen=0
    ;$$$DEBUGMethodEnd
    Quit value
}

/// lengthAdjust takes into account that you might be peeking past the end but the position has not been updated
Method eof(lengthAdjust As %Integer = 0) As %Boolean
{
    ;q ((..stream.pos+lengthAdjust)>$l(..stream.input))
    Quit ((..stream.pos+lengthAdjust)>..streamlen)
}

Method isPunctuationInList(ListOfStrings As %List, longestLen As %Integer = 50, Output foundString As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set next50=..peek(longestLen)
    Set UPP50=$$$UPPER(next50)
    Set found=$LISTFIND(ListOfStrings,UPP50)
    If found Set foundString=$LIST(ListOfStrings,found)
    ;$$$DEBUG($s(found:"("_foundString_") ",1:"NOT ")_"found:"_UPP50_" in list "_$LISTTOSTRING(ListOfStrings))
    $$$DEBUGMethodEnd
    Quit found
}

Method isKeywordInList(ListOfStrings As %List, Output foundString As %String) As %Boolean
{
  
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set keyword=..peekKeyword()
    Set UPP=$$$UPPER(keyword)
    Set found=$LISTFIND(ListOfStrings,UPP)
    If found Set foundString=keyword
    ;$$$DEBUG($SELECT(found:"("_foundString_") ",1:"NOT ")_"found:"_UPP_" in list "_$LISTTOSTRING(ListOfStrings))
    $$$DEBUGMethodEnd
    Quit found
}

Method isKeyword(KeywordToCheck As %String, Output foundString As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set keyword=..peekKeyword()
    Set UPP=$$$UPPER(keyword)
    Set found=(UPP=KeywordToCheck)
    If found Set foundString=keyword
    ;$$$DEBUG($s(found:"("_foundString_") ",1:"NOT ")_"found:"_UPP)
    $$$DEBUGMethodEnd
    Quit found
}

Method isStringInList(ListOfStrings As %List, longestLen As %Integer = 50, Output foundString As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set next50=..peek(longestLen)
    Set UPP50=$$$UPPER(next50)
    Set ptr=0,notfound=1
    While notfound, $LISTNEXT(ListOfStrings,ptr,value) {
       Set len=$LENGTH(value)
       /*If value?1.A {
            Set peeked=$$$UPPER(..peekKeyword())
       } Else {
            Set peeked=$EXTRACT(UPP50,1,len)
       }*/
       Set peeked=$EXTRACT(UPP50,1,len)
        If peeked=value {
            Set notfound=0,foundString=$EXTRACT(next50,1,len)
        }
    }
    ;$$$DEBUG($s(notfound=0:"("_peeked_","_value_","_..keyword_")",1:"NOT ")_"found:"_UPP50_" in list "_$LISTTOSTRING(ListOfStrings))
    $$$DEBUGMethodEnd
    Quit 'notfound
}

Method isStringSingle(String As %String, Output foundString As %String) As %Boolean
{
    ;$$$DEBUGMethodBegin  
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set len=$LENGTH(String)
    Set foundString=..peek(len)
    If $$$UPPER(foundString)=String {
        Set found=1
    } Else {
        Set found=0
    }
    ;$$$DEBUGMethodEnd
    Quit found
}

Method isString(ParentElement As PXW.DEV.Element = "", StringToCheck As %String) As %Boolean
{
    //#define UPPER(%x) $zconvert(%x,"U")
    $$$DEBUGMethodBegin
    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
 
    Set ok=0
    Set len=$LENGTH(StringToCheck)
    Set peeked=..peek(len)
    If $$$UPPER(peeked)=$$$UPPER(StringToCheck) {
        If $ISOBJECT(ParentElement) {
            Set value=..next(len)
            If value?1.P {
                Set atom=..newAtom("punctuation",value)
            } Else {
                Set atom=..newAtom(..#keywordAtomType,value)
            }
            Do ParentElement.AddPart(atom)
        }
        Set ok=1
    }
    $$$DEBUGMethodEnd
     Quit ok
}

Method isPunctuation(StringToCheck As %String, Output foundString As %String) As %Boolean
{
    //#define UPPER(%x) $zconvert(%x,"U")
    ;$$$DEBUGMethodBegin
    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
 
    ;$$$DEBUG("checking punctuation '"_StringToCheck_"' found '"_$zconvert(..peek(10),"O","JS")_"'")
    Set ok=0
    Set len=$LENGTH(StringToCheck) 
    Set peeked=..peek(len)
    If $$$UPPER(peeked)=$$$UPPER(StringToCheck) {
        Set ok=1
        Set foundString=peeked
    }
    ;$$$DEBUG("checking punctuation'"_StringToCheck_"' ok="_ok)
    ;$$$DEBUGMethodEnd
    Quit ok
}

Method addString(ParentElement As PXW.DEV.Element = "", StringToCheck As %String) As %Boolean
{
    //#define UPPER(%x) $zconvert(%x,"U")
    $$$DEBUGMethodBegin
    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
 
    $$$DEBUG("checking string '"_StringToCheck_"' found '"_$ZCONVERT(..peek(10),"O","JS")_"'")
    Set ok=0
    Set len=$LENGTH(StringToCheck)
    Set peeked=..peek(len)
    If $$$UPPER(peeked)=$$$UPPER(StringToCheck) {
        Set value=..next(len)
        If value?1.P {
            Set atom=..newAtom("punctuation",value)
        } Else {
            Set atom=..newAtom(..#keywordAtomType,value)
        }
        Do ParentElement.AddPart(atom)
        Set ok=1
    }
    $$$DEBUG("checking string '"_StringToCheck_"' ok="_ok)
    ;s %pxwstrings(StringToCheck_"="_ok)=$g(%pxwstrings(StringToCheck_"="_ok))+1
    $$$DEBUGMethodEnd
     Quit ok
}

Method addStringInList(ParentElement As PXW.DEV.Element, ListOfStrings As %List, longestLen As %Integer = 50, Output foundString As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Set ok=0
    If ..isStringInList(ListOfStrings,longestLen,.value) {
        If value?1.P {
            Set atom=..newAtom("punctuation",value)
        } Else {
            Set atom=..newAtom(..#keywordAtomType,value)
        }
        Do ParentElement.AddPart(atom)
        Set ok=1
        Set foundString=value
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method addKeywordInList(ParentElement As PXW.DEV.Element, ListOfStrings As %List, Output foundString As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Set ok=0  
    If ..isKeywordInList(ListOfStrings,.value) {
        Set foundString=..next($LENGTH(value))
        Set atom=..newAtom(..#keywordAtomType,foundString)
        Do ParentElement.AddPart(atom)
        Set ok=1
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method addKeyword(ParentElement As PXW.DEV.Element, Keyword As %String, Output foundString As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Set ok=0
    If ..isKeyword(Keyword,.value) {
        Set foundString=..next($LENGTH(value))
        Set atom=..newAtom(..#keywordAtomType,foundString)
        Do ParentElement.AddPart(atom)
        Set ok=1
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method addRegex(ParentElement As PXW.DEV.Element = "", Regex As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set ch50=..stream.PeekToEol()
    Set locate=$LOCATE(ch50,Regex,1,end)
    If locate=1 {
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(end-1))
        Do ParentElement.AddPart(atom)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method addPunctuation(ParentElement As PXW.DEV.Element, Punctuation As %String, Output foundString As %String) As %Boolean
{
    ;$$$DEBUGMethodBegin
    Set ok=0
    If ..isPunctuation(Punctuation,.value) {
        Set foundString=..next($LENGTH(value))
        Set atom=..newAtom("punctuation",foundString)
        Do ParentElement.AddPart(atom)
        Set ok=1
    }
    ;$$$DEBUGMethodEnd
    Quit ok
}

Method addPunctuationInList(ParentElement As PXW.DEV.Element, ListOfStrings As %List, longestLen As %Integer = 50, Output foundString As %String) As %Boolean
{
    $$$DEBUGMethodBegin
    Set ok=0
    If ..isPunctuationInList(ListOfStrings,longestLen,.value) {
        Set foundString=..next(longestLen)
        Set atom=..newAtom("punctuation",foundString)
        Do ParentElement.AddPart(atom)
        Set ok=1
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method concatChar(ByRef string As %String, char As %String)
{
    If ..peek(1)=char Set string=string_char
}

/// methods in here need to do a DIRECT lookup on ..text
Method skipWhiteSpaceAndComments()
{
    #define isWS(%x) $c(32,9,13,10,160)[%x
    $$$DEBUGMethodBegin

    If '..stopAtWhitespace {
        If ..stopAtEOL { 
            Set ws=$CHAR(32,9,160)
        } Else {
            Set ws=$CHAR(32,9,13,10,160)
        }
        ; leading whitespace and comments end up embedded in the next real object
        ; so you could end up with a returned object like this
        ; object={ 
        ;          type:"variable",
        ;         value:111,
        ;       comment:{
        ;                type:"comment",
        ;               value:"a comment",
        ;          whitespace:{
        ;                      type:"whitespace",
        ;                     value:"  "
        ;                     }
        ;          }                
        ;
        ;        
readNextLoop		
        ;Set ch10=..peek(10),ch=$EXTRACT(ch10,1)
        Set ch10=$EXTRACT(..streaminput,..stream.pos,..stream.pos+9),ch=$EXTRACT(ch10,1)
        ;If '..eof(),ws[ch Set ..whitespace=..newAtom("whitespace",..nextChars(.ws)) Goto readNextLoop
        If ws[ch,ch'="" Set ..whitespace=..newAtom("whitespace",..nextChars(.ws)) Goto readNextLoop
        If ..skipComments(.ch10) Set ..keyword="" Goto readNextLoop
        Set ..needsWScheck=0
    }

    $$$DEBUGMethodEnd 
    Quit
}

/// Skip over the next set of comments, return 1 if something was done or 0.
/// ch10 is the next 10 chars in the stream
Method skipComments(ch10 As %String) As %Boolean
{
    ;i $e(ch10,1,3)="///" s ..comment=..readLineComment("///") q 1
    ;i $e(ch10,1,2)="//" s ..comment=..readLineComment("//") q 1
    ;i $e(ch10,1,2)="/*" s ..comment=..readBlockComment() q 1
    Quit 0
}

Method newElement(type As %String) As PXW.DEV.BNF.Element
{
    Quit ##class(PXW.DEV.BNF.Element).%New()
}

Method newAtom(type As %String, value As %String = "") As PXW.DEV.Atom
{
    Set a=##class(PXW.DEV.Atom).%New() 
    Set a.type=type_":"_$GET(%path) 
    Set a.value=value
	Set a.col=..stream.col
	Set a.line=..stream.line
	If $ISOBJECT(..whitespace) {
        Set a.whitespace=..whitespace
        Set ..whitespace=""
    }
	If $ISOBJECT(..comment) {
        Set a.comment=..comment
        Set ..comment=""
    }
    Set ..needsWScheck=1
    Set %atoms=$GET(%atoms)+1
    set %atomadded=a.type_"="_a.value
    set %next50=..peek(50)
    Quit a
}

Method readLineComment(start As %String) As PXW.DEV.Atom
{
    $$$DEBUGMethodBegin
	Set o=..newAtom("linecomment")
	Set o.start=..stream.NextNOTEol($LENGTH(start)) 
	Set n=""
    Do {
        Set morecomments=0
       Set n=n_..stream.NextToEol()

        ; now look to see if the NEXT line has the same type of comment
        ; if it does then add all that to this comment
        Set next50=..peek(50)
        
        ; 
        If $EXTRACT($ZSTRIP(next50,"<WC"),1,$LENGTH(start))=start {
            Set ws=$CHAR(32,9,13,10,160)
           Set n=n_..stream.NextChars(ws)
            Set morecomments=1
        }
    } While morecomments

	Set o.value=n
    $$$DEBUGMethodEnd
	Quit o
}

Method readBlockComment(StartMarker As %String = "/*", EndMarker As %String = "*/") As PXW.DEV.Atom
{
    $$$DEBUGMethodBegin
    If ..peek($LENGTH(StartMarker))'=StartMarker Quit ""

	Set o=..newAtom("blockcomment")
	Set o.start=..stream.NextNOTEol($LENGTH(StartMarker))
	Set p=..stream.PeekToString(EndMarker)
    Set n=..stream.NextMany($LENGTH(p))
	Set o.end=..stream.NextNOTEol($LENGTH(EndMarker)) ; put the */ in the block
	Set o.value=n
    $$$DEBUGMethodEnd
	Quit o
}

/// Match should be a pair of characters that mark out where we are in the code. Mostly this will be "{}". 
/// The number of { and } is then counted and when the count becomes -1 that means we have reached 
/// a good recovery point (eg end of method)
/// Stop At List should be a list of things that cause the recover to stop (eg $lb($c(13)))
/// we can only allow 1 char, might need to be a bit cleverer here to deal with cdata blocks in each item in the list
Method recover(ParentElement As PXW.DEV.Element, ByRef subElement As PXW.DEV.Element, Match As %String, StopAtList As %List) As %Boolean
{
	$$$DEBUGMethodBegin
    $$$BNFPATH
    #dim a as %CSP.Broker
	Set subElement=##class(PXW.DEV.Element).%New()
	Set subElement.type="recover"

    Set matchcount=0 
	Set ok=0
	Set r=""
    $$$DEBUG("RECOVER START AT:"_..peek(20))
    ; find where we are now (pos) up to the point of failure (lastPos)
    While '..eof(),..stream.pos<..stream.lastPos,..recoverStopAt(StopAtList)=0,matchcount>=0 {
        If Match'="" {
            If ..peek(1)=$EXTRACT(Match,1) Set matchcount=matchcount+1
            If ..peek(1)=$EXTRACT(Match,2) Set matchcount=matchcount-1
            If matchcount>=0 {
                Set r=r_..next()
                Set ok=1
            }
        } Else {
            Set r=r_..next()
            Set ok=1
        }
    }
	If ok {
		Set atom=..newAtom("ERROR",r)
		Do subElement.AddPart(atom)
	}	
    
    ; now find from the point of failure up to the next recovery point (a mismatch of {}  or a specific char)
    Set ok=0,r=""
	While '..eof(),..recoverStopAt(StopAtList),matchcount>=0 {
        If ..peek(1)=$EXTRACT(Match,1) Set matchcount=matchcount+1
        If ..peek(1)=$EXTRACT(Match,2) Set matchcount=matchcount-1
        If matchcount>=0 {
            Set r=r_..next()
            Set ok=1
        }
	}
	If ok {
		Set atom=..newAtom("ERROR",r)
		Do subElement.AddPart(atom)
		Do ParentElement.AddPart(subElement)
	}	
    $$$DEBUG("RECOVER END AT:"_..peek(20))
	$$$DEBUGMethodEnd
    ; recover always is true?
	Quit ok
}

Method recoverStopAt(StopAtList As %List)
{
    s stop=$LISTFIND(StopAtList,..peek(1))
    ;$$$DEBUG("Stop="_stop_":"_..peek(1))
    q stop
    s stop=0
    f i=1:1:$ll(StopAtList) {
        set stop=$lg(StopAtList,i)
        set peek=..peek($l(stop))
        if $$$UPPER(peek)=$$$UPPER(stop) {
            set stop=1
        }
    }
    q stop
}

}
