Class PXW.Tools.Debugger Extends PXW.Debuggers.Basic
{

/// Tends to be called more often with all sorts of data passed in
Method DEBUG(message As %String)
{
	write $zconvert(message,"O","HTML"),!
}

}
