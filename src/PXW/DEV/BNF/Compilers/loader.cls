Class PXW.DEV.BNF.Compilers.loader Extends %RegisteredObject
{

/// include the %path code  in the generated code, helps with debug
Parameter Paths = 1;

/// Used by the code generator and passed onto the generated code.
/// The check is done lots of times to keep building up a word until the test fails.
Parameter KeywordPattern = "1.A";

Parameter SubElementType = "PXW.DEV.BNF.Element";

Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "");

Property type As %String;

/* text,col and linenumber refer to the data within a rule (not the entire file) */
Property text As %String;

Property col As %String;

Property linenumber As %String;

Property maincode [ MultiDimensional ];

Property functioncode [ MultiDimensional ];

Property code As %String;

Property codeNoWrap As %String;

Property counter As %Integer [ MultiDimensional ];

Method isKeyword(string As %String) As %Boolean [ CodeMode = objectgenerator ]
{
    ; q (string?1.A)
    Do %code.WriteLine($CHAR(9)_"q (string?"_%parameter("KeywordPattern")_")")
    Quit $$$OK
}

XData file
{
<data><![CDATA[
    ]]>

    </data>
}

}
