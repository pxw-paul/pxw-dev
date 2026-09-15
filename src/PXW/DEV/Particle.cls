Include PXW.Debuggers.Macros

Class PXW.DEV.Particle Extends %Library.RegisteredObject
{

Property type As %String;

property IsElement as %Boolean [ InitialExpression = 0];

property IsAtom as %Boolean [ InitialExpression = 0];


Method ToString() As %String
{
	Quit ..%ClassName(1)
}

Method write(indent As %String = "")
{
}

Method writeFull(indent As %String = "")
{
}

Method writeDebug(indent As %String = "")
{
}

Method writeDebugFull(indent As %String = "")
{
}

}
