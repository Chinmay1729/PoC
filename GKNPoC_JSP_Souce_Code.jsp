

<%@page import="java.util.*,wt.method.RemoteMethodServer,wt.query.QuerySpec,wt.part.WTPartMaster,wt.query.SearchCondition,wt.fc.QueryResult,wt.fc.PersistenceHelper,wt.pds.StatementSpec,wt.vc.VersionControlHelper
,wt.part.WTPart,wt.part.WTPartHelper,wt.fc.Persistable,com.ptc.core.meta.common.TypeIdentifierHelper,wt.util.WTException,java.util.List,javax.servlet.http.HttpServletRequest,
java.util.ArrayList,java.util.*,wt.doc.WTDocumentMaster,wt.doc.WTDocument,wt.doc.WTDocument,org.json.JSONArray,org.json.JSONObject"%>  

<%@page import="ext.gkn.cincom.Describebydocument"%>
<%@page import=" wt.fc.ObjectIdentifier, wt.query.QueryException,wt.util.WTException,wt.part.WTPart,wt.doc.WTDocument,wt.fc.ReferenceFactory"%>
<html lang="en">
<head>
	<!-- Setting the pages character encoding -->
	<meta charset="UTF-8">

	<!-- The meta viewport will scale my content to any device width -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	 <!-- Link to my stylesheet -->
	 <!--<link rel="stylesheet" href="styles.css">-->
     <script src="https://kit.fontawesome.com/ae54e41fec.js" crossorigin="anonymous"></script>
     
	<title>BOM</title>
    <link href="https://fonts.googleapis.com/css?family=Grandstander" rel="stylesheet" type="text/css"/>
  

    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/style.min.css" />-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/jstree.min.js"></script>
	<script type="text/javascript">
	
		
		// function myFunction() {
            // window.location.reload(true);
			// localStorage.clear();
			// sessionStorage.clear();
            // alert("Bye");
            // return "Write something clever here...";
        // }

        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
		
		
		

		
	 
		
		
    </script>
	 <script>
		  function fetchPrimaryContent(newurl){
			  //console.log(newurl);
			 opener.PTC.util.downloadUrl(newurl);
			 //alert("File downloaded successfully");
			
			  //console.log(DesDocURL);
			  //PTC.util.downloadUrl(newurl);
			  //console.log(para1);
			  //window.location.assign(newurl);
		  }
		   
	   </script>
	   <script>
		  function fetchPrimaryContentReference(Refurl){
			  console.log(Refurl);
			  opener.PTC.util.downloadUrl(Refurl);
			  //alert("File downloaded successfully");
			  //console.log(DesDocURL);
			  //PTC.util.downloadUrl(newurl);
			  //console.log(para1);
			  //window.location.assign(newurl);
		  }
		   
	   </script>
	   
	
    
	
	<div class="topnav" id="myTopnav" style="border: 1px solid black; width:99.6%; height: 80px">
        <div class ="searchbox">
            <form >
                <input type="text" name="name" placeholder="Enter Part Number">
                <input type= "submit" onclick = "windchill()"value="search">
				
            </form>
			
			
			

        </div>
    </div>
    </head>
	
	<!-- Style CSS-->
	
	<style type="text/css"> 


.treecontainer{

  background-color: rgb(242, 236, 228);
  font-size: 17px;
}

table{
	width:  1000px;
	margin: 30px auto;
  height: 50px;
  overflow:scroll;
	
}

table th{
	padding: 10px 0;
	background-color:rgb(65, 105, 157);
	/* background-color: #fff; */
	border:  thin solid #0f0e0e;
  color: white;
  
}

table td{
	padding: 10px;
	border:  thin solid #0e0d0d;
	width: 18%;
	text-align: center;
  
	background-color: transparent;
}

table img{
	width:  70%;
}

table td.total-price{
	font-weight: bold;
	font-size: 22px;
	color: white;
}
table a{
	text-decoration: none;
	color: darkred;
	background-color: #ffecef;
	padding: 10px 15px;
}
table a:active{
	background-color: #ccf4d6;
	color:  green;
}

table select{
	padding: 10px;
	width:  200px;
	font-size: 16px;
	border: thin solid #d4d4d4;
	background-color: transparent;
}
table select:focus{
	outline: none;
}

table img{
	width:  60%;
}

h4 {
 
  display: block;
  font-size: 1.5em;
  color: rgb(6, 53, 124);
  margin-top: 0.50em;
  margin-bottom: 0.50em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
  text-align: center;
  
}

.tablecontainer{
background-color: rgb(242, 236, 228);;

}



.tablecontainer{

  width: 200px;
  height: 400px;
  
}

.tablecontainer{
  overflow: scroll;
}


.topnav{
  background-color: rgb(65, 105, 157);
  background-image:url("data:image/jpeg;base64,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");
  background-position: left center;
  background-repeat: no-repeat;
  background-size: 434px 100px;
}

input[type="text"]
{
  position: relative;
  top:27px;
  left: 670px;
  background: #fff;
  width: 340px;
  height: 40px;
  border:none;
  outline:none;
  padding: 0 25px;
  /* border-radius: 25px 0 0 25px; */
}
input[type="submit"]
{
  position:relative;
  top:27px;
  left:670px;
  /* border-radius: 0 25px 25px 0; */
  width: 150px;
  height: 40px;
  border: none;
  cursor: pointer;
  background: #ffc107;
}
.jstree-node,
.jstree-children,
.jstree-container-ul {
    display: block;
    margin: 0;
    padding: 0;
    list-style-type: none;
    list-style-image: none
}

.jstree-node {
    white-space: nowrap
}

.jstree-anchor {
    display: inline-block;
    color: black;
    white-space: nowrap;
    padding: 0 4px 0 1px;
    margin: 0;
    vertical-align: top
}

.jstree-anchor:focus {
    outline: 0
}

.jstree-anchor,
.jstree-anchor:link,
.jstree-anchor:visited,
.jstree-anchor:hover,
.jstree-anchor:active {
    text-decoration: none;
    color: inherit
}

.jstree-icon {
    display: inline-block;
    text-decoration: none;
    margin: 0;
    padding: 0;
    vertical-align: top;
    text-align: center
}

.jstree-icon:empty {
    display: inline-block;
    text-decoration: none;
    margin: 0;
    padding: 0;
    vertical-align: top;
    text-align: center
}

.jstree-ocl {
    cursor: pointer
}

.jstree-leaf>.jstree-ocl {
    cursor: default
}

.jstree .jstree-open>.jstree-children {
    display: block
}

.jstree .jstree-closed>.jstree-children,
.jstree .jstree-leaf>.jstree-children {
    display: none
}

.jstree-anchor>.jstree-themeicon {
    margin-right: 2px
}

.jstree-no-icons .jstree-themeicon,
.jstree-anchor>.jstree-themeicon-hidden {
    display: none
}

.jstree-hidden,
.jstree-node.jstree-hidden {
    display: none
}

.jstree-rtl .jstree-anchor {
    padding: 0 1px 0 4px
}

.jstree-rtl .jstree-anchor>.jstree-themeicon {
    margin-left: 2px;
    margin-right: 0
}

.jstree-rtl .jstree-node {
    margin-left: 0
}

.jstree-rtl .jstree-container-ul>.jstree-node {
    margin-right: 0
}

.jstree-wholerow-ul {
    position: relative;
    display: inline-block;
    min-width: 100%
}

.jstree-wholerow-ul .jstree-leaf>.jstree-ocl {
    cursor: pointer
}

.jstree-wholerow-ul .jstree-anchor,
.jstree-wholerow-ul .jstree-icon {
    position: relative
}

.jstree-wholerow-ul .jstree-wholerow {
    width: 100%;
    cursor: pointer;
    position: absolute;
    left: 0;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

/* .jstree-contextmenu .jstree-anchor {
    -webkit-user-select: none;
    -webkit-touch-callout: none
} */

.vakata-context {
    display: none
}

.vakata-context,
.vakata-context ul {
    margin: 0;
    padding: 2px;
    position: absolute;
    background: #f5f5f5;
    border: 1px solid #979797;
    box-shadow: 2px 2px 2px #999999
}

.vakata-context ul {
    list-style: none;
    left: 100%;
    margin-top: -2.7em;
    margin-left: -4px
}

.vakata-context .vakata-context-right ul {
    left: auto;
    right: 100%;
    margin-left: auto;
    margin-right: -4px
}

.vakata-context li {
    list-style: none
}

.vakata-context li>a {
    display: block;
    padding: 0 2em 0 2em;
    text-decoration: none;
    width: auto;
    color: black;
    white-space: nowrap;
    line-height: 2.4em;
    text-shadow: 1px 1px 0 white;
    border-radius: 1px
}

.vakata-context li>a:hover {
    position: relative;
    background-color: #e8eff7;
    box-shadow: 0 0 2px #0a6aa1
}

.vakata-context li>a.vakata-context-parent {
    background-image: url("data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAIORI4JlrqN1oMSnmmZDQUAOw==");
    background-position: right center;
    background-repeat: no-repeat
}

.vakata-context li>a:focus {
    outline: 0
}

.vakata-context .vakata-context-hover>a {
    position: relative;
    background-color: #e8eff7;
    box-shadow: 0 0 2px #0a6aa1
}

.vakata-context .vakata-context-separator>a,
.vakata-context .vakata-context-separator>a:hover {
    background: white;
    border: 0;
    border-top: 1px solid #e2e3e3;
    height: 1px;
    min-height: 1px;
    max-height: 1px;
    padding: 0;
    margin: 0 0 0 2.4em;
    border-left: 1px solid #e0e0e0;
    text-shadow: 0 0 0 transparent;
    box-shadow: 0 0 0 transparent;
    border-radius: 0
}

.vakata-context .vakata-contextmenu-disabled a,
.vakata-context .vakata-contextmenu-disabled a:hover {
    color: silver;
    background-color: transparent;
    border: 0;
    box-shadow: 0 0 0
}

.vakata-context .vakata-contextmenu-disabled>a>i {
    filter: grayscale(100%)
}

.vakata-context li>a>i {
    text-decoration: none;
    display: inline-block;
    width: 2.4em;
    height: 2.4em;
    background: transparent;
    margin: 0 0 0 -2em;
    vertical-align: top;
    text-align: center;
    line-height: 2.4em
}

.vakata-context li>a>i:empty {
    width: 2.4em;
    line-height: 2.4em
}

.vakata-context li>a .vakata-contextmenu-sep {
    display: inline-block;
    width: 1px;
    height: 2.4em;
    background: white;
    margin: 0 .5em 0 0;
    border-left: 1px solid #e2e3e3
}

.vakata-context .vakata-contextmenu-shortcut {
    font-size: .8em;
    color: silver;
    opacity: .5;
    display: none
}

.vakata-context-rtl ul {
    left: auto;
    right: 100%;
    margin-left: auto;
    margin-right: -4px
}

.vakata-context-rtl li>a.vakata-context-parent {
    background-image: url("data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAINjI+AC7rWHIsPtmoxLAA7");
    background-position: left center;
    background-repeat: no-repeat
}

.vakata-context-rtl .vakata-context-separator>a {
    margin: 0 2.4em 0 0;
    border-left: 0;
    border-right: 1px solid #e2e3e3
}

.vakata-context-rtl .vakata-context-left ul {
    right: auto;
    left: 100%;
    margin-left: -4px;
    margin-right: auto
}

.vakata-context-rtl li>a>i {
    margin: 0 -2em 0 0
}

.vakata-context-rtl li>a .vakata-contextmenu-sep {
    margin: 0 0 0 .5em;
    border-left-color: white;
    background: #e2e3e3
}

#jstree-marker {
    position: absolute;
    top: 0;
    left: 0;
    margin: -5px 0 0 0;
    padding: 0;
    border-right: 0;
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
    border-left: 5px solid;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0
}

#jstree-dnd {
    line-height: 16px;
    margin: 0;
    padding: 4px
}

#jstree-dnd .jstree-icon,
#jstree-dnd .jstree-copy {
    display: inline-block;
    text-decoration: none;
    margin: 0 2px 0 0;
    padding: 0;
    width: 16px;
    height: 16px
}

#jstree-dnd .jstree-ok {
    background: green
}

#jstree-dnd .jstree-er {
    background: red
}

#jstree-dnd .jstree-copy {
    margin: 0 2px 0 2px
}

.jstree-default .jstree-node,
.jstree-default .jstree-icon {
    background-repeat: no-repeat;
    background-color: transparent
}

.jstree-default .jstree-anchor,
.jstree-default .jstree-animated,
.jstree-default .jstree-wholerow {
    transition: background-color .15s, box-shadow .15s
}

.jstree-default .jstree-hovered {
    background: #e7f4f9;
    border-radius: 2px;
    box-shadow: inset 0 0 1px #cccccc
}

.jstree-default .jstree-context {
    background: #e7f4f9;
    border-radius: 2px;
    box-shadow: inset 0 0 1px #cccccc
}

.jstree-default .jstree-clicked {
    background: #beebff;
    border-radius: 2px;
    box-shadow: inset 0 0 1px #999999
}

.jstree-default .jstree-no-icons .jstree-anchor>.jstree-themeicon {
    display: none
}

.jstree-default .jstree-disabled {
    background: transparent;
    color: #666666
}

.jstree-default .jstree-disabled.jstree-hovered {
    background: transparent;
    box-shadow: none
}

.jstree-default .jstree-disabled.jstree-clicked {
    background: #efefef
}

.jstree-default .jstree-disabled>.jstree-icon {
    opacity: .8;
    filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
    filter: gray;
    -webkit-filter: grayscale(100%)
}

.jstree-default .jstree-search {
    font-style: italic;
    color: #8b0000;
    font-weight: bold
}

.jstree-default .jstree-no-checkboxes .jstree-checkbox {
    display: none !important
}

.jstree-default.jstree-checkbox-no-clicked .jstree-clicked {
    background: transparent;
    box-shadow: none
}

.jstree-default.jstree-checkbox-no-clicked .jstree-clicked.jstree-hovered {
    background: #e7f4f9
}

.jstree-default.jstree-checkbox-no-clicked>.jstree-wholerow-ul .jstree-wholerow-clicked {
    background: transparent
}

.jstree-default.jstree-checkbox-no-clicked>.jstree-wholerow-ul .jstree-wholerow-clicked.jstree-wholerow-hovered {
    background: #e7f4f9
}

.jstree-default>.jstree-striped {
    min-width: 100%;
    display: inline-block;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAkCAMAAAB/qqA+AAAABlBMVEUAAAAAAAClZ7nPAAAAAnRSTlMNAMM9s3UAAAAXSURBVHjajcEBAQAAAIKg/H/aCQZ70AUBjAATb6YPDgAAAABJRU5ErkJggg==") left top repeat
}

.jstree-default>.jstree-wholerow-ul .jstree-hovered,
.jstree-default>.jstree-wholerow-ul .jstree-clicked {
    background: transparent;
    box-shadow: none;
    border-radius: 0
}

.jstree-default .jstree-wholerow {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box
}

.jstree-default .jstree-wholerow-hovered {
    background: #e7f4f9
}

.jstree-default .jstree-wholerow-clicked {
    background: #beebff;
    background: -webkit-linear-gradient(top, #beebff 0, #a8e4ff 100%);
    background: linear-gradient(to bottom, #beebff 0, #a8e4ff 100%)
}

.jstree-default .jstree-node {
    min-height: 24px;
    line-height: 24px;
    margin-left: 24px;
    min-width: 24px
}

.jstree-default .jstree-anchor {
    line-height: 24px;
    height: 24px
}

.jstree-default .jstree-icon {
    width: 24px;
    height: 24px;
    line-height: 24px
}

.jstree-default .jstree-icon:empty {
    width: 24px;
    height: 24px;
    line-height: 24px
}

.jstree-default.jstree-rtl .jstree-node {
    margin-right: 24px
}

.jstree-default .jstree-wholerow {
    height: 24px
}

.jstree-default .jstree-node,
.jstree-default .jstree-icon {
    background-image: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png")
}

.jstree-default .jstree-node {
    background-position: -292px -4px;
    background-repeat: repeat-y
}

.jstree-default .jstree-last {
    background: transparent
}

.jstree-default .jstree-open>.jstree-ocl {
    background-position: -132px -4px
}

.jstree-default .jstree-closed>.jstree-ocl {
    background-position: -100px -4px
}

.jstree-default .jstree-leaf>.jstree-ocl {
    background-position: -68px -4px
}

.jstree-default .jstree-themeicon {
    background-image: url("https://img.icons8.com/ios/23/null/settings--v1.png");
    /* background-position:-260px -4px; */
}

.jstree-default>.jstree-no-dots .jstree-node,
.jstree-default>.jstree-no-dots .jstree-leaf>.jstree-ocl {
    background: transparent
}

.jstree-default>.jstree-no-dots .jstree-open>.jstree-ocl {
    background-position: -36px -4px
}

.jstree-default>.jstree-no-dots .jstree-closed>.jstree-ocl {
    background-position: -4px -4px
}

.jstree-default .jstree-disabled {
    background: transparent
}

.jstree-default .jstree-disabled.jstree-hovered {
    background: transparent
}

.jstree-default .jstree-disabled.jstree-clicked {
    background: #efefef
}

.jstree-default .jstree-checkbox {
    background-position: -164px -4px
}

.jstree-default .jstree-checkbox:hover {
    background-position: -164px -36px
}

.jstree-default.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
.jstree-default .jstree-checked>.jstree-checkbox {
    background-position: -228px -4px
}

.jstree-default.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
.jstree-default .jstree-checked>.jstree-checkbox:hover {
    background-position: -228px -36px
}

.jstree-default .jstree-anchor>.jstree-undetermined {
    background-position: -196px -4px
}

.jstree-default .jstree-anchor>.jstree-undetermined:hover {
    background-position: -196px -36px
}

.jstree-default .jstree-checkbox-disabled {
    opacity: .8;
    filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
    filter: gray;
    -webkit-filter: grayscale(100%)
}

.jstree-default>.jstree-striped {
    background-size: auto 48px
}

.jstree-default.jstree-rtl .jstree-node {
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
    background-position: 100% 1px;
    background-repeat: repeat-y
}

.jstree-default.jstree-rtl .jstree-last {
    background: transparent
}

.jstree-default.jstree-rtl .jstree-open>.jstree-ocl {
    background-position: -132px -36px
}

.jstree-default.jstree-rtl .jstree-closed>.jstree-ocl {
    background-position: -100px -36px
}

.jstree-default.jstree-rtl .jstree-leaf>.jstree-ocl {
    background-position: -68px -36px
}

.jstree-default.jstree-rtl>.jstree-no-dots .jstree-node,
.jstree-default.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl {
    background: transparent
}

.jstree-default.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl {
    background-position: -36px -36px
}

.jstree-default.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl {
    background-position: -4px -36px
}

.jstree-default .jstree-themeicon-custom {
    background-color: transparent;
    background-image: none;
    background-position: 0 0
}

.jstree-default>.jstree-container-ul .jstree-loading>.jstree-ocl {
    background: url("throbber.gif") center center no-repeat
}

.jstree-default .jstree-file {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png") -100px -68px no-repeat
}

.jstree-default .jstree-folder {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png") -260px -4px no-repeat
}

.jstree-default>.jstree-container-ul>.jstree-node {
    margin-left: 0;
    margin-right: 0
}

#jstree-dnd.jstree-default {
    line-height: 24px;
    padding: 0 4px
}

#jstree-dnd.jstree-default .jstree-ok,
#jstree-dnd.jstree-default .jstree-er {
    background-image: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png");
    background-repeat: no-repeat;
    background-color: transparent
}

#jstree-dnd.jstree-default i {
    background: transparent;
    width: 24px;
    height: 24px;
    line-height: 24px
}

#jstree-dnd.jstree-default .jstree-ok {
    background-position: -4px -68px
}

#jstree-dnd.jstree-default .jstree-er {
    background-position: -36px -68px
}

.jstree-default .jstree-ellipsis {
    overflow: hidden
}

.jstree-default .jstree-ellipsis .jstree-anchor {
    width: calc(100% - 29px);
    text-overflow: ellipsis;
    overflow: hidden
}

.jstree-default.jstree-rtl .jstree-node {
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==")
}

.jstree-default.jstree-rtl .jstree-last {
    background: transparent
}

.jstree-default-small .jstree-node {
    min-height: 18px;
    line-height: 18px;
    margin-left: 18px;
    min-width: 18px
}

.jstree-default-small .jstree-anchor {
    line-height: 18px;
    height: 18px
}

.jstree-default-small .jstree-icon {
    width: 18px;
    height: 18px;
    line-height: 18px
}

.jstree-default-small .jstree-icon:empty {
    width: 18px;
    height: 18px;
    line-height: 18px
}

.jstree-default-small.jstree-rtl .jstree-node {
    margin-right: 18px
}

.jstree-default-small .jstree-wholerow {
    height: 18px
}

.jstree-default-small .jstree-node,
.jstree-default-small .jstree-icon {
    background-image: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png")
}

.jstree-default-small .jstree-node {
    background-position: -295px -7px;
    background-repeat: repeat-y
}

.jstree-default-small .jstree-last {
    background: transparent
}

.jstree-default-small .jstree-open>.jstree-ocl {
    background-position: -135px -7px
}

.jstree-default-small .jstree-closed>.jstree-ocl {
    background-position: -103px -7px
}

.jstree-default-small .jstree-leaf>.jstree-ocl {
    background-position: -71px -7px
}

.jstree-default-small .jstree-themeicon {
    background-position: -263px -7px
}

.jstree-default-small>.jstree-no-dots .jstree-node,
.jstree-default-small>.jstree-no-dots .jstree-leaf>.jstree-ocl {
    background: transparent
}

.jstree-default-small>.jstree-no-dots .jstree-open>.jstree-ocl {
    background-position: -39px -7px
}

.jstree-default-small>.jstree-no-dots .jstree-closed>.jstree-ocl {
    background-position: -7px -7px
}

.jstree-default-small .jstree-disabled {
    background: transparent
}

.jstree-default-small .jstree-disabled.jstree-hovered {
    background: transparent
}

.jstree-default-small .jstree-disabled.jstree-clicked {
    background: #efefef
}

.jstree-default-small .jstree-checkbox {
    background-position: -167px -7px
}

.jstree-default-small .jstree-checkbox:hover {
    background-position: -167px -39px
}

.jstree-default-small.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
.jstree-default-small .jstree-checked>.jstree-checkbox {
    background-position: -231px -7px
}

.jstree-default-small.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
.jstree-default-small .jstree-checked>.jstree-checkbox:hover {
    background-position: -231px -39px
}

.jstree-default-small .jstree-anchor>.jstree-undetermined {
    background-position: -199px -7px
}

.jstree-default-small .jstree-anchor>.jstree-undetermined:hover {
    background-position: -199px -39px
}

.jstree-default-small .jstree-checkbox-disabled {
    opacity: .8;
    filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
    filter: gray;
    -webkit-filter: grayscale(100%)
}

.jstree-default-small>.jstree-striped {
    background-size: auto 36px
}

.jstree-default-small.jstree-rtl .jstree-node {
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
    background-position: 100% 1px;
    background-repeat: repeat-y
}

.jstree-default-small.jstree-rtl .jstree-last {
    background: transparent
}

.jstree-default-small.jstree-rtl .jstree-open>.jstree-ocl {
    background-position: -135px -39px
}

.jstree-default-small.jstree-rtl .jstree-closed>.jstree-ocl {
    background-position: -103px -39px
}

.jstree-default-small.jstree-rtl .jstree-leaf>.jstree-ocl {
    background-position: -71px -39px
}

.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-node,
.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl {
    background: transparent
}

.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl {
    background-position: -39px -39px
}

.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl {
    background-position: -7px -39px
}

.jstree-default-small .jstree-themeicon-custom {
    background-color: transparent;
    background-image: none;
    background-position: 0 0
}

.jstree-default-small>.jstree-container-ul .jstree-loading>.jstree-ocl {
    background: url("throbber.gif") center center no-repeat
}

.jstree-default-small .jstree-file {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png") -103px -71px no-repeat
}

.jstree-default-small .jstree-folder {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png") -263px -7px no-repeat
}

.jstree-default-small>.jstree-container-ul>.jstree-node {
    margin-left: 0;
    margin-right: 0
}

#jstree-dnd.jstree-default-small {
    line-height: 18px;
    padding: 0 4px
}

#jstree-dnd.jstree-default-small .jstree-ok,
#jstree-dnd.jstree-default-small .jstree-er {
    background-image: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png");
    background-repeat: no-repeat;
    background-color: transparent
}

#jstree-dnd.jstree-default-small i {
    background: transparent;
    width: 18px;
    height: 18px;
    line-height: 18px
}

#jstree-dnd.jstree-default-small .jstree-ok {
    background-position: -7px -71px
}

#jstree-dnd.jstree-default-small .jstree-er {
    background-position: -39px -71px
}

.jstree-default-small .jstree-ellipsis {
    overflow: hidden
}

.jstree-default-small .jstree-ellipsis .jstree-anchor {
    width: calc(100% - 23px);
    text-overflow: ellipsis;
    overflow: hidden
}

.jstree-default-small.jstree-rtl .jstree-node {
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAACAQMAAABv1h6PAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMHBgAAiABBI4gz9AAAAABJRU5ErkJggg==")
}

.jstree-default-small.jstree-rtl .jstree-last {
    background: transparent
}

.jstree-default-large .jstree-node {
    min-height: 32px;
    line-height: 32px;
    margin-left: 32px;
    min-width: 32px
}

.jstree-default-large .jstree-anchor {
    line-height: 32px;
    height: 32px
}

.jstree-default-large .jstree-icon {
    width: 32px;
    height: 32px;
    line-height: 32px
}

.jstree-default-large .jstree-icon:empty {
    width: 32px;
    height: 32px;
    line-height: 32px
}

.jstree-default-large.jstree-rtl .jstree-node {
    margin-right: 32px
}

.jstree-default-large .jstree-wholerow {
    height: 32px
}

.jstree-default-large .jstree-node,
.jstree-default-large .jstree-icon {
    background-image: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png")
}

.jstree-default-large .jstree-node {
    background-position: -288px 0;
    background-repeat: repeat-y
}

.jstree-default-large .jstree-last {
    background: transparent
}

.jstree-default-large .jstree-open>.jstree-ocl {
    background-position: -128px 0
}

.jstree-default-large .jstree-closed>.jstree-ocl {
    background-position: -96px 0
}

.jstree-default-large .jstree-leaf>.jstree-ocl {
    background-position: -64px 0
}

.jstree-default-large .jstree-themeicon {
    background-position: -256px 0
}

.jstree-default-large>.jstree-no-dots .jstree-node,
.jstree-default-large>.jstree-no-dots .jstree-leaf>.jstree-ocl {
    background: transparent
}

.jstree-default-large>.jstree-no-dots .jstree-open>.jstree-ocl {
    background-position: -32px 0
}

.jstree-default-large>.jstree-no-dots .jstree-closed>.jstree-ocl {
    background-position: 0 0
}

.jstree-default-large .jstree-disabled {
    background: transparent
}

.jstree-default-large .jstree-disabled.jstree-hovered {
    background: transparent
}

.jstree-default-large .jstree-disabled.jstree-clicked {
    background: #efefef
}

.jstree-default-large .jstree-checkbox {
    background-position: -160px 0
}

.jstree-default-large .jstree-checkbox:hover {
    background-position: -160px -32px
}

.jstree-default-large.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
.jstree-default-large .jstree-checked>.jstree-checkbox {
    background-position: -224px 0
}

.jstree-default-large.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
.jstree-default-large .jstree-checked>.jstree-checkbox:hover {
    background-position: -224px -32px
}

.jstree-default-large .jstree-anchor>.jstree-undetermined {
    background-position: -192px 0
}

.jstree-default-large .jstree-anchor>.jstree-undetermined:hover {
    background-position: -192px -32px
}

.jstree-default-large .jstree-checkbox-disabled {
    opacity: .8;
    filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
    filter: gray;
    -webkit-filter: grayscale(100%)
}

.jstree-default-large>.jstree-striped {
    background-size: auto 64px
}

.jstree-default-large.jstree-rtl .jstree-node {
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
    background-position: 100% 1px;
    background-repeat: repeat-y
}

.jstree-default-large.jstree-rtl .jstree-last {
    background: transparent
}

.jstree-default-large.jstree-rtl .jstree-open>.jstree-ocl {
    background-position: -128px -32px
}

.jstree-default-large.jstree-rtl .jstree-closed>.jstree-ocl {
    background-position: -96px -32px
}

.jstree-default-large.jstree-rtl .jstree-leaf>.jstree-ocl {
    background-position: -64px -32px
}

.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-node,
.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl {
    background: transparent
}

.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl {
    background-position: -32px -32px
}

.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl {
    background-position: 0 -32px
}

.jstree-default-large .jstree-themeicon-custom {
    background-color: transparent;
    background-image: none;
    background-position: 0 0
}

.jstree-default-large>.jstree-container-ul .jstree-loading>.jstree-ocl {
    background: url("throbber.gif") center center no-repeat
}

.jstree-default-large .jstree-file {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png") -96px -64px no-repeat
}

.jstree-default-large .jstree-folder {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png") -256px 0 no-repeat
}

.jstree-default-large>.jstree-container-ul>.jstree-node {
    margin-left: 0;
    margin-right: 0
}

#jstree-dnd.jstree-default-large {
    line-height: 32px;
    padding: 0 4px
}

#jstree-dnd.jstree-default-large .jstree-ok,
#jstree-dnd.jstree-default-large .jstree-er {
    background-image: url("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/32px.png");
    background-repeat: no-repeat;
    background-color: transparent
}

#jstree-dnd.jstree-default-large i {
    background: transparent;
    width: 32px;
    height: 32px;
    line-height: 32px
}

#jstree-dnd.jstree-default-large .jstree-ok {
    background-position: 0 -64px
}

#jstree-dnd.jstree-default-large .jstree-er {
    background-position: -32px -64px
}

.jstree-default-large .jstree-ellipsis {
    overflow: hidden
}

.jstree-default-large .jstree-ellipsis .jstree-anchor {
    width: calc(100% - 37px);
    text-overflow: ellipsis;
    overflow: hidden
}

.jstree-default-large.jstree-rtl .jstree-node {
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAACAQMAAAAD0EyKAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjgIIGBgABCgCBvVLXcAAAAABJRU5ErkJggg==")
}

.jstree-default-large.jstree-rtl .jstree-last {
    background: transparent
}

@media (max-width:768px) {
    #jstree-dnd.jstree-dnd-responsive {
        line-height: 40px;
        font-weight: bold;
        font-size: 1.1em;
        text-shadow: 1px 1px white
    }

    #jstree-dnd.jstree-dnd-responsive>i {
        background: transparent;
        width: 40px;
        height: 40px
    }

    #jstree-dnd.jstree-dnd-responsive>.jstree-ok {
        background-image: url("40px.png");
        background-position: 0 -200px;
        background-size: 120px 240px
    }

    #jstree-dnd.jstree-dnd-responsive>.jstree-er {
        background-image: url("40px.png");
        background-position: -40px -200px;
        background-size: 120px 240px
    }

    #jstree-marker.jstree-dnd-responsive {
        border-left-width: 10px;
        border-top-width: 10px;
        border-bottom-width: 10px;
        margin-top: -10px
    }
}

@media (max-width:768px) {
    .jstree-default-responsive .jstree-icon {
        background-image: url("40px.png")
    }

    .jstree-default-responsive .jstree-node,
    .jstree-default-responsive .jstree-leaf>.jstree-ocl {
        background: transparent
    }

    .jstree-default-responsive .jstree-node {
        min-height: 40px;
        line-height: 40px;
        margin-left: 40px;
        min-width: 40px;
        white-space: nowrap
    }

    .jstree-default-responsive .jstree-anchor {
        line-height: 40px;
        height: 40px
    }

    .jstree-default-responsive .jstree-icon,
    .jstree-default-responsive .jstree-icon:empty {
        width: 40px;
        height: 40px;
        line-height: 40px
    }

    .jstree-default-responsive>.jstree-container-ul>.jstree-node {
        margin-left: 0
    }

    .jstree-default-responsive.jstree-rtl .jstree-node {
        margin-left: 0;
        margin-right: 40px;
        background: transparent
    }

    .jstree-default-responsive.jstree-rtl .jstree-container-ul>.jstree-node {
        margin-right: 0
    }

    .jstree-default-responsive .jstree-ocl,
    .jstree-default-responsive .jstree-themeicon,
    .jstree-default-responsive .jstree-checkbox {
        background-size: 120px 240px
    }

    .jstree-default-responsive .jstree-leaf>.jstree-ocl,
    .jstree-default-responsive.jstree-rtl .jstree-leaf>.jstree-ocl {
        background: transparent
    }

    .jstree-default-responsive .jstree-open>.jstree-ocl {
        background-position: 0 0 !important
    }

    .jstree-default-responsive .jstree-closed>.jstree-ocl {
        background-position: 0 -40px !important
    }

    .jstree-default-responsive.jstree-rtl .jstree-closed>.jstree-ocl {
        background-position: -40px 0 !important
    }

    .jstree-default-responsive .jstree-themeicon {
        background-position: -40px -40px
    }

    .jstree-default-responsive .jstree-checkbox,
    .jstree-default-responsive .jstree-checkbox:hover {
        background-position: -40px -80px
    }

    .jstree-default-responsive.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
    .jstree-default-responsive.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
    .jstree-default-responsive .jstree-checked>.jstree-checkbox,
    .jstree-default-responsive .jstree-checked>.jstree-checkbox:hover {
        background-position: 0 -80px
    }

    .jstree-default-responsive .jstree-anchor>.jstree-undetermined,
    .jstree-default-responsive .jstree-anchor>.jstree-undetermined:hover {
        background-position: 0 -120px
    }

    .jstree-default-responsive .jstree-anchor {
        font-weight: bold;
        font-size: 1.1em;
        text-shadow: 1px 1px white
    }

    .jstree-default-responsive>.jstree-striped {
        background: transparent
    }

    .jstree-default-responsive .jstree-wholerow {
        border-top: 1px solid rgba(255, 255, 255, 0.7);
        border-bottom: 1px solid rgba(64, 64, 64, 0.2);
        background: #ebebeb;
        height: 40px
    }

    .jstree-default-responsive .jstree-wholerow-hovered {
        background: #e7f4f9
    }

    .jstree-default-responsive .jstree-wholerow-clicked {
        background: #beebff
    }

    .jstree-default-responsive .jstree-children .jstree-last>.jstree-wholerow {
        box-shadow: inset 0 -6px 3px -5px #666666
    }

    .jstree-default-responsive .jstree-children .jstree-open>.jstree-wholerow {
        box-shadow: inset 0 6px 3px -5px #666666;
        border-top: 0
    }

    .jstree-default-responsive .jstree-children .jstree-open+.jstree-open {
        box-shadow: none
    }

    .jstree-default-responsive .jstree-node,
    .jstree-default-responsive .jstree-icon,
    .jstree-default-responsive .jstree-node>.jstree-ocl,
    .jstree-default-responsive .jstree-themeicon,
    .jstree-default-responsive .jstree-checkbox {
        background-image: url("40px.png");
        background-size: 120px 240px
    }

    .jstree-default-responsive .jstree-node {
        background-position: -80px 0;
        background-repeat: repeat-y
    }

    .jstree-default-responsive .jstree-last {
        background: transparent
    }

    .jstree-default-responsive .jstree-leaf>.jstree-ocl {
        background-position: -40px -120px
    }

    .jstree-default-responsive .jstree-last>.jstree-ocl {
        background-position: -40px -160px
    }

    .jstree-default-responsive .jstree-themeicon-custom {
        background-color: transparent;
        background-image: none;
        background-position: 0 0
    }

    .jstree-default-responsive .jstree-file {
        background: url("40px.png") 0 -160px no-repeat;
        background-size: 120px 240px
    }

    .jstree-default-responsive .jstree-folder {
        background: url("40px.png") -40px -40px no-repeat;
        background-size: 120px 240px
    }

    .jstree-default-responsive>.jstree-container-ul>.jstree-node {
        margin-left: 0;
        margin-right: 0
    }
}


</style> 

<body onload = "windchill()" >

<!-- Tree container-->

        <div class ="treecontainer" style ="border:1px solid black; width:28.5%; height:800px; float: left;">
            <div class = "tree">
            <div id="SimpleJSTree"></div>
            </div>  
        </div>

<!-- Table containers-->



<div class ="tablecontainer" style ="border:1px solid black; width:70.3%; height:800px; float: left;">
            <table>
                <thead>
                    <tr>
                    <h4> Described By Document</h4>
                        <th>Name</th>
                        <th>Number</th>
						<th>Context</th>
                        <th>Version</th>
						<th>Revision</th>
						<th>iteration</th>
                        <th>State</th>
                        <th>Last Modified</th>
						<th>Download Document</th>
                    </tr>
                </thead>
                <tbody id="data-output">
	<%!
	String docurl = null;
	%>	 
 	<% 
		String name =request.getParameter("name");
	if(name!=null){
	RemoteMethodServer rms = RemoteMethodServer.getDefault();
		rms.setUserName("wcadmin");
		rms.setPassword("ptc"); 
	//System.out.println(" Number of the Part  *****"+name); 
	QuerySpec qs=new QuerySpec(WTPartMaster.class);
			qs.appendWhere(new SearchCondition(WTPartMaster.class, WTPartMaster.NUMBER, SearchCondition.LIKE,name), new int[] { 0, 1 });
			
      QueryResult qr=null;
	qr = PersistenceHelper.manager.find((StatementSpec)qs);
		
		while (qr.hasMoreElements())
		{
			QueryResult part=null;;
			WTPartMaster partmaster = (WTPartMaster) qr.nextElement();
			//part =  wt.vc.VersionControlHelper.service.allIterationsOf(partmaster);	
				part =VersionControlHelper.service.allVersionsOf(partmaster);
		System.out.println("   Describedbydocumentmethod  for Size**:"+part.size());
			
			while (part.hasMoreElements())
		{

				WTPart paobj = (WTPart) part.nextElement();
				System.out.println("   Describedbydocumentmethod  for Document Number:  "+paobj.getNumber());
				
				Set<WTDocument> list1=Describebydocument.Describedbydocumentmethod(paobj);
				
				
				for(WTDocument rdoc : list1)
				{
					
					
					
							String doc = rdoc.getNumber();
				            long oid1= rdoc.getPersistInfo().getObjectIdentifier().getId();
				            System.out.println("Object Id: "+oid1);
				            System.out.println("Part found");
						
							ObjectIdentifier oid=ObjectIdentifier.newObjectIdentifier("wt.doc.WTDocument:" +oid1);
							System.out.println("Inside OID");
							WTDocument doc3= (WTDocument)PersistenceHelper.manager.refresh(oid);
							System.out.println("Part with OID: " + doc3);
							
							String Object_ref = (new wt.fc.ReferenceFactory()).getReferenceString(doc3);
                            System.out.println("object referense like: " + Object_ref);
                           docurl = "http://inhnjvdi-25.tatatechnologies.com:125/Windchill/servlet/AttachmentsDownloadDirectionServlet?oid=" + Object_ref + "&amp;role=PRIMARY";
                           String   docurl2 = docurl;
							System.out.println(docurl2);
							
							String newname =  rdoc.getName();
							System.out.println("Des DOC name is :" + newname);
							
							String newnumber1 = rdoc.getNumber();
							System.out.println("Des DOC Number is :" + newnumber1);

					
					
					
//System.out.println("***************Describebydocument  Objet ***  "+rdoc.getNumber()+"***Document Name**"+rdoc.getName());
 int index=1;
		
	//	System.out.println("***************Size of the List ***"+list1.size());
%>
	<tr>
      <td><%=rdoc.getName()%></td>
      <td><%=rdoc.getNumber()%></td>
	  <td><%=rdoc.getContainerName()%></td>
      <td><%=rdoc.getIterationDisplayIdentifier().toString()%></td>
	  <td><%=rdoc.getVersionIdentifier().getValue()%></td>
	  <td><%=rdoc.getIterationIdentifier().getValue()%></td>
      <td><%=rdoc.getLifeCycleState().toString()%></td>
	  <td><%=rdoc.getModifyTimestamp().toString()%></td>
	  <td><button onclick="fetchPrimaryContent('<%=docurl%>')">Download</button></td>
	  <!--<td><a href="https://community.ptc.com/sejnu66972/attachments/sejnu66972/installation_licensing/12209/1/WCConfigAssistant.pdf" download>Download</a></td>-->

    </tr>
		
		

	<%			}
				list1.clear();
		//	System.out.println("***************REmove the List ***"+list1.size());

		}
	}
	}

%>
 


			
		</tbody>
	</table>
	
	<table>
                <thead>
                    <tr>
                    <h4> Reference Document</h4>
                        <th>Name</th>
                        <th>Number</th>
						<th>Context</th>
                        <th>Version</th>
						<th>Revision</th>
						<th>iteration</th>
                        <th>State</th>
                        <th>Last Modified</th>
                        <th>Download Document</th>
                    </tr>
                </thead>
                <tbody id="data-outputs">
		
	<%!
	String refurl = null;
	%>	
 	<% 
		String names =request.getParameter("name");
	if(names!=null){
	RemoteMethodServer rms = RemoteMethodServer.getDefault();
		rms.setUserName("wcadmin");
		rms.setPassword("ptc"); 
	//System.out.println(" Number of the Part  *****"+names); 
	QuerySpec qsd=new QuerySpec(WTPartMaster.class);
			qsd.appendWhere(new SearchCondition(WTPartMaster.class, WTPartMaster.NUMBER, SearchCondition.LIKE,names), new int[] { 0, 1 });
      QueryResult qrd=null;
	qrd = PersistenceHelper.manager.find((StatementSpec)qsd);
		while (qrd.hasMoreElements())
		{
			QueryResult partd=null;;
			WTPartMaster partmaster = (WTPartMaster) qrd.nextElement();
			//partd =  wt.vc.VersionControlHelper.service.allIterationsOf(partmaster);	
			
				partd =VersionControlHelper.service.allVersionsOf(partmaster);
			while (partd.hasMoreElements())
		{

				WTPart paobjd = (WTPart) partd.nextElement();
				//System.out.println("Reference Content of the  :  "+paobjd.getNumber());
				
		List<WTDocument> listd=Describebydocument.ReferenceDocumentDataobject(paobjd);
System.out.println("***************Size of Refernce Docuemt   ***"+listd.size());
ArrayList<WTDocument> newarray=new ArrayList();

for(int H=0;H<listd.size();H++){
	
	System.out.println("***Entering into Loop Data**"+listd.size());
	
for(int k=0;k<newarray.size();k++){
	
	System.out.println("***Entering into   K Loop Data**"+listd.size());
	if((newarray.get(k).getNumber())==(listd.get(H).getNumber())){
		System.out.println("***************Get Number***"+listd.get(H).getNumber());
	}else{
		System.out.println("***************Get Number   Else Condition***"+listd.get(H).getNumber());
		newarray.add(listd.get(H));
		
	}
}
	
	
	
}



			for(WTDocument rdocd : listd)
				{
					
					
							String doc2 = rdocd.getNumber();
				            long oid2= rdocd.getPersistInfo().getObjectIdentifier().getId();
				            System.out.println("Object Id2: "+oid2);
				            System.out.println("Part found");
						
							ObjectIdentifier oid3=ObjectIdentifier.newObjectIdentifier("wt.doc.WTDocument:" +oid2);
							System.out.println("Inside OID");
							WTDocument doc4= (WTDocument)PersistenceHelper.manager.refresh(oid3);
							System.out.println("Part with OID: " + doc4);
							
							String Object_ref2 = (new wt.fc.ReferenceFactory()).getReferenceString(doc4);
                            System.out.println("object referense like: " + Object_ref2);
                            refurl = "http://inhnjvdi-25.tatatechnologies.com:125/Windchill/servlet/AttachmentsDownloadDirectionServlet?oid=" + Object_ref2 + "&u8=1";
                            System.out.println(refurl);
							//System.out.println("***************Reference  Objet ***  "+rdocd.getNumber()+"***Document Name**"+rdocd.getName());
							//int index=1;
		

		
		
						//	System.out.println("***************Size of the List ***"+listd.size());
		
		
		%>
  
 <tr>
   
      <td><%=rdocd.getName()%></td>
      <td><%=rdocd.getNumber()%></td>
	   <td><%=rdocd.getContainerName()%></td>
     <td><%=rdocd.getIterationDisplayIdentifier().toString()%></td>
	<td><%=rdocd.getVersionIdentifier().getValue()%></td>
	<td><%=rdocd.getIterationIdentifier().getValue()%></td>
     <td><%=rdocd.getLifeCycleState().toString()%></td>
	  <td><%=rdocd.getModifyTimestamp().toString()%></td>
	  <td><button onclick="fetchPrimaryContentReference('<%=refurl%>')">Download</button></td>
	   
	<!--<td><a href="https://community.ptc.com/sejnu66972/attachments/sejnu66972/installation_licensing/12209/1/WCConfigAssistant.pdf" download>Download</a></td>-->
	  

    
</tr>
	
	<%

				}
				
				listd.clear();
			newarray.clear();
				
		}
	}
	} 

%>

			
		</tbody>

       </table>
	   // <script>
		// const downloadButton = document.querySelector('#download-button');

		// downloadButton.addEventListener('click', event => {
		  // // Get the file URL
		  // const fileUrl = 'http://inhnjvdi-25.tatatechnologies.com:125/Windchill/app/#ptc1/tcomp/infoPage?oid=VR%3Awt.doc.WTDocument%3A86827&u8=1';

		  // // Create a temporary anchor element to trigger the download
		  // const anchor = document.createElement('a');
		  // anchor.style.display = 'none';
		  // anchor.href = fileUrl;
		  // anchor.download = fileUrl.substring(fileUrl.lastIndexOf('/') + 1);
		  // document.body.appendChild(anchor);
		  // anchor.click();

		  // // Remove the anchor element after the download
		  // document.body.removeChild(anchor);
		// });
		
		
	   
	   
	   
	   // </script>
	
	</div>
	<%! JSONObject jsonobjss=null;
String  routeStationString;
StringBuilder sb=null;
String arr[]=null;
String str=null;
	%>

<%
        String namest =request.getParameter("name");
    if(namest!=null){
    RemoteMethodServer rmst = RemoteMethodServer.getDefault();
        rmst.setUserName("wcadmin");
        rmst.setPassword("ptc"); 
    //System.out.println(" Number of the Part  *****"+namest); 

    List  listt=Describebydocument.insertIntoPartMain(namest);
JSONObject	jsonobjssrr = new JSONObject();


if((listt != null && !listt.isEmpty ()) ){

	
	System.out.println(" Data Not Equal to null ");

	 //System.out.println(" List Data Key Value Pair***"+listt.toString());
	
	JSONArray jo=new JSONArray();
    jsonobjss = new JSONObject();

 sb=new StringBuilder();

for( int i =0 ; i<listt.size(); i++){

Map<String,ArrayList>	gats=(Map<String,ArrayList>)listt.get(i);
    //System.out.println( "****Data Array List Iterate *****"+listt.get(i) );
	String k =null;
	 ArrayList v=null;
		for (Map.Entry<String, ArrayList> entry : gats.entrySet()) {
     k = entry.getKey();
     v = (ArrayList)entry.getValue();


	routeStationString=jsonobjssrr.put(k,v).toString();
	sb.append(jsonobjssrr.put(k,v).toString());
	

	}
	jsonobjss.put(k,v);
}
	
	
	
}else{
	

	
	System.out.println("**List Object Not Contaims Data***"+listt);
	
jsonobjss = new JSONObject();
ArrayList emp=new ArrayList();

jsonobjss.put(namest,emp);

System.out.println("**List Object Not JSON***"+jsonobjss);

System.out.println("**List Object Not JSON***"+jsonobjss);





}

   



System.out.println("**JSONObject Data******"+jsonobjss);
        

		
    
	}



%>




	<script type="text/javascript">
	
	function windchill(){
			
	
		var jsobj = <%=jsonobjss%>;
		
		
		
		console.log(jsobj);
		const parts = jsobj;
	//	{ "0000000309": ["0000000324", "0000000315"], "0000000315": ["0000000325", "0000000323 "] };
			
		

			const parts1 = new Map(Object.entries(parts));

			var mp = new Map()
			console.log('123')

			console.log(parts1.keys())
			
			
			
	
			
			for (let [key, value] of parts1) {
				// key = "0000000309"
				// value = ["0000000324","0000000315"]

				if (mp.get(key) == undefined) {
					// mp.set(key, new Map(Object.entries({
					//     id: key,
					//     parent: "#",
					//     text: key,
					// })))

					mp.set(key, {
						id: key,
						parent: "#",
						text: key,
					})
				}

				for (j of value) {
					// j = "0000000324"
					// mp.set(j, new Map(Object.entries({
					//     id: j,
					//     parent: key,
					//     text: j,
					// })))

					mp.set(j, {
						id: j,
						parent: key,
						text: j,
					})
				}
			}

			var arr = Array();

			for (let [key, value] of mp) {
				arr.push(value);
			}

			console.log("mppp")

			console.log(mp);

			console.log(arr)



			$(function () {

				var jsondata = arr;

				// [
				//     { "id": "0000000309", "parent": "#", "text": "0000000309" },

				//     { "id": "0000000315", "parent": "0000000309", "text": "0000000315" },

				//     { "id": "0000000324", "parent": "0000000309", "text": "0000000324" },

				//     { "id": "0000000323", "parent": "0000000315", "text": "0000000323" },

				//     { "id": "0000000325", "parent": "0000000315", "text": "0000000325" },
				// ];

				createJSTree(jsondata);
			});

			function createJSTree(jsondata) {
				$('#SimpleJSTree').jstree({
					'core': {
						'data': jsondata
					}
					
				});
				
				
				
				window.onunload = function() {
                location.reload();
                 };
				
			}
	
	
		
	}
		

		
	
    </script>
	
	
	</body>
</html>
