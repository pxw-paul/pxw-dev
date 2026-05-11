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

}
