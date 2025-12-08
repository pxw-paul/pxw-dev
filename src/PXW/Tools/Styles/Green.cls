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
		--fgAlternate: black;
		--fgProgramName: #67BD5A;;
		--fgProgramLabel: #67BD5A;
		--fgProgramKeyword: #67BD5A;
		--fgCodeKeyword: #67BD5A;
		--fgCodeVariable: #67BD5A;
		--fgCodeVariableGlobal: #67BD5A;
		--fgCodeArgument: #67BD5A;
		--fgCodeLabel : #67BD5A;
		--fgCodeString: #67BD5A; 
		--fgCodeNumber: #67BD5A; 
		--fgComment: #2e8122;
		--fgInlineOption: #67BD5A;;
	}	
    body {
        background-color: black;
        background-image: radial-gradient(rgba(0, 75, 0, 0.75), black 120% );
        height: 100vh;
        margin: 0;
        overflow: hidden;
        padding: 2rem;
        color: /*white;*/ #67BD5A; 
        font: 1rem Inconsolata, monospace;
        text-shadow: 0 0 5px #C8C8C8;

        border:0; margin:0; padding:0; height: 100%;
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
    
	html { height: 100%;}
	a { text-decoration:none;  color: inherit;}
	a:visited { text-decoration:none; color: inherit; }
	a:hover { text-decoration:none;  color: inherit; }
	a:active { text-decoration:none;  color: inherit; }
	pre { margin:0px; tab-size:4;}
	input {  background-color: var(--bgHilite); color: var(--fgInverse);border:0;}
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

	#toolsHead form { display:inline; margin: 0px; padding:0px; border:0px; }
	#toolsHead form fieldset { display:inline; border:none; }
	#toolsHead legend { display: none;}
	#toolsHead form fieldset input {  background-color: var(--bgHilite); color: var(--fgInverse);}

	#toolsTitle { border:0; margin: 0; padding: 0;}
	#toolsTitle h1 { border:0; margin: 0; padding: 0;}
		

	table thead, table tfoot { position: sticky;  background: black;}
	table thead { inset-block-start: 0;} /* top */
	table tfoot { inset-block-end: 0;} /* bottom */
	table tbody tr:nth-child(odd) {
 		/*background-color:#2E2E2E;
  		color: #fff;*/
	}
	table tbody tr:Hover { background-color:var(--bgHover); color: var(--fgInverse);}

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

	/* code containers */
	.EmbeddedJS { display:inline-block;}
	.EmbeddedSQL { display:inline-block; vertical-align: top;}
	.EmbeddedXML {  display:inline-block;}
	.EmbeddedPython { display:inline-block;}


	.LensMenu { }
	.LensOption, .LensOption:visited { color: var(--fgInlineOption);}
	.LensOption:hover { background-color: var(--bgAlternate1); }

	/* General purpose classes that could be applicable to any language */

	.codeWarning { border-style:solid; border-color:var(--borderWarning); border-width:1px 5px 1px 5px;}
	.codeError { border-style:solid; border-color:var(--borderError); border-width:1px 5px 1px 5px;}

	.codeComment { color: var(--fgComment); }
   	.codeProgramName, a.codeProgramName  { color: var(--fgProgramName);}
	.codeProgramLabel, a.codeProgramLabel, a.codeProgramLabel:visited {color: var(--fgProgramLabel);}
	.codeProgramKeyword { color: var(--fgProgramKeyword);}
    .codeKeyword { color: var(--fgCodeKeyword);}
	.codeFormalSpecList { display: inline-block; white-space: wrap; max-width: 75%;  vertical-align:top;}
    .codeFormalSpecItem {  white-space:nowrap; }
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


	.XMLTag { /*color:#85a6ff;*/ }
	.XMLAttribute { /*color:#ade2ff;*/ }
	.XMLString { /*color:#d4b57c;*/ }

	.SQLSection:hover { background-color: #585858;}
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

	.hiliteSET1 { background-color: #40cc40; color:var(--fgAlternate); } 
	.hiliteSET2 { background-color: #40bb40; color:var(--fgAlternate); }
	.hiliteSET3 { background-color: #40aa40; color:var(--fgAlternate); }
	.hiliteSET4 { background-color: #409940; color:var(--fgAlternate); }
	.hiliteSET5 { background-color: #408840; color:var(--fgAlternate); }
	.hiliteSET6 { background-color: #407740; color:var(--fgAlternate); }
	.hiliteSET7 { background-color: #406640; color:var(--fgAlternate); }
	.hiliteSET8 { background-color: #405540; color:var(--fgAlternate); }
	.hiliteSET9 { background-color: none; }
	.hiliteGET1 { background-color: #00cc00; color:var(--fgAlternate); } 
	.hiliteGET2 { background-color: #00bb00; color:var(--fgAlternate); } 
	.hiliteGET3 { background-color: #00aa00; color:var(--fgAlternate); }
	.hiliteGET4 { background-color: #009900; color:var(--fgAlternate); }
	.hiliteGET5 { background-color: #008800; color:var(--fgAlternate); }
	.hiliteGET6 { background-color: #007700; color:var(--fgAlternate); }
	.hiliteGET7 { background-color: #006600; color:var(--fgAlternate); }
	.hiliteGET8 { background-color: #005500; color:var(--fgAlternate); }
	.hiliteGET9 { background-color: none; }
	
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
