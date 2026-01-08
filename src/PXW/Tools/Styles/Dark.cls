Class PXW.Tools.Styles.Dark Extends PXW.Tools.Styles.super
{

Method WriteStyles()
{
    &html<
    <style> /*-- extra style --*/

	/* https://www.w3schools.com/css/css3_box-sizing.asp */
	* {
 		box-sizing: border-box;
	}

	:root {
		/* background colours: ;*/
		--bgNormal: #1E1E1E;
		--bgAlternate1: #2E2E2E;
		--bgAlternate2: #3E3E3E;
		--bgAlternate3: black;
		--bgHover: #3E3E3E;
		--bgHilite:#6b6b1d;
		--bgWarning: #f3a488;
		--bgError: #9f3d3d;
		--bgGood: #225922;

		/* foreground colours: ;*/
		--fgNormal: white;
		--fgAlternate: black;
		--fgProgramName: #4EC9B0;
		--fgProgramLabel: #DCDCAA;
		--fgProgramKeyword: #6596FF;
		--fgCodeKeyword: white;
		--fgCodeVariable: #ade2ff;
		--fgCodeVariableGlobal: #64c9ff;
		--fgCodeArgument: #ff75f4;
		--fgCodeLabel: #DCDCAA;
		--fgCodeString: #D4B57C; 
		--fgCodeNumber: #D4B57C; 
		--fgComment: #378D2A;
		--fgInlineOption: silver;

        --borderNormal: silver;
        --borderAlternate1: silver;
		--borderWarning: #f3a488;
		--borderError: red;
		--borderGood: green;
	}	

	body {border:0; margin:0; padding:0; 
		background-color: var(--bgNormal); color: var(--fgNormal); 
		font-family: Arial, Helvetica, sans-serif; font-size: small;	
	} 
	a { text-decoration:none;  color: inherit;}
	a:visited { text-decoration:none; color: inherit; }
	a:hover { text-decoration:none;  color: inherit; }
	a:active { text-decoration:none;  color: inherit; }
	pre { margin:0px; tab-size:4; font-size: medium;}
    fieldset { border-color: var(--borderNormal); border-radius:10px 0 5px 0;}
    
    /*
        +----------------------------------------------+
        |header #toolsHead                             |
        |  div #toolsForms                             |
        +----------------------------------------------+
        |div #toolsTitle  h1                           |
        +----------------------------------------------+
        |div #toolsMainBody                            |
        |  div #toolsMainBodyContainer                 |
        |   +------------------+----------------------+|
        |   |nav               |main                  ||
        |   |#toolsMainBodyNav |#toolsMainBodyContent ||
        |   |                  |                      ||
        |   |                  |                      ||
        |   +------------------+----------------------+|
        +----------------------------------------------+
        |div #toolsFooter                              |
        +----------------------------------------------+
    */
	
 

    table { width: 100%; font-size: inherit;}
	table thead, table tfoot { position: sticky;  background: var(--bgAlternate2); color: var(--fgNormal);}
	table thead { inset-block-start: 0;} /* top */
	table tfoot { inset-block-end: 0;} /* bottom */
	table tbody tr:nth-child(odd) {
 		background-color: var(--bgAlternate1);
  		color: var(--fgNormal);
	}
	
	table tbody tr { vertical-align:top;}
	table tbody tr:Hover { background-color: var(--bgHover);  }
	table tbody tr:Focus-within { background-color: var(--bgHover);  }

	td input { width: 100%;}

	.treeItemName {
		display: inline-block;
		font-weight: bold;
		min-width: 100px;
	}

	.treeItemValue {
		min-width: 100px;
	}

	/* END of style of the app */
	/* Start of nav */
	#toolsMainBodyNav .CDEFPropertyName::after  { white-space: nowrap;  content: " property"; color:silver;}
	#toolsMainBodyNav .CDEFMethodName::after {  white-space: nowrap; content: " method"; color:silver;}
	#toolsMainBodyNav .CDEFClassParameterName::after  { white-space: nowrap; content: " parameter"; color:silver;}
	#toolsMainBodyNav .CDEFQueryName::after  { white-space: nowrap; content: " query"; color:silver;}
	#toolsMainBodyNav .CDEFStorageName::after  { white-space: nowrap; content: " storage"; color:silver;}
	#toolsMainBodyNav .CDEFIndexName::after  { white-space: nowrap; content: " index"; color:silver;}
	#toolsMainBodyNav .CDEFXdataName::after  { white-space: nowrap; content: " xdata"; color:silver;}
	
    nav a { margin-top: 0.25em;}
	/* END of nav */

	/* Start of style for the code display */

	.narrative { color: #80ff80; }

	/* code containers */
	.EmbeddedJS { background-color: var(--bgAlternate1); display:inline-block;}
	.EmbeddedSQL { background-color: var(--bgAlternate1); display:inline-block; vertical-align: top;}
	.EmbeddedXML { background-color: var(--bgAlternate1); display:inline-block;}
	.EmbeddedPython { background-color: var(--bgAlternate1); display:inline-block;}


	.LensMenu { background-color: var(--bgAlternate3);}
	.LensOption, .LensOption:visited { color: var(--fgInlineOption);}
	.LensOption:hover { background-color: var(--bgAlternate2); }

	/* General purpose classes that could be applicable to any language */

	.codeWarning { border-style:solid; border-color:var(--borderWarning); border-width:1px 5px 1px 5px;}
	.codeError { border-style:solid; border-color:var(--borderError); border-width:1px 5px 1px 5px;}

	.codeComment { color: var(--fgComment); }
   	.codeProgramName, a.codeProgramName  { color: var(--fgProgramName);}
	.codeProgramLabel, a.codeProgramLabel, a.codeProgramLabel:visited {color: var(--fgProgramLabel);}
	.codeProgramKeyword { color: var(--fgProgramKeyword);}
    .codeKeyword { color: var(--fgCodeKeyword);}
	.codeFormalSpecList { display: inline-block; white-space: wrap; max-width: 75%;  vertical-align:top;}
    .codeFormalSpecItem {  white-space:nowrap; background-color: var(--bgAlternate1); }
	.codeGlobal, a.codeGlobal, a.codeGlobal:Visited {color: var(--fgCodeVariableGlobal);}
	.codeGlobalSet, a.codeGlobalSet, a.codeGlobalSet:visited {color: var(--fgCodeVariableGlobal); font-weight:bold;}
	.codeVariable { color:var(--fgCodeVariable);}
	.codeVariableSet { color:var(--fgCodeVariable); font-weight:bold; }
	.codeVariableParameter { color: var(--fgCodeArgument);}
	.codeVariableParameterSet { color: var(--fgCodeArgument); font-weight:bold;}
	.codeObjectMember, a.codeObjectMember, a.codeObjectMember:visited {color: var(--fgCodeLabel);}
	.codeString { color: var(--fgCodeString); }
	.codeNumber { color: var(--fgCodeNumber); }
	.codeLabel, a.codeLabel, a.codeLabel:visited { color: var(--fgCodeLabel);}
	.codeLabelDef { color:var(--fgCodeLabel); font-weight: bold;}


	/* Object script only styles */
	.CDEFOneClassMember { display:block; 
							/* 20px indent to make it not on the left side,
							   but because this is a block we are effectively inserting an unwanted new line so move the whole thing up 1 line (-1em)*/
							margin:-1em 0px 0px 20px;  }


	.XMLTag { color: var(--fgProgramKeyword); }
	.XMLAttribute { color:var(--fgCodeVariable); }
	.XMLString { color: var(--fgCodeString); }

	.SQLSection:hover { background-color: var(--bgAlternate2);}
	.SQLTableAlias { color: var(--fgCodeVariable);}
	.SQLTableAliasSet { color: var(--fgCodeVariable); font-weight:bold;}

	@keyframes blinker {
	from {background-color:var(--bgAlternate1);}
	to {background-color:var(--bgHilite);}
	}

	/* various high-lighting styles */

	.hilite {  background-color: /*#505050;*/ var(--bgHilite); border-bottom:1px solid yellow;
		animation-name: blinker;
		animation-duration: 1s;
		animation-iteration-count:20;
		animation-timing-function:ease-in-out;
		animation-direction: alternate;		
	}
	
	.hiliterow td { background-color: var(--bgHilite); }
	.goodrow td { background-color: var(--bgGood); }
	.warningrow td { background-color: var(--bgWarning); }
	.errorrow td { background-color: var(--bgError); }
	.hilitedata { background-color: var(--bgHilite); }
	.gooddata  { background-color: var(--bgGood); }
	.warningdata { background-color: var(--bgWarning); }
	.errordata { background-color: var(--bgError); }
	
	.hiliteSET1 { background-color: #ffcc00; color:white; } 
	.hiliteSET2 { background-color: #ff0000; color:white; }
	.hiliteSET3 { background-color: #0000ff; color:white; }
	.hiliteSET4 { background-color: #00cc00; color:white; }
	.hiliteSET5 { background-color: #800080; color:white; }
	.hiliteSET6 { background-color: #00ccb4; color:white; }
	.hiliteSET7 { background-color: #be00cc; color:white; }
	.hiliteSET8 { background-color: #b30000; color:white; }
	.hiliteSET9 { background-color: none; }
	.hiliteGET1 { background-color: #cca300; color:white; } 
	.hiliteGET2 { background-color: #cc0000; color:white; } 
	.hiliteGET3 { background-color: #0000cc; color:white; }
	.hiliteGET4 { background-color: #009900; color:white; }
	.hiliteGET5 { background-color: #660066; color:white; }
	.hiliteGET6 { background-color: #009987; color:white; }
	.hiliteGET7 { background-color: #8e0099; color:white; }
	.hiliteGET8 { background-color: #860000; color:white; }
	.hiliteGET9 { background-color: none; }
	
	/* End of code display */


 	</style>
	>
}

}
