Class PXW.Tools.Styles.Hip Extends PXW.Tools.Styles.super
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
	}	


	html { height: 100%;}
	body {border:0; margin:0; padding:0; background-color: var(--bgNormal); color: var(--fgNormal); height: 100%; display: flex; flex-direction: column;
			font-family: Arial, Helvetica, sans-serif; font-size: small;} 
	a { text-decoration:none;  color: inherit;}
	a:visited { text-decoration:none; color: inherit; }
	a:hover { text-decoration:none;  color: inherit; }
	a:active { text-decoration:none;  color: inherit; }
	pre { margin:0px; tab-size:4; font-size: medium;}


	#toolsMainTop { }
	#toolsHead { }
	#toolsHead form { display:inline; margin: 0px; padding:0px; border:0px; }
	#toolsHead form fieldset { display:inline;  }
	#toolsMenu {}
	#toolsTitle {}
	#toolsMainBody { flex-grow: 1;overflow:auto;}
	#toolsMainBodyContainer {  width:100%; display:flex; height:100%; }
	#toolsMainBodyNav {  order:1;  display:block; vertical-align: top; height: 100%; width: 15%; padding:10px; overflow: auto; background-color: var(--bgAlternate1);  transition:width 0.25s ease-in-out;transition-delay:1s;}
	/*#toolsMainBodyNav:Hover {  width: 30%; }*/
	#toolsMainBodyNav a { width: 100%; display: block;}
	#toolsMainBodyNavTEMP {  display:none; }
	#toolsMainBodyContent { order:2; display:block; vertical-align: top; height: 100%; width: 85%; overflow: auto;}
	#toolsMainBodyContent .section1 {  display:block; margin:10px 0px 0px 0px;}
	#toolsMainBodyContent .section1 .comment { border:0; padding-left:20px;}
	#toolsMainBodyContent .section2 {  display:block; margin:10px 0px 0px 0px;}
	#toolsMainBodyContent .section2 .comment { border:0; padding-left:10px;}
	#toolsMainBodyContent .section3 {  display:block; margin:5px 0px 0px 0px; background-color: var(--bgAlternate2) ;}
	#toolsMainBodyContent .section3 .comment { border:0; padding-left:10px;}

	/* The intention  of the sections is that they are containers so it goes like this*/
	/* content 
		section1
			section2
			section2
				section3
			section2
	*/

	#toolsFooter { }
	table { width: 100%;}
	table thead, table tfoot { position: sticky;  background: var(--bgAlternate3);}
	table thead { inset-block-start: 0;} /* top */
	table tfoot { inset-block-end: 0;} /* bottom */
	table tbody tr:nth-child(odd) {
 		background-color: var(--bgAlternate1);
  		color: var(--fgNormal);
	}
	
	table tbody tr { vertical-align:top;}
	table tbody tr:Hover { background-color: var(--bgHover);  }

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

	.treeItemName {
		display: inline-block;
		font-weight: bold;
		min-width: 200px;
	}

	.treeItemNameBranch {
		display: inline-block;
		font-weight: bold;
		text-decoration: underline;
		min-width: 200px;
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
	#toolsMainBodyNav a { margin-top:0.25em;}
	/* END of nav */

	/* Start of style for the code display */

	.comment { color: var(--fgComment); }

	.EmbeddedJS { background-color: var(--bgAlternate1); display:inline-block;}
	.EmbeddedSQL { background-color: var(--bgAlternate1); display:inline-block; vertical-align: top;}
	.EmbeddedXML { background-color: var(--bgAlternate1); display:inline-block;}
	.EmbeddedPython { background-color: var(--bgAlternate1); display:inline-block;}

	.CDEFOneClassMember { display:block; margin:0px 0px 0px 20px;  }
	.CDEFComment { color: var(--fgComment); }
   	.CDEFClassName, a.CDEFClassName  { color: var(--fgProgramName);}
	.CDEFMember, a.CDEFMember, a.CDEFMember:visited {color: var(--fgProgramLabel);}
	.CDEFKeyword { color: var(--fgProgramKeyword);}

    .KeyWord { color:var(--fgCodeKeyword);}
	.Warning { border-style:solid; border-color:orange; border-width:1px 5px 1px 5px;}
	.Error { border-style:solid; border-color:red; border-width:1px 5px 1px 5px;}

	.CDEFItemMenu { background-color: var(--bgAlternate3);}
	.CDEFOption, .CDEFOption:visited { color: var(--fgInlineOption);}
	.CDEFOption:hover { background-color: var(--bgAlternate2); }

    .CDEFFormalSpecList { display: inline-block; white-space: wrap; max-width: 75%;  vertical-align:top;}
    .CDEFFormalSpecItem {  white-space:nowrap; background-color: var(--bgAlternate1); }

	.COSGlobal, a.COSGlobal, a.COSGlobal:Visited {color: var(--fgCodeVariableGlobal);}
	.COSGlobalSet, a.COSGlobalSet, a.COSGlobalSet:visited {color: var(--fgCodeVariableGlobal); font-weight:bold;}

	.COSObjectMember, a.COSObjectMember, a.COSObjectMember:visited {color: var(--fgCodeLabel);}

	.COSVariable { color:var(--fgCodeVariable);}
	.COSVariableSet { color:var(--fgCodeVariable); font-weight:bold; }
	.COSVariableParameter { color: var(--fgCodeArgument);}
	.COSVariableParameterSet { color: var(--fgCodeArgument); font-weight:bold;}

	.COSString { color: var(--fgCodeString); }
	.COSNumber { color: var(--fgCodeNumber); }

	.COSLabel, a.COSLabel, a.COSLabel:visited { color: var(--fgCodeLabel);}
	.COSLabelDef { color:var(--fgCodeLabel); font-weight: bold;}

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
	
	/* End of code display */


 	</style>
	>
}

}
