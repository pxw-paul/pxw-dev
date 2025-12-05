ROUTINE PXW.Tools.Styles.macros [Type=INC]

#; These macros should all be pointing to something in the %STYLE sheet.
#; When wrting a page it becomes simple to use $$$class macros to 
#; set up elements with the correct class.


#; THIS SECTION IS ABOUT DISPLAYING PROGRAM (Objectscript class)
/// classProgramName
#define classProgramName "codeProgramName"

/// classProgramLabel
#define classProgramLabel "codeProgramLabel"

/// classProgramKeyword (eg property, class, method)
#define classProgramKeyword "codeProgramKeyword"

/// classLensMenu (borrowing codelens name from vscode)
#define classLensMenu "LensMenu"

/// classLensOption
#define classLensOption "LensOption"


#; THIS SECTION IS ABOUT DISPLAYING THE CODE
/// classComment (do we need extra types of comment - class, cos etc)
#define classComment "codeComment"

/// classKeyword (eg set, kill)
#define classKeyword "codeKeyword"

/// classWarning
#define classWarning "codeWarning"

/// classError
#define classError "codeError"

/// classFormalSpecList
#define classFormalSpecList "codeFormalSpecList"

/// classFormalSpecItem
#define classFormalSpecItem "codeFormalSpecItem"

/// classGlobal
#define classGlobal "codeGlobal"

/// classGlobalSet
#define classGlobalSet "codeGlobalSet"

/// classVariable
#define classVariable "codeVariable"

/// classVariableSet
#define classVariableSet "codeVariableSet"

/// classVariableParameter
#define classVariableParameter "codeVariableParameter"

/// classVariableParameterSet
#define classVariableParameterSet "codeVariableParameterSet"

/// classObjectMember 
#define classObjectMember "codeObjectMember"

/// classString
#define classString "codeString"

/// classNumber
#define classNumber "codeNumber"

/// classLabel
#define classLabel "codeLabel"

/// classLableDef
#define classLabelDef "codeLabelDef"

#; CLASSES RELATING TO HIGHLIGHING 
/// classHilite
#define classHilite "hilite"

/// classHiliteRow 
#define classHiliteRow "hiliterow"

/// classHiliteRowGood
#define classHiliteRowGood "goodrow"

/// classHiliteRowWarning
#define classHiliteRowWarning "warningrow"

/// classHiliteRowError 
#define classHiliteRowError "errorrow"

/// classHiliteRow 
#define classHiliteData "hilitedata"

/// classHiliteRowGood
#define classHiliteDataGood "gooddata"

/// classHiliteDataWarning
#define classHiliteDataWarning "warningdata"

/// classHiliteRowError 
#define classHiliteDataError "errordata"

/// classNarrative 
#define classNarrative "narrative"
