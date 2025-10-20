Class PXW.DEV.Atom Extends PXW.DEV.Particle
{

/* strictly speaking we should only need type and value*/
Property type As %String;

Property value As %String;

/* a strict parser might ignore comments and white space
   but here I want to keep them so they can be represented in html
   */
Property whitespace As PXW.DEV.Atom;

Property comment As PXW.DEV.Atom;

/* these others are for debug and error reporting purposes */
Property col As %String;

Property line As %String;

/// How this atom starts (optional) eg: strings may start with quotes(")
Property start As %String;

/// How this atom ends (optional) eg: strings may end with quotes(")
Property end As %String;

/// wspace="" ; return original whitespace 
/// wpsace=string ; return the string in place of the white space
/// wspace=0 ; no whitespace
/// Never returns comments
Method ToString(wspace As %String = "") As %String
{
	Set str=""
	If $ISOBJECT(..whitespace) {
		If wspace="" {
			Set str=str_..whitespace.ToString()
		} ElseIf wspace=0 {
			Set str=str
		}
		Else {
			Set str=str_wspace
		}
	}
	Set str=str_..start
	Set str=str_..value
	Set str=str_..end
	Quit str
}

/// write out basic info of the atom
Method write(indent As %String)
{
	Write indent_"type="_..type,!
	;i $isobject(..whitespace) d ..whitespace.display(indent_"  ")
	Write indent_" "_..start_..value_..end,!
}

/// write out the full details of the atom (with comments etc)
Method writeFull(indent As %String)
{
	Write indent_"type="_..type,!
	Do:$ISOBJECT(..whitespace) ..whitespace.writeFull(indent_"  ")
	Do:$ISOBJECT(..comment) ..comment.writeFull(indent_"  ")
	Write indent_" "_..start_..value_..end,!
}

/// write out basic info of the atom
Method writeDebug(indent As %String)
{
	$$$DEBUG(indent_"type="_..type)
	;i $isobject(..whitespace) d ..whitespace.display(indent_"  ")
	$$$DEBUG(indent_" "_..start_..value_..end)
}

/// Find the left-most comment which could be before some whitespace.
Method getComment(atcomment As %Boolean = 0) As PXW.DEV.Atom
{
    If $ISOBJECT(..whitespace) Set found=..whitespace.getComment(0) If $ISOBJECT(found) Quit found
    If $ISOBJECT(..comment) Set found=..comment.getComment(1) If $ISOBJECT(found) Quit found
    If atcomment Quit $THIS
    Quit ""
}

Method clearComment()
{
	If $ISOBJECT(..comment) Set ..comment=""
	If $ISOBJECT(..whitespace) Do ..whitespace.clearComment()
}

}
