Class PXW.Tools.Styles.Green Extends PXW.Tools.Styles.super
{

Property CDEFMenuInline As %Boolean [ InitialExpression = 1 ];

Method WriteStyles()
{
    &html<
    <style> /*-- extra style --*/
    /* https://css-tricks.com/old-timey-terminal-styling/ */
	/* https://www.w3schools.com/css/css3_box-sizing.asp */
	* {
 		box-sizing: border-box;
	}

	:root {
		/* background colours: ;*/
		--bgNormal: #FFFFFF;
		--bgAlternate1: #EEEEEE;
		--bgAlternate2: #DDDDDD;
		--bgAlternate3: #FFFFFF;
		--bgHover: #67BD5A;
		--bgHilite: #57BD4A;
		--bgWarning: #47AD3A;
		--bgError: #379D2A;
		--bgGood: #b3ffb3;

		/* foreground colours: ;*/
		--fgNormal: #67BD5A;
		--fgInverse: black;
		--fgProgramName: #2EA990;
		--fgProgramLabel: #ACAC7A;
		--fgProgramKeyword: #6586DF;
		--fgCodeKeyword: black;
		--fgCodeVariable: #6DA2FF;
		--fgCodeVariableGlobal: #64c9ff;
		--fgCodeArgument: #ff75f4;
		--fgCodeLabel: #ACAC7A;
		--fgCodeString: #2e8122; 
		--fgCodeNumber: #B4955C; 
		--fgComment: #2e8122;
		--fgInlineOption: silver;
	}	
    body {
        background-color: black;
        background-image: radial-gradient(rgba(0, 75, 0, 0.75), black 120% );
        height: 100vh;
        margin: 0;
        overflow: hidden;
        padding: 2rem;
        color: /*white;*/ #67BD5A; 
        font: 1.3rem Inconsolata, monospace;
        text-shadow: 0 0 5px #C8C8C8;

        border:0; margin:0; padding:0; height: 100%; display: flex; flex-direction: column;
    }
    body::after {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        background: repeating-linear-gradient(0deg, rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0.15) 1px, transparent 1px, transparent 2px);
        pointer-events: none;
    }
    
    /*::selection {
        background: #0080FF;
        text-shadow: none;
    }*/


	html { height: 100%;}
	/*body {border:0; margin:0; padding:0; background-color:#1E1E1E; color:white; height: 100%; display: flex; flex-direction: column;} */
	a { text-decoration:none;  color: inherit;}
	a:visited { text-decoration:none; color: inherit; }
	a:hover { text-decoration:none;  color: inherit; }
	a:active { text-decoration:none;  color: inherit; }
	pre { margin:0px; tab-size:4;}


	#toolsMainTop { }
	#toolsHead { }
	#toolsHead form { display:inline; margin: 0px; padding:0px; border:0px; }
	#toolsHead form fieldset { display:inline;  }
	#toolsMenu {}
	#toolsTitle {}
	#toolsMainBody { flex-grow: 1;overflow:auto;}
	#toolsMainBodyContainer {  width:100%; display:flex; height:100%; }
	#toolsMainBodyNav {  order:1;  display:block; vertical-align: top; height: 100%; width: 15%; margin:0px; overflow: auto; }
	#toolsMainBodyNav a { width: 100%; display: block;}
	#toolsMainBodyNavTEMP {  display:none; }
	#toolsMainBodyContent { order:2; display:block; vertical-align: top; height: 100%; width: 85%; overflow: auto;}
	#toolsFooter { }

	table thead, table tfoot { position: sticky;  background: black;}
	table thead { inset-block-start: 0;} /* top */
	table tfoot { inset-block-end: 0;} /* bottom */
	table tbody tr:nth-child(odd) {
 		/*background-color:#2E2E2E;
  		color: #fff;*/
	}
	table tbody tr:Hover { background-color:var(--bgHover); color: var(--fgInverse);}

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
	#toolsMainBodyNav .CDEFPropertyName::after  {  content: ".pty"; /* color:silver;*/}
	#toolsMainBodyNav .CDEFMethodName::after {  content: ".mtd"; /* color:silver;*/}
	#toolsMainBodyNav .CDEFClassParameterName::after  {  content: ".par"; /*color:silver;*/}
	#toolsMainBodyNav .CDEFQueryName::after  {  content: ".qry"; /*color:silver;*/}
	#toolsMainBodyNav .CDEFStorageName::after  {  content: ".stg"; /*color:silver;*/}
	#toolsMainBodyNav .CDEFIndexName::after  {  content: ".idx"; /*color:silver;*/}
	#toolsMainBodyNav .CDEFXdataName::after  {  content: ".xda"; /*color:silver;*/}
	
	/* END of nav */

	/* Start of style for the code display */

	.EmbeddedJS { /*background-color:#404040*/; display:inline-block;}
	.EmbeddedSQL {/*background-color:#404040;*/ display:inline-block; vertical-align: top;}
	.EmbeddedXML {/*background-color:#404040;*/ display:inline-block;}

	.CDEFComment { color:#67BD5A; }
   	.CDEFClassName, a.CDEFClassName  { /*color:#4EC9B0;*/}
	.CDEFMember, a.CDEFMember, a.CDEFMember:visited {/*color:#DCDCAA;*/}
	.CDEFKeyword { /*color:#85A6FF;*/}

    .KeyWord { /*color:white;*/}
	.Warning { /*border-style:solid; border-color:red; border-width:1px 5px 1px 5px; */ background-color:#67BD5A; color:black;}

	.CDEFItemMenu {/* background-color:#0E0E0E;*/ }
	.CDEFOption, .CDEFOption:visited { /* color:silver; */ background-color:#67BD5A; color:black;}
	.CDEFOption:hover { /*background-color:#3e3e3e;*/ background-color:#67BD5A; color:black; }

    .CDEFFormalSpecList { display: inline-block; white-space: wrap; max-width: 75%;  vertical-align:top;}
    .CDEFFormalSpecItem {  white-space:nowrap; /*background-color:#2E2E2E;*/ }

	.COSGlobal, a.COSGlobal, a.COSGlobal:Visited {/*color:#64c9ff;*/}
	.COSGlobalSet, a.COSGlobalSet, a.COSGlobalSet:visited {/*color:#64c9ff;*/ font-weight:bold;}

	.COSObjectMember, a.COSObjectMember, a.COSObjectMember:visited {/*color:#DCDCAA;*/}

	.COSVariable { /*color:#ade2ff;*/}
	.COSVariableSet { /*color:#ade2ff;*/ font-weight:bold; }
	.COSVariableParameter { /*color:#ff75f4;*/}
	.COSVariableParameterSet { /*color:#ff75f4;*/ font-weight:bold;}

	.COSString { /*color:#d4b57c;*/ }
	.COSNumber { /*color:#d4b57c; */}

	.COSLabel, a.COSLabel, a.COSLabel:visited { /*color:#DCDCAA;*/}
	.COSLabelDef { /*color:#DCDCAA;*/ font-weight: bold;}

	.XMLTag { /*color:#85a6ff;*/ }
	.XMLAttribute { /*color:#ade2ff;*/ }
	.XMLString { /*color:#d4b57c;*/ }

	.SQLColumn:hover { background-color: #585858;}
	.SQLTableAlias { /*color:#ade2ff;*/}
	.SQLTableAliasSet {/* color:#ade2ff;*/ font-weight:bold;}


	@keyframes blinker {
	from {opacity: 1.0;}
	to {opacity: 0.0;}
	}

	.hilite {  /*background-color: #505050; border-bottom:1px solid yellow;*/ 
		text-decoration:blink;
		animation-name: blinker;
		animation-duration: 0.6s;
		animation-iteration-count:infinite;
		animation-timing-function:ease-in-out;
		animation-direction: alternate;	
	}

	.hiliterow td { background-color: var(--bgHilite); color: var(--fgInverse); }
	.goodrow td { background-color: var(--bgGood); color: var(--fgInverse);}
	.warningrow td { background-color: var(--bgWarning); color: var(--fgInverse);}
	.errorrow td { background-color: var(--bgError); color: var(--fgInverse);}

	.hilitedata { background-color: var(--bgHilite); color: var(--fgInverse); }
	.gooddata  { background-color: var(--bgGood); color: var(--fgInverse);}
	.warningdata { background-color: var(--bgWarning); color: var(--fgInverse);}
	.errordata { background-color: var(--bgError); color: var(--fgInverse); }

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


    /*.CDEFElement { font-family: monospace; white-space: pre;}
	.CDEFDescription { color:#67BD5A; }
	

    .CDEFKeyWord { color:white;}
    .CDEFClassName, a.CDEFClassName  { color:#4EC9B0;}
    .CDEFName, a.CDEFName { color:#DCDCAA;} 
    .CDEFFormalSpecVar { color:#ff75f4;}
    .CDEFString { color:#d4b57c; }
	
	.COSCommand { color:#ffffff;}
	.COSComment { color:#80bd66;}
	.COSDescription { margin-left:20px; background-color: #303030; color:#80bd66;}
	.COSVariable { color:#ade2ff;}
	.COSVariableSet { color:#ade2ff; font-weight:bold; }
	.COSObject {color:#ade2ff;} 
	.COSObjectParameter {color:#ff75f4;}  
	.COSObjectsClass, a.COSObjectsClass, a.COSObjectsClass:visited {color:#4EC9B0;}
	.COSObjectsMethod, a.COSObjectsMethod, a.COSObjectsMethod:visited {color:#DCDCAA;}
	.COSObjectsProperty, a.COSObjectsProperty, a.COSObjectsProperty:visited {color:#DCDCAA;}
	.COSObjectsQuery, a.COSObjectsQuery, a.COSObjectsQuery:visited {color:#DCDCAA;}
	.COSLabel { color:#DCDCAA; }
	.COSFunction { color:#85a6ff; }
	.COSString { color:#d4b57c; }
	.COSWarning { border-style:solid; border-color:red; border-width:1px 5px 1px 5px;}

	.SQLComment { color:#80bd66;}
	.SQLCommand { color:#ffffff;}
	.SQLWarning { border:1px solid red;}

	.JSCommand { color:#C0C0C0;}
	.JSComment { color:#80bd66;}
	.JSVariable { color:#ade2ff;}
	.JSString { color:#d4b57c; }
	.JSWarning { border:1px solid red;}
	.JSRegex { color:yellow; }





	*/
	</style>
	>
}

}
