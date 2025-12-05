Class PXW.Tools.Styles.StarTrekGrid Extends PXW.Tools.Styles.super
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

		--bgNormal: #1E1E1E;
		--bgAlternate1: #2E2E2E;
		--bgAlternate2: #3E3E3E;
		--bgAlternate3: black;
		--bgHover: #3E3E3E;
		--bgHilite:#6b6b1d;
		--bgWarning: #f3a488;
		--bgError: #9f3d3d;
		--bgGood: #225922;

        --borderNormal: silver;
        --borderAlternate1: yellow;
		--borderWarning: #f3a488;
		--borderError: #9f3d3d;
		--borderGood: #225922;
	}	


	body {border:0; margin:0; padding:0; 
            background-color:#1E1E1E; color:white; 
            height: #("100vh")#; 
			font-family:helvetica;  font-stretch:ultra-condensed; font-weight: bold;
            display: grid; 
            grid-template-areas:
                'toolsHead toolsHead'
                'toolsTitle toolsTitle'
                'toolsMainBodyNav toolsMainBodyContent'
                'toolsFooter toolsFooter';
            grid-template-columns: #("1fr 9fr")#;
            grid-template-rows: #("auto auto 1fr auto")#;
            grid-column-gap:0;
            grid-row-gap:0;                        
		}
	a { text-decoration:none;  color: inherit;}
	a:visited { text-decoration:none; color: inherit; }
	a:hover { text-decoration:none;  color: inherit; }
	a:active { text-decoration:none;  color: inherit; }
	pre { margin:0px; tab-size:4; font-weight: normal;}

    /* layout */
    #toolsHead { grid-area:toolsHead; }
	#toolsHead form { display:inline; margin: 0px; padding:0px; border:0px; }
	#toolsHead form fieldset { display:inline; }

    #toolsForms { }

	#toolsTitle { grid-area:toolsTitle; }

	#toolsMainBodyNav { grid-area:toolsMainBodyNav; overflow:auto;}
	#toolsMainBodyNav a { width: 100%; display: block;}

	#toolsMainBodyContent { grid-area:toolsMainBodyContent; overflow:auto;}

    #toolsFooter { grid-area:toolsFooter;}
	
    #toolsMainTLRContainer {
        display:block;
        height:100%;
    }
    
    #toolsMainTLR {
        height: 100%;
        display: grid;
        grid-template-areas:
            'toolsMainTop toolsMainTop'
            'toolsMainLeft toolsMainRight'
            'toolsMainFoot toolsMainFoot';
        grid-template-columns: auto auto;
        grid-template-rows:  #("auto")#  #("1fr")# #("auto")# ;
        grid-column-gap: 1em;
        grid-row-gap: 1em;
    }

   
    #toolsMainTop {
        grid-area: toolsMainTop;
    }

    #toolsMainLeft {
        grid-area: toolsMainLeft;
        overflow:auto;
        resize:horizontal;
    }
   
    #toolsMainRight {
        grid-area: toolsMainRight;
        overflow:auto;
   }
   
   
    #toosMainFoot {
        grid-area: toolsMainFoot;
    }

    #toolsMainTop textarea {
        resize:vertical;
    }

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
		border-color: red; /* var(--lcars7); */
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
				/*transform:scale(1,1.5);*/
	  }
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
                    resize:horizontal;}
	#toolsMainBodyNav a { text-transform: uppercase; text-align: right; color:black; 
	                 width:100%; display: block; 
					 min-height:5%; 
					 border-top: 4px solid black;
					 padding-top:30px; 
					  font-weight: bold;
						
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

	#toolsMainBodyContent fieldset { /*display:inline; width:45%;*/
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

	.nocopy	{
		-webkit-user-select: none;
		-khtml-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		-o-user-select: none;
		user-select: none;
	}

	.unInteresting {
		-webkit-user-select: none;
		-khtml-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		-o-user-select: none;
		user-select: none;
	}
	.quiteInteresting {
		-webkit-user-select: text;
		-khtml-user-select: text;
		-moz-user-select: text;
		-ms-user-select: text;
		-o-user-select: text;
		user-select: text;
	}
	.veryInteresting {
		-webkit-user-select: text;
		-khtml-user-select: text;
		-moz-user-select: text;
		-ms-user-select: text;
		-o-user-select: text;
		user-select: text;
		font-weight:bold; font-size:1.1em;
	}

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

	.CDEFComment { color:#67BD5A; }
   	.CDEFClassName, a.CDEFClassName  { color:#4EC9B0;}
	.CDEFMember, a.CDEFMember, a.CDEFMember:visited {color:#DCDCAA;}
	.CDEFKeyword { color:#85A6FF;}
	.CDEFOneClassMember { display:block; margin:0px 0px 0px 20px;  }

    .KeyWord { color:white;}
	.Warning { border-style:solid; border-color:orange; border-width:1px 5px 1px 5px;}
	.Error { border-style:solid; border-color:red; border-width:1px 5px 1px 5px;}

	.CDEFItemMenu { background-color:black; margin-top:20px; display:block; } 
	a.CDEFOption, a.CDEFOption:visited { 
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
	/*.CDEFOption:hover { background-color:#3e3e3e; }*/

    .CDEFFormalSpecList { display: inline-block; white-space: wrap; max-width: 75%;  vertical-align:top;}
    .CDEFFormalSpecItem {  white-space:nowrap; background-color:#2E2E2E; }

	.COSGlobal, a.COSGlobal, a.COSGlobal:Visited {color:#64c9ff;}
	.COSGlobalSet, a.COSGlobalSet, a.COSGlobalSet:visited {color:#64c9ff; font-weight:bold;}

	.COSObjectMember, a.COSObjectMember, a.COSObjectMember:visited {color:#DCDCAA;}

	.COSVariable { color:#ade2ff;}
	.COSVariableSet { color:#ade2ff; font-weight:bold; }
	.COSVariableParameter { color:#ff75f4;}
	.COSVariableParameterSet { color:#ff75f4; font-weight:bold;}

	.COSString { color:#d4b57c; }
	.COSNumber { color:#d4b57c; }

	.COSLabel, a.COSLabel, a.COSLabel:visited { color:#DCDCAA;}
	.COSLabelDef { color:#DCDCAA; font-weight: bold;}

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
