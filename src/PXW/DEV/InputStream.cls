/// based on https://lisperator.net/pltut/parser/input-stream
Class PXW.DEV.InputStream Extends %RegisteredObject
{

Property input As %String(MAXLEN = "");

Property pos As %Integer;

Property line As %Integer;

Property col As %Integer;

Property startOfLinePos As %Integer;

/// greatest pos
Property lastPos As %Integer;

Property lastStartOfLinePos As %Integer;

Property length As %Integer;

Property eolChar As %String [ InitialExpression = {$CHAR(13)} ];

ClassMethod NewString(Code As %String) As PXW.DEV.InputStream
{
	Set reader=..%New()
	; make crlf just cr so that its 1 char, I am sure it will make things simpler
	;s flat=Code 
	Set flat=$REPLACE(Code,$CHAR(13,10),reader.eolChar)
	Set reader.input=flat
	Set reader.pos=1
	Set reader.line=1
	Set reader.col=0
	Set reader.length=$LENGTH(Code)
	;s %pxwstreams(+reader)=flat
	Quit reader
}

/// Get the next character, taking into account it might be the EOL
Method Next() As %String
{
	Set ch=$EXTRACT(..input,..pos)
	Set ..pos=..pos+1 
	If ch=..eolChar {
		Set ..line=..line+1,..col=0,..startOfLinePos=..pos+1
	} Else {
		Set ..col=..col+1
	}
    ;s:..startOfLinePos>..lastStartOfLinePos ..lastStartOfLinePos=..startOfLinePos
    Set:..pos>..lastPos ..lastPos=..pos
	Quit ch
}

Method NextMany(number As %Integer = 1) As %String
{
	Set pos=..pos
	Set ret=$EXTRACT(..input,pos,pos+number-1)
	Set ..pos=pos+number
	Set ..col=..col+number
	If $FIND(ret,..eolChar) {
		Set crcount=$LENGTH(ret,..eolChar)
		Set ..line=..line+crcount-1
		Set ..col=$LENGTH($PIECE(ret,..eolChar,*))
	}
	Set:..pos>..lastPos ..lastPos=..pos
	Quit ret
}

/// Read a single char, the next char is NOT checked to see if it is an EOL
Method NextNOTEol(number As %Integer) As %String
{
	Set ch=$EXTRACT(..input,..pos,..pos+number-1)
	Set ..pos=..pos+number
	Set ..col=..col+number
    Set:..pos>..lastPos ..lastPos=..pos
	Quit ch
}

/// returns the string to the EOL but NOT the eol char itself
Method NextToEol() As %String
{
	Set eolpos=$FIND(..input,..eolChar,..pos)
	; no eol so read whole string
	If eolpos=0 {
		Set len=..length-..pos
		Set ret=$EXTRACT(..input,..pos,..pos+len)
		Set ..pos=..pos+len+1
		Set ..col=..col+len+1
	} Else {
		Set len=eolpos-..pos-2
		Set ret=$EXTRACT(..input,..pos,..pos+len)
		Set ..pos=..pos+len+1
		Set ..col=..col+len+1
	}
	Set:..pos>..lastPos ..lastPos=..pos
	Quit ret
}

/// returns the string that contains only the given characters
Method NextChars(ValidChars As %String) As %String
{
	Set pos=..pos
	Set peek=$EXTRACT(..input,pos)
    While (peek'="") && (ValidChars[peek) {
		Set pos=pos+1
		Set peek=$EXTRACT(..input,pos)
    }
	If pos>..pos {
		Set ret=..NextMany(pos-..pos)
	} Else {
		Set ret=""
	}
	Set:..pos>..lastPos ..lastPos=..pos
	Quit ret
}

Method Peek(offsetStart As %Integer = 0, offsetEnd As %Integer = {offsetStart}) As %String
{
	Set ch=$EXTRACT(..input,..pos+offsetStart,..pos+offsetEnd)
	Quit ch
}

/// returns the string to the EOL but NOT the eol char itself
Method PeekToEol() As %String
{
	Set eolpos=$FIND(..input,..eolChar,..pos)
	; no eol so read whole string
	If eolpos=0 {
		Set len=..length-..pos
		Set ret=$EXTRACT(..input,..pos,..pos+len)
	} Else {
		Set len=eolpos-..pos-2
		Set ret=$EXTRACT(..input,..pos,..pos+len)
	}
	Quit ret
}

Method EOF() As %Boolean
{
	Quit (..Peek()="")
}

/*
Method GetBookmark(Output bm as %List) As %List
{
	s bm=$lb(..pos,..col,..line,..startOfLinePos)
}

Method GotoBookmark(bm As %List)
{
	s ..pos=$lg(bm,1),..col=$lg(bm,2),..line=$lg(bm,3),..startOfLinePos=$lg(bm,4)
}
*/
Method Throw(msg As %String)
{
	Set sc=$$$ERROR(5001,msg_" line:"_..line_" col:"_..col)
	$$$ThrowStatus(sc)
}

}
