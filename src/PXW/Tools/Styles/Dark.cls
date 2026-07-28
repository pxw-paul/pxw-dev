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
		color-scheme: dark;
		
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
		font-family: Arial, Helvetica, sans-serif; font-size: medium;	
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

	details {
		margin:0.5em;
	}

	details summary {
		font-size:1.5em;
		padding-bottom:0.2em;
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

	nav details::details-content {
		padding-left:2em;
	}
	nav details summary { 
		font-size:1em;
		padding-bottom:0.2em;
	}
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
	
	/* These are used when a variable is SET (varid=)                      These are used when a variable is used (fetchid=)                      These are used for large sections highligts (defid=)*/
	.hiliteSET1 { background-color: hsl(0,   100%, 40%); color:white; } .hiliteGET1 { background-color: light-dark(hsl(0  ,100%,75%),hsl(0  , 100%, 25%)); color:white; } 					.hiliteDEF1 { background-color: light-dark(hsl(0  ,100%,90%),hsl(0  , 100%, 10%));} 
	.hiliteSET2 { background-color: hsl(45,  100%, 40%); color:black; } .hiliteGET2 { background-color: light-dark(hsl(40 ,100%,75%),hsl(40 , 100%, 25%)); color:light-dark(black,white); } 	.hiliteDEF2 { background-color: light-dark(hsl(40 ,100%,90%),hsl(40 , 100%, 10%));}
	.hiliteSET3 { background-color: hsl(315, 100%, 40%); color:white; } .hiliteGET3 { background-color: light-dark(hsl(315,100%,75%),hsl(315, 100%, 25%)); color:white; }					.hiliteDEF3 { background-color: light-dark(hsl(315,100%,90%),hsl(315, 100%, 10%));}
	.hiliteSET4 { background-color: hsl(90,  100%, 40%); color:black; } .hiliteGET4 { background-color: light-dark(hsl(90 ,100%,75%),hsl(90 , 100%, 25%)); color:light-dark(black,white); }	.hiliteDEF4 { background-color: light-dark(hsl(90, 100%,90%),hsl(90 , 100%, 10%));}
	.hiliteSET5 { background-color: hsl(270, 100%, 40%); color:white; } .hiliteGET5 { background-color: light-dark(hsl(270,100%,75%),hsl(270, 100%, 25%)); color:white; }					.hiliteDEF5 { background-color: light-dark(hsl(270,100%,90%),hsl(270, 100%, 10%));}
	.hiliteSET6 { background-color: hsl(135, 100%, 40%); color:black; } .hiliteGET6 { background-color: light-dark(hsl(135,100%,75%),hsl(135, 100%, 25%)); color:light-dark(black,white); }	.hiliteDEF6 { background-color: light-dark(hsl(135,100%,90%),hsl(135, 100%, 10%));}
	.hiliteSET7 { background-color: hsl(225, 100%, 40%); color:white; } .hiliteGET7 { background-color: light-dark(hsl(225,100%,75%),hsl(225, 100%, 25%)); color:white; }					.hiliteDEF7 { background-color: light-dark(hsl(225,100%,90%),hsl(225, 100%, 10%));}
	.hiliteSET8 { background-color: hsl(180, 100%, 40%); color:black; } .hiliteGET8 { background-color: light-dark(hsl(180,100%,75%),hsl(180, 100%, 25%)); color:light-dark(black,white); }	.hiliteDEF8 { background-color: light-dark(hsl(180,100%,90%),hsl(180, 100%, 10%));}
	.hiliteSET9 { background-color: none; }                               .hiliteGET9 { background-color: none; }								  .hiliteDEF9 { background-color: none; }
	
	/* End of code display */


 	</style>
	>
}

}
