Class PXW.Tools.Styles.super Extends %Library.RegisteredObject
{

/// If this is 1 then the descriptions are output as text (IE what was typed, with leading ///) 
/// if 0 the descriptions are treated as HTML so formatting can take place (special tags are not dealt with yet)
Property CDEFDescriptionsAsText As %Boolean [ InitialExpression = 1 ];

/// If this is 1 then menu options are placed next to the thing that is most applicable
/// If 0 then the options are grouped together in a menu holder for placement elsewhere
Property CDEFMenuInline As %Boolean [ InitialExpression = 0 ];

Method WriteStyles()
{
}

}
