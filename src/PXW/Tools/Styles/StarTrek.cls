Class PXW.Tools.Styles.StarTrek Extends PXW.Tools.Styles.super
{

Property CDEFDescriptionsAsText As %Boolean [ InitialExpression = 1 ];

Property CDEFMenuInline As %Boolean [ InitialExpression = 1 ];

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

		--bgHilite:#878700;
		--bgWarning: #f3a488;
		--bgError: #7b2c2c;
		--bgGood: #225922;
	}	


	body {border:0; margin:0; padding:0; background-color:#1E1E1E; color:white; height: 100%; 
	        display: flex; flex-direction: column;
					font-family:helvetica;  font-stretch:ultra-condensed; font-weight: bold;
			}
	a { text-decoration:none;  color: inherit;}
	a:visited { text-decoration:none; color: inherit; }
	a:hover { text-decoration:none;  color: inherit; }
	a:active { text-decoration:none;  color: inherit; }
	pre { margin:0px; tab-size:4; font-weight: normal;}

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
	#toolsMainTop { }
	#toolsHead { 
		margin:0px;
		border-color: var(--lcars1);
		border-style: solid;
		/*border-width: 0px 0px 0px 100px;*/
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
	#toolsMenu { display:none;
		margin-top:10px;
		background-color: var(--lcars1);
		width:100px; min-height: 100px;
		border-width: 0px 0px 0px 100px;
		border-radius: 50% 0px 0px 0px;
		padding:0px;
	}


	#toolsTitle { 
		margin-top:10px;
		border-color: var(--lcars2);
		border-style: solid;
		border-width: 0px 10px 0px 100px;
		border-radius: 100pt 0px 0px 0px;
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

	#toolsMainBodyContainer {  width:100%; display:flex; height:100%; }
	#toolsMainBodyNav {  order:1;  display:block; vertical-align: top; height: 100%; width: 20%;
					background-color: var(--lcars2);
					padding-top:20px;
					overflow-x: clip; overflow-y: auto;}
	#toolsMainBodyNav a { text-transform: uppercase; text-align: right; color:black; 
	                 width:100%; display: block; 
					 min-height:5%; 
					 border-top: 4px solid black;
					 padding-top:30px; 
					  font-weight: bold;
						
					 }



	#toolsMainBodyContent { order:2; display:block; vertical-align: top;
					 height: 100%; width: 80%; 
					 	margin: 0;
						background-color: black;
						border-radius:10px 0px 0px 0px; 
						border-width: 20px 0px 20px 20px;
						border-style: solid;
						border-color:black;
						padding:0px 20px 0px 0px;
						/*padding:20px 0px 0px 10px;*/
						 overflow: auto;}

	/*#toolsMainBodyContent div { display:inline; width:200px; }*/
	#PXWTools div { display: inline-block; width: 48%;}

	#toolsMainBodyContent fieldset { /*display:inline; width:45%;*/
					background-color: black; color:white; 
					/*border-color: var(--lcars3);*/
					border-style: solid;
					border-width: 20px 50px 0px 0px;
					border-radius: 0px 20px 0px 0px; 
					vertical-align: bottom;
					padding: 0px 0px 30px 0px;
					margin: 0px 0px 30px 0px;
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
										border-radius: 0px 20px 0px 0px;
										border-width: 0px 40px 0px 0px;
										border-style: solid;
	}
	#toolsMainBodyContent .section2 h2 { background-color: var(--lcars6);
						text-transform: uppercase;
						border-radius: 20px 0 0 20px;
						padding-left: 20px;		
						color:black;								
	}

	#toolsMainBodyContent .section2:nth-child(odd) {  border-color: var(--lcars7);}
	#toolsMainBodyContent .section2:nth-child(odd) h2 {  background-color: var(--lcars7);}


	#toolsMainBodyContent .section2 .comment { border:0; padding-left:10px;}
	#toolsMainBodyContent .section3 {  display:block; margin:5px 0px 0px 0px;}
	#toolsMainBodyContent .section3 .comment { border:0; padding-left:10px;}

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
