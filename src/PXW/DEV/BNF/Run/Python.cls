Class PXW.DEV.BNF.Run.Python Extends PXW.DEV.BNF.GEN.Python
{

Property fStringEndChar As %String;

Property bracketDepth As %Integer [ InitialExpression = 0 ];

Property sqDepth As %Integer [ InitialExpression = 0 ];

Property curlyDepth As %Integer [ InitialExpression = 0 ];

Property currentIndent As %String;

Method addPunctuation(ParentElement As PXW.DEV.Element, Punctuation As %String, Output foundString As %String) As %Boolean
{
	Set ok=##super(ParentElement,Punctuation,.foundString)
    ; stuff in ( ) can span more than 1 line
    If ok {
        If foundString="(" {
            Set ..bracketDepth=..bracketDepth+1,..stopAtEOL=0
        } ElseIf foundString=")" {
            Set ..bracketDepth=..bracketDepth-1
        } ElseIf foundString="[" {
            Set ..sqDepth=..sqDepth+1,..stopAtEOL=0 
        } ElseIf foundString="]" {
            Set ..sqDepth=..sqDepth-1
        } ElseIf foundString="{" {
            Set ..curlyDepth=..curlyDepth+1,..stopAtEOL=0
        } ElseIf foundString="}" {
            Set ..curlyDepth=..curlyDepth-1
        }
        If ..bracketDepth=0,..curlyDepth=0,..sqDepth=0 {
            Set ..stopAtEOL=1
        }
    }
    Quit ok
}

Method getBookmark(ByRef bookmark As %String)
{
    ;$$$DEBUGMethodBegin
    
    Set bookmark=$LISTBUILD(..stream.pos,..stream.col,..stream.line,..stream.startOfLinePos,..needsWScheck,..stopAtEOL,..stopAtWhitespace,
                    ..bracketDepth,..sqDepth,..curlyDepth,..currentIndent) 
    Set bookmark("ws")=..whitespace
    Set bookmark("c")=..comment

    ;$$$DEBUGMethodEnd
}

Method gotoBookmark(ByRef bookmark As %String)
{
    ;quit
    ;$$$DEBUGMethodBegin
    Set forward=(..stream.pos<$LISTGET(bookmark,1))
    $$$DEBUG("Going "_$SELECT(forward:"forward",1:"back")_" from:"_$zconvert(..peek(20),"O","JSON"))
    
    Set $LISTBUILD(pos,col,line,startOfLinePos,needsWScheck,stopeol,stopws,
            bracketDepth,sqDepth,curlyDepth,indent)=bookmark
    Set ..stream.pos=pos,..stream.col=col,..stream.line=line,..stream.startOfLinePos=startOfLinePos
    Set ..bracketDepth=bracketDepth
    Set ..sqDepth=sqDepth
    Set ..curlyDepth=curlyDepth
    Set ..currentIndent=indent
    ;s $lb(sm,needsWScheck,stopeol,stopws)=bookmark
    ;d ..stream.GotoBookmark(sm)
    Set ..whitespace=bookmark("ws")
    Set ..comment=bookmark("c") 
    Set ..needsWScheck=needsWScheck
    ;s ..comment=""
    ;s ..whitespace=""
    ;s ..needsWScheck=1

    Set ..keyword="",..peekedlen=0
    Set ..stopAtEOL=stopeol
    Set ..stopAtWhitespace=stopws
    $$$DEBUG("Going "_$SELECT(forward:"forward",1:"back")_"   to:"_$zconvert(..peek(20),"O","JSON"))
    ;$$$DEBUGMethodEnd
}

Method File(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	Set ok=##super(ParentElement,.subElement)
    If ok=0 {
        Set ok=..recover(ParentElement,.recsub,"",$LISTBUILD())
    }
    Quit ok
}

///  func_type_comment: | NEWLINE TYPE_COMMENT &(NEWLINE INDENT) | TYPE_COMMENT
Method FuncTypeComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    Quit 0 ; never happenes, handled by regular comments for now
}

Method Name(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    ;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set ok=0
    Do ..getBookmark(.bm)
    Set ch=..peek(1)
    ; starts with letter
    If ch?1a Set ok=1
    ; starts with underscore
    If ch="_" Set ok=1

    ; f strings (f' or f") are treated as Fstrings later
    If $$$UPPER(..peek(2))="F'" Set ok=0
    If $$$UPPER(..peek(2))="F""" Set ok=0
    ; r strings (r' or r") are treated as strings later
    If $$$UPPER(..peek(2))="R'" Set ok=0
    If $$$UPPER(..peek(2))="R""" Set ok=0
    If $$$UPPER(..peek(2))="B'" Set ok=0
    If $$$UPPER(..peek(2))="B""" Set ok=0

    If ok {

        Set ch=..peek(1)
        While (ch?1A) || (ch?1N) || (ch="_")  {
            Set value=value_..nextNotEOL(1)
            Set ch=..peek(1)
        }
    
        ; is not a keyword
        If '$LISTFIND($LISTFROMSTRING(..#Keywords),$$$UPPER(value)) {
            Set atom=..newAtom("Identifier",value)
            Do ParentElement.AddPart(atom)
        } Else {
            Set ok=0
            Do ..gotoBookmark(.bm)
        }
    }
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    $$$DEBUGMethodEnd
    Quit ok
}

Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
		#dim o as PXW.DEV.Atom

    $$$DEBUGMethodBegin
	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ok=0

    If (..peek(3)="'''") || (..peek(3)="""""""")  
    || ($$$LOWER(..peek(4))="r'''") || ($$$LOWER(..peek(4))="r""""""") {
        $$$BNFSTART(subElement)
        Set r1=""
        If $$$LOWER(..peek(1))="r" Set r1=..nextNotEOL(1)
        Set q1=..nextNotEOL(3),n="",instring=1
        While '..eof() && instring {
            Set chs=..peek(3),ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,2)
            ; what do embedded quotes look like here?
           If chs=q1 {
                    Set instring=0
                    Set q2=..next(3)
            } Else {
                Set n=n_..next(1)
            }
        }
        Set o=..newAtom("String",n)
        Set o.start=r1_q1,o.end=q2
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
        Set ok=1
    } ElseIf ..peek(1)'="","""'"[..peek(1) {
        ; single or double quote start
        Set ok=1
        $$$BNFSTART(subElement)

        Set q1=..nextNotEOL(1),n="",instring=1
        While '..eof() && instring {
            Set chs=..peek(2),ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,2)
            ; embedded quotes (\') or escaped \ (\\)
            If ch="\" {
                If ch2=q1 {
                    Set n=n_..nextNotEOL(2)
                } ElseIf ch2="\" {
                    Set n=n_..nextNotEOL(2)
                } Else {
                    Set n=n_..nextNotEOL(1)
                }
            } ElseIf ch=q1 {
                    Set instring=0
                    Set q2=..nextNotEOL(1)
            } Else {
                Set n=n_..nextNotEOL(1)
            }
        }
        Set o=..newAtom("String",n)
        Set o.start=q1,o.end=q2
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    } ElseIf ..peek(1)'="",$LISTFIND($LISTBUILD("R""","R'","B'","B"""),$$$UPPER(..peek(2))) {
        ; r' r" start (raw string)
        ; b strings ??
        Set ok=1
        $$$BNFSTART(subElement)

        Set rq1=..nextNotEOL(2),q1=$EXTRACT(rq1,2),n="",instring=1
        While '..eof() && instring {
            Set chs=..peek(2),ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,2)
            ; embedded quotes - in raw string -NOT SURE
            If ch="\" {
                If ch2=q1 {
                    Set n=n_..nextNotEOL(2)
                } Else {
                    Set n=n_..nextNotEOL(1)
                }
            } ElseIf ch=q1 {
                    Set instring=0
                    Set q2=..nextNotEOL(1)
            } Else {
                Set n=n_..nextNotEOL(1)
            }
        }
        Set o=..newAtom("String",n)
        Set o.start=rq1,o.end=q2
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
	$$$BNFSTART(subElement)
	Set done=0

    ; hex number
    If $$$LOWER(..peek(2))="0x" {
        Set n=..nextNotEOL(2)
        While (..peek(1)'="") && ("01234567890ABCDEFabcdef_"[..peek(1)) {
            Set n=n_..nextNotEOL(1)
        }
        If n'="" {
            Set atom=..newAtom("Number",n)
            Do subElement.AddPart(atom)
            Set ok=1
        }
    ; binary number
    } ElseIf $$$LOWER(..peek(2))="0b" {
        Set n=..nextNotEOL(2)
        While (..peek(1)'="") && ("01_"[..peek(1)) {
            Set n=n_..nextNotEOL(1)
        }
        If n'="" {
            Set atom=..newAtom("Number",n)
            Do subElement.AddPart(atom)
            Set ok=1
        }
    } Else {

        Set n=""
        ; -
        While (..peek(1)="-") || (..peek(1)="+") {
            Set n=n_..nextNotEOL(1)
        }

        ; -123
        While (..peek(1)?1N) {
            Set n=n_..nextNotEOL(1)
        }

        ; start with a .
        If ..peek(2)?1"."1N {
            Set n=n_..next(2)
        }
        If n'="" {

            ; -123.456
            While (..peek(1)?1N) || (..peek(1)="_"){
                Set n=n_..nextNotEOL(1)
            }

            ; -123.456E
            If (..peek(1)="E") || (..peek(1)="e") {
                Set n=n_..nextNotEOL(1)
                ; 123.456E-
                If ..peek(1)="-"{
                    Set n=n_..nextNotEOL(1)
                }

                ; -123.456E-789
                While (..peek(1)?1N) || (..peek(1)="_") {
                    Set n=n_..nextNotEOL(1)
                }
            }

            If n'="" {
                Set atom=..newAtom("Number",n)
                Do subElement.AddPart(atom)
                Set done=1
            }

            If done {
                $$$BNFCOMMITCOPY(subElement,ParentElement)
                Set ok=1
            } Else {
                $$$BNFROLLBACK(subElement)
                Set ok=0
            }
        } Else {
            Set ok=0
        }
    }
	$$$DEBUGMethodEnd
	Quit ok
}

///  ENDMARKER : 'code endmarker'
/// summary values:CODE ENDMARKER
Method Endmarker(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    If ..eof() Quit 1
    ; IN THE CONTEXT OF AN EMBEDDED PYTHON METHOD LOOK FOR "}"
    If ..peek(1)="}" Quit 1
    Quit 0
}

/// Does the whitespace contain new line char?
Method Newline(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Set ok=0
    ; this must not stop at new line, thats exactly what its looking for
    Set old=..stopAtEOL
    Set ..stopAtEOL=0,..needsWScheck=1
	Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If $ISOBJECT(..whitespace),..whitespace.value[..stream.eolChar Set ok=1
    If ..eof() Set ok=1
    Set ..stopAtEOL=old
    $$$DEBUGMethodEnd
    Quit ok
}

/// Does the white space have indentation? Not keeping track of the depth yet.
Method Indent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Set ok=0
	Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If $ISOBJECT(..whitespace),..whitespace.value[" " Set ok=1
    If $ISOBJECT(..whitespace),..whitespace.value[$CHAR(9) Set ok=1
    $$$DEBUGMethodEnd
    Quit ok
}

/// Not keeping track of the depth yet, always pass
Method Dedent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Set ok=1
	;d:..needsWScheck ..skipWhiteSpaceAndComments()
    ;i $isobject(..whitespace),..whitespace.value[" " s ok=1
    ;i $isobject(..whitespace),..whitespace.value[$c(9) s ok=1
    $$$DEBUGMethodEnd
    Quit ok
}

///  TYPE_COMMENT : 'code type_comment'
/// This is a special type of comment used for documentation I think (''').
/// For now we will just treat as a comment and it will be dealt with in
/// the skip comments.
Method TypeComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ok=1
    $$$DEBUGMethodEnd
    Quit ok
}

///  FSTRING_START : 'code fstring_start'
Method FstringStart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ok=0
    If $$$UPPER(..peek(2))="F'" Set ok=1,..fStringEndChar="'"
    If $$$UPPER(..peek(2))="F""" Set ok=1,..fStringEndChar=""""
    If ok=1 {
        Set ok=1
        Set atom=..newAtom("FstringStart")
        Set atom.value=..next(2)
        Do ParentElement.AddPart(atom)
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

///  FSTRING_END : 'code fstring_end'
Method FstringEnd(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    If ..fStringEndChar="" Quit 0
    $$$DEBUGMethodBegin
    
    Set ch=..peek($LENGTH(..fStringEndChar))
    If ch=..fStringEndChar {
        Set atom=..newAtom("FstringEnd")
        Set atom.value=..next($LENGTH(..fStringEndChar))
        Do ParentElement.AddPart(atom)
        Set ok=1
        Set ..fStringEndChar=""
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method FstringMiddle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	Set subElement=ParentElement
	Set done=0 ; method start
	If ..FstringReplacementField(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..FstringMiddleText(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		Set ok=1
	} Else {
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

Method FstringMiddleText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    #dim o as PXW.DEV.Atom
    $$$DEBUGMethodBegin
    ;$$$BNFPATH
    ;;$$$DEBUG("%path="_%path)
    Set n=""
    While ..peek(1)'="{",..peek($LENGTH(..fStringEndChar))'=..fStringEndChar {
        Set n=n_..next(1)
    }
    If n'="" {
        Set o=..newAtom("String",n)
        Do ParentElement.AddPart(o)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

///  statement: compound_stmt | simple_stmts
Method Statement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	Set old=..stopAtEOL
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ..stopAtEOL=1

    ; Until I sort out the whole skipWhiteSpaceAndComment issue:
    ; The superclass happily skips whitespaces but in Python they are important!
    ; I will have to track indents here
    Set ok=1
    If $ISOBJECT(..whitespace) {
        Set indent=$PIECE(..whitespace.value,..stream.eolChar,*)
        ; have we moved back a level, if so then treat this as a FAILURE
        ; which should fall back into the block and allow it to continue again later
        If $LENGTH(indent)<$LENGTH(..currentIndent) {
            Set ok=0
        }
        Set ..currentIndent=indent
    }

    If ok {
        Set ok=##super(ParentElement,.subElement)
    }
    Set ..stopAtEOL=old
    Quit ok
}

/// Skip over the next set of comments, return 1 if something was done or 0.
/// ch10 is the next 10 chars in the stream
Method skipComments(ch10 As %String) As %Boolean
{
    If $EXTRACT(ch10,1,1)="#" Set ..comment=..readLineComment("#") Quit 1

    ; there seems to be some argument about the below 
    ; with some saying the only # is a comment
    ;i $e(ch10,1,3)="'''" s ..comment=..readBlockComment("'''","'''") q 1
    ;i $e(ch10,1,3)="""""""" s ..comment=..readBlockComment("""""""","""""""") q 1

    ; treat \ at end of line like a comment and skip to next line 
    If $EXTRACT(ch10,1,2)=("\"_..stream.eolChar) Set ..comment=..newAtom("linecomment",..next(2)) Quit 1
    Quit 0
}

/*
Method readWhitespace() As PXW.DEV.Atom
{
    $$$DEBUGMethodBegin
    i ..stopAtEOL { 
        s ws=$c(32,9,160)
    } else {
        s ws=$c(32,9,13,10,160)
    }
    s spaces=""
    do {
        s spaces=spaces_..stream.NextChars(ws)
        ; \ at end of line means we can continue to the next
        i ..peek(2)=("\"_..stream.eolChar) s spaces=spaces_..next(2)
    } while '..eof() && (ws[..peek(1))
    
    s o=..newAtom("whitespace",spaces)
    $$$DEBUGMethodEnd
	q o
}
/// methods in here need to do a DIRECT lookup on ..text
Method skipWhiteSpaceAndComments()
{
    #define isWS(%x) $c(32,9,13,10,160)[%x
    $$$DEBUGMethodBegin

    i ..stopAtEOL { 
        s ws=$c(32,9,160)
    } else {
        s ws=$c(32,9,13,10,160)
    }
    $$$DEBUG("StopAtWhiteSpace="_..stopAtWhitespace_",StopAtEOL="_..stopAtEOL)
    i ..stopAtWhitespace g readExit

readNextLoop		
	s ch10=..peek(10),ch=$e(ch10,1)
	
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
	;i '..eof(),$$$isWS(ch) s ..whitespace=..readWhitespace() g readNextLoop
    i '..eof(),ws[ch s ..whitespace=..readWhitespace() g readNextLoop
    i '..eof(),($e(ch10,1,2)="\"_..stream.eolChar) s ..whitespace=..readWhitespace() g readNextLoop
    i '..eof(),..skipComments(ch10) g readNextLoop
    s ..needsWScheck=0
readExit
    $$$DEBUGMethodEnd 
    q
}
*/
}
