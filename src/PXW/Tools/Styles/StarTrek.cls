Class PXW.Tools.Styles.StarTrek Extends PXW.Tools.Styles.super
{

Property CDEFDescriptionsAsText As %Boolean [ InitialExpression = 1 ];

Property CDEFMenuInline As %Boolean [ InitialExpression = 1 ];

/*
Here are the main named holders
    +----------------------------------------------+
    |#toolsHead header                             |
    |  div #toolsForms                             |
    +----------------------------------------------+
    |#toolsTitle  h1                               |
    +----------------------------------------------+
    |#toolsMainBody main                           |
    |+------------------+-------------------------+|
    ||#toolsMainBodyNav |#toolsMainBodyContent    ||
    ||  nav             |  main                   ||
    ||                  |                         ||
    |+------------------+-------------------------+|
    +----------------------------------------------+
    |#toolsFooter spans                            |
    +----------------------------------------------+

        Some pages have Top, Left, and Right content:
        toolsMainTLR
        +-------------------------------+
        |#toolsMainTop                  |
        +-----+-------------------------+
        |#toolsMainLeft |toolsMainRight |
        |               |               |
        +---------------+---------------+
*/
Method WriteStyles()
{
    &html<
    <style> /*-- extra style --*/
	/* https://www.w3schools.com/css/css3_box-sizing.asp */
	* {
 		box-sizing: border-box;
	}

	/* https://codepen.io/Mokurunner/details/wvyKJy */
	:root {
		--lcars1: #FFDD99;
		--lcars2: #FFCC66;
		--lcars3: #FF9933;
		--lcars4: #664466;
		--lcars5: #CC99CC;
		--lcars6: #99CCFF;
		--lcars7: #3366CC;
		--lcars8: #006699;

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

	body {
	        background-color:#1E1E1E; color:white; 
            font-family:helvetica;  font-stretch:ultra-condensed; font-weight: bold;
    		border:0; margin:0; padding:0; 
			height: 100%; 
			display: grid; 
			grid-template-areas:
				'toolsHead toolsHead'
				'toolsTitle toolsTitle'
				'toolsMainBodyNav toolsMainBodyContent'
				'toolsFooter toolsFooter';
			grid-template-columns: #(" minmax(15%, auto) 1fr ")#;
			grid-template-rows: auto auto #("1fr")# auto;
			grid-column-gap: 0;
			grid-row-gap: 0;			
		} 	a { text-decoration:none;  color: inherit;}
	a:visited { text-decoration:none; color: inherit; }
	a:hover { text-decoration:none;  color: inherit; }
	a:active { text-decoration:none;  color: inherit; }
	pre { margin:0px; tab-size:4; font-weight: normal;}


    /* Look */
	::-webkit-scrollbar {
	  width: 20px;
	}

	/* Track */
	::-webkit-scrollbar-track {
	  /*box-shadow: inset 0 0 5px grey;  */
	  border: 1px solid var(--lcars8);
	  border-radius: 10px;
	}
	 
	/* Handle */
	::-webkit-scrollbar-thumb {
	  background: var(--lcars8); 
	  border-radius: 10px;
	}

	/* Handle on hover */
	::-webkit-scrollbar-thumb:hover {
	  background: #b30000; 
	}
	::-webkit-scrollbar-corner {
	  background:black;
	}
 
	#toolsHead { 
		margin:0px;
		border-color: var(--lcars7);
		border-style: solid;
		border-width: 0px 0px 10px 100px;
		border-radius: 0px 0px 0px 50px; 
		padding: 0px;
		background-color: black;
		position:relative		
	  }
	
	/* trying to get the border to overlap the container border so we get the curve on the inside */
	#toolsForms { margin-left:-20px; 
		/*border-radius: 0px 0px 0px 20px; */
		border-radius: 0px 0px 0px 20px; 
		padding: 20px;
		background-color: black;
	}
	#toolsForms::after  { font-family: monospace; display:inline-block; position:absolute; right:10px; height:75%; max-width:50%;text-align: right; padding:0px; white-space: wrap; content: "#(..RandomNumbers())#"; color:var(--lcars5); overflow:hidden;}

	#toolsHead form { display:inline; margin: 0px; padding:0px; border:0px; }
	/*#toolsHead form fieldset { display:inline;  }
	*/

	#toolsHead form fieldset { display:inline; 
					background-color: var(--lcars1); color:white; 
					border-color: var(--lcars1);
					border-style: solid;
					border-width: 20px 20px 0px 20px;
					border-radius: 20px 20px 20px 20px; 
					vertical-align: bottom;
					padding: 0px;
					}
	#toolsHead form fieldset legend { display:none;}
	/*#toolsHead fieldset { margin: 0px; padding:0px; border:0px;}*/
	#toolsHead form fieldset input { 
					background-color: var(--lcars1); color:black; 
					/*text-transform: uppercase;*/
					 font-weight: bold; font-stretch:ultra-condensed;
					border:0px;
					}

	#toolsTitle { 
		margin-top:10px;
		border-color: var(--lcars2);
		border-style: solid;
		border-width: 0px 10px 0px 100px;
		border-radius: 100px 0px 0px 0px;
		background-color: var(--lcars2);
		padding: 0px; 
		text-align: right; 
		position:relative;
	  }

	#toolsTitle:before { content:' '; 
					margin: 0 10px 0 10px;
					border-left:10px solid black; border-right:10px solid black;
					background: linear-gradient(var(--lcars3) 50%, black 50%);
					position:absolute; left:400px; top:0; height: 100%; width:10%; }

	#toolsTitle:after { content:' '; 
					margin: 0 10px 0 10px;
					border-left:10px solid black; border-right:10px solid black;
					background: linear-gradient(black 50%,var(--lcars4) 50%);
					position:absolute; left:600px; top:0; height: 100%; width:20%; }


	#toolsTitle h1 {
		margin:0px 10px 0px 10px;
		border:0px;
		padding:0px 10px 0px 10px;
		text-align: right;
		text-transform: uppercase;
		background-color:black;
		display:inline;	
	}


	#toolsMainBody { 
		background-color: var(--lcars2);
		padding: 0px;
		flex-grow: 1;
		overflow: hidden;
	  }

	#toolsMainBodyNav {  vertical-align: top; 
					background-color: var(--lcars2);
					padding-top:20px;
                    overflow-x: clip; overflow-y: auto;
                    resize:horizontal;
                    }
	#toolsMainBodyNav a { text-transform: uppercase; text-align: right; color:black; 
	                 width:100%; display: block; 
					 min-height:5%; 
					 border-top: 4px solid black;
					 padding-top:30px; 
					 font-weight: bold;	
					 }
    #toolsMainBodyNav fieldset { 
					background-color: black; color:white; 
					border-color: var(--lcars3);
					border-style: solid;
					border-width: 20px 5px 20px 0px;
					border-radius: 0px 20px 20px 0px; 
					vertical-align: bottom;
					padding: 0px 20px 0px 0px;
					margin: 0px 0px 0px 0px;
					}
 
    #toolsMainBodyContent {
        margin:0; padding: 0; border:0;
        background-color: var(--lcars2);
    }
	#toolsMainBodyContent main { vertical-align: top;
					 	margin: 0;
						background-color: black;
						border-radius:10px 0px 0px 0px; 
						border-width: 20px 0px 20px 20px;
						border-style: solid;
						border-color:black;
						padding:0px 20px 0px 0px;
                        height:100%;
						 overflow: auto;
                        }

	#toolsMainBodyContent fieldset { 
					background-color: black; color:white; 
					border-color: var(--lcars3);
					border-style: solid;
					border-width: 20px 50px 0px 0px;
					border-radius: 0px 20px 20px 0px; 
					vertical-align: bottom;
					padding: 0px 0px 0px 0px;
					margin: 0px 0px 0px 0px;
					}
	#toolsMainBodyContent .toolTypeInternal form fieldset {  
					border-color: var(--lcars4);
					}

	#toolsMainBodyContent .toolTypeCode form fieldset {  
					border-color: var(--lcars5);
					}

	#toolsMainBodyContent fieldset legend { margin-left:20px;
			font-weight: bold;
		text-transform: uppercase;}

	/*#toolsMainBodyContent form { margin: 0px; padding:0px; border:0px;}*/
	#toolsMainBodyContent form fieldset input { 
					background-color: #f7c64a; color:black; 
					text-transform: uppercase;
					font-weight: bold; font-stretch:ultra-condensed;/*font-family:helvetica; */
					border:0px;
					}
	#toolsMainBodyContent .section1 {  display:block; margin:10px 0px 0px 0px; inset-block-start: 0;}

	#toolsMainBodyContent .section1 .comment { border:0; padding-left:20px;}
	#toolsMainBodyContent .section2 {  display:block; margin:10px 0px 0px 0px;
										border-color: var(--lcars6);
										border-radius: 0px 20px 20px 0px;
										border-width: 0px 40px 0px 0px;
										border-style: solid;
	}
	#toolsMainBodyContent .section2 h2 { background-color: var(--lcars6);
						text-transform: uppercase;
						border-radius: 20px 0 0 20px;
						padding-left: 20px;
						margin-top:0px;		
						color:black;								
	}

	#toolsMainBodyContent .section2:nth-child(odd) {  border-color: var(--lcars7);}
	#toolsMainBodyContent .section2:nth-child(odd) h2 {  background-color: var(--lcars7);}


	#toolsMainBodyContent .section2 .comment { border:0; padding-left:10px;}
	#toolsMainBodyContent .section3 {  display:block; margin:5px 0px 0px 0px;}
	#toolsMainBodyContent .section3 .comment { border:0; padding-left:10px;}

   #toolsMainTLR main {
        border:0; margin: 0; padding: 0; border-radius: 0; height:100%;
    }
    #toolsMainLeft {
         border-style:solid;
        border-color:var(--lcars4);
        border-radius:0 15px 15px 0;
        border-width:0 15px 0 0;
        background-color:var(--bgNormal);
    }

    #toolsMainLeft h2 {
        border:0; padding:0 0 0 20px; margin:0;
        background-color: var(--lcars4);
        z-index: 99;
        position: sticky;
        top: 0;
    }

     #toolsMainRight {
        border-style:solid;
        border-color:var(--lcars5);
        border-radius:15px 0 0 15px;
        border-width:0 0 0 15px;
        background-color:var(--bgNormal);
    }

    #toolsMainRight h2 {
        border:0; padding:0 0 0 20px; margin:0; 
        background-color: var(--lcars5);
        z-index: 99;
        position: sticky;
        top: 0;
    }

	#toolsFooter {
		background-color: var(--lcars2);
		color:black;
		text-align: right;
		font-weight: bold;
		text-transform: uppercase;
	}

	#toolsFooter span {
		border-left:10px solid black;
		padding:0px 20px 0px 20px;
	}

	#toolsFooter span:nth-child(odd) {
		background-color: var(--lcars7);
        color: white;
	}

	table { font-weight: bold;
	 		background-color: black; color:white; 
			/*margin-top: 20px;*/
			/*border-color: var(--lcars8);
			border-style: solid;
			border-width: 20px 50px 0px 0px;
			border-radius: 0px 20px 0px 0px; */
			width: 100%; 
	}
	tbody tr:nth-child(odd) {
 		background-color:#2E2E2E;
  		color: #fff;
	}
	table thead, table tfoot { position: sticky;  background: var(--lcars8);}
	table thead { inset-block-start: 0; }
	table thead tr th  { text-transform: uppercase; }
	table thead tr th a { 
					background-color: var(--lcars3); color:white; 
					border-color: var(--lcars3);
					border-style: solid;
					border-width: 2px 10px 2px 10px;
					border-radius: 10px 10px 10px 10px; 
					vertical-align: bottom; 
					padding: 0px;  margin-left:5px;
					text-align:right;
					width:75px;
					white-space: nowrap;}
	/*.CDEFOption:hover { background-
	table tfoot { inset-block-end: 0;} /* bottom */
	table tbody tr:Hover { background-color:#3e3e3e;  }

	#toolsMainBodyNavTEMP {  display:none; }

	#toolsMainBodyContent form fieldset table { 
					border:0px;
	}

	table tbody tr:Hover { background-color:#3e3e3e;  }

	/* END of style of the app */


	/* Start of nav */
	#toolsMainBodyNav .CDEFPropertyName  {background-color: var(--lcars1);  }
	#toolsMainBodyNav .CDEFMethodName { background-color: var(--lcars2);}
	#toolsMainBodyNav .CDEFClassParameterName  {  background-color: var(--lcars3);}
	#toolsMainBodyNav .CDEFQueryName  {  background-color: var(--lcars4);}
	#toolsMainBodyNav .CDEFIndexName  { background-color: var(--lcars5);} 
	#toolsMainBodyNav .CDEFStorageName  {  background-color: var(--lcars5);}
	#toolsMainBodyNav .CDEFXdataName  { background-color: var(--lcars6);}
	#toolsMainBodyNav .toolTypeInternal  { background-color: var(--lcars4); }
	#toolsMainBodyNav .toolTypeCode  { background-color: var(--lcars5); }	
	#toolsMainBodyNav .warning { background-color: orange;}
	#toolsMainBodyNav .error { background-color: red;}
	/* END of nav */
	/* Start of style for the code display */


	.EmbeddedJS { background-color:#404040; display:inline-block;}
	.EmbeddedSQL { background-color:#404040; display:inline-block; vertical-align: top;}
	.EmbeddedXML { background-color:#404040; display:inline-block;}
	.EmbeddedPython { background-color:#404040; display:inline-block;}

	.LensMenu { background-color:black; margin-top:20px; display:block; } 
	a.LensOption, a.LensOption:visited { 
					background-color: var(--lcars3); color:black; 
					border-color: var(--lcars3);
					border-style: solid;
					border-width: 10px 10px 0px 10px;
					border-radius: 10px 10px 10px 10px; 
					vertical-align: bottom; 
					padding: 0px;  margin-left:5px;
					text-align:right;
					text-transform: uppercase;
					font-weight: bold;  font-size: 0.9em;
					width:75px;}


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
	.CDEFOneClassMember { display:block; margin:0px 0px 0px 20px;  }

	.XMLTag { color:#85a6ff; }
	.XMLAttribute { color:#ade2ff; }
	.XMLString { color:#d4b57c; }

	.SQLSection:hover { background-color: #585858;}
	.SQLTableAlias { color:#ade2ff;}
	.SQLTableAliasSet { color:#ade2ff; font-weight:bold;}

	@keyframes blinker {
		0% {opacity: 1.0;}
		5% { opacity: 0.0;}
		10% { opacity: 1.0;}
		15% { opacity: 0.0;}
		20% { opacity: 1.0;}
		25% { opacity: 0.0;}
		30% { opacity: 1.0;}
		100% { opacity: 1.0;}
	}

	.hilite {  background-color: #505050; border-bottom:1px solid yellow;
		animation-name: blinker;
		animation-duration: 2s;
		animation-iteration-count:4;
	}

	.hiliterow td { background-color: var(--bgHilite); }
	.goodrow td { background-color: var(--bgGood); }
	.warningrow td { background-color: var(--bgWarning); }
	.errorrow td { background-color: var(--bgError); }
	.hilitedata { background-color: var(--bgHilite); }
	.gooddata  { background-color: var(--bgGood); }
	.warningdata { background-color: var(--bgWarning); }
	.errordata { background-color: var(--bgError); }


	.hiliteSET1 { background-color:#ffcc00; } 
	.hiliteSET2 { background-color:#ff0000; }
	.hiliteSET3 { background-color:#0000ff; }
	.hiliteSET4 { background-color:#00cc00; }
	.hiliteSET5 { background-color:#800080; }
	.hiliteSET6 { background-color:#00ccb4; }
	.hiliteSET7 { background-color:#be00cc; }
	.hiliteSET8 { background-color:#b30000; }
	.hiliteSET9 { background-color:none; }
	.hiliteGET1 { background-color:#cca300; } 
	.hiliteGET2 { background-color:#cc0000; } 
	.hiliteGET3 { background-color:#0000cc; }
	.hiliteGET4 { background-color:#009900; }
	.hiliteGET5 { background-color:#660066; }
	.hiliteGET6 { background-color:#009987; }
	.hiliteGET7 { background-color:#8e0099; }
	.hiliteGET8 { background-color:#860000; }
	.hiliteGET9 { background-color:none; }
	

	</style>
	>
}

ClassMethod RandomNumbers() As %String
{
	Set s=""
	For i=1:1:10 {
		For j=1:1:20 {
			For k=1:1:4 {
				Set s=s_$CHAR($RANDOM(10)+$ASCII("0"))
			}
			Set s=s_" "
		}
	}
	Quit s
}

}
