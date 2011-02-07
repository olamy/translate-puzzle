<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <script type="text/javascript" src="jquery-1.4.4.js"></script>
    <script type="text/javascript" src="http://jquery-json.googlecode.com/files/jquery.json-2.2.js"></script>
    <script type="text/javascript" src="js/translate.js"></script>
    <script type="text/javascript" src="jquery.regex.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.9.custom.min.js"></script>
    <link href="css/ui-lightness/jquery-ui-1.8.9.custom.css" rel="stylesheet" type="text/css" media="screen" />
  
    <style>
      .effects-dotted { border: 2px dotted gray; }
    </style> 
  
  </head>

  <body>
    <c:if test="${param.edit == true}">
      <button onclick="displayEditMode();" id="editMode">Edit Mode</button>
      <button onclick="hideEditMode();" id="displayMode">Display Mode</button>
    </c:if>
    <div>
      <span class="systran_seg" id="Sp14_s2_o"></span>
    </div>
    <br/><br/><br/><br/>
    <div>
      <span class="systran_seg" id="Sp14_s3_o"></span>
    </div>
    <span class="systran_seg_src" id="Sp14_s2_o_src" style="display: none">Beer</span>
    <span class="systran_seg_src" id="Sp14_s3_o_src" style="display: none">Wine</span>


    <div id="tabs" style="display: none">
      <ul>
        <li><a href="#tabs-1">Edition</a></li>
        <li><a href="#tabs-2">Images</a></li>
        <li><a href="#tabs-3">Javascript</a></li>
      </ul>
      <div id="tabs-1">
        <p>
          Source :
          <input type="text" id="sourceText"/>
        </p>
        <p>
          Target :
          <input type="text" id="targetText"/>        
        </p>
        <p>
          <button onclick="translateAndNext();" id="translate">Translate</button>
        </p>
      </div>
      <div id="tabs-2">Coming soon... :-)</div>
      <div id="tabs-3">Coming soon... :-)</div>
    </div>

</body>



  <script>
    var currentSegId;
	$(document).ready(function() {
	   var editMode = false;
       $("#tabs").tabs();
       $( "#editMode, #displayMode , #translate" ).button();
       $(".systran_seg").each(function() {
    	   var currentSegId = $(this).attr('id');
    	   applyTranslation(currentSegId);	   
       });
       
       $(".systran_seg").mouseover(function() {
     	  if ($('#tabs').is(':visible')) {
     		 $(".systran_seg").each(function() {
     			$('#'+currentSegId).removeClass('effects-dotted');
     		 });
     		 currentSegId = $(this).attr('id');
     		 $('#'+currentSegId).addClass('effects-dotted');
     		 $('#targetText').val( $(this).html() );
     		 $('#sourceText').val( $('#' + currentSegId + '_src').html() );
     	  }
       });       
       
     });
    var displayEditMode = function () {
 	   $('#tabs').effect('slide');
    };
    var hideEditMode = function () {
 	   $('#tabs').hide();
    };	
    
    var translateAndNext = function() {
    	var trans = new Translation($('#sourceText').val(),'en', $('#targetText').val(), 'fr');
        $.ajax({
     	   url : '${pageContext.request.contextPath}/rest/TranslationService/reccordTranslation',
     	   type : 'POST',
     	   data : $.toJSON(trans),
     	   dataType : 'json',
     	   contentType : 'application/json',
     	   success : function(transResponse) {
     		  applyTranslation(currentSegId);
    	   }
        });    	
    };
    
    var applyTranslation = function(currentSegId) {
 	   var sourceText = $('#' + currentSegId + '_src').html(); 
       var trans = new Translation(sourceText,'en', null, 'fr');
       $.ajax({
    	   url : '${pageContext.request.contextPath}/rest/TranslationService/translate',
    	   type : 'POST',
    	   data : $.toJSON(trans),
    	   dataType : 'json',
    	   contentType : 'application/json',
    	   success : function(transResponse) {
    		   if (transResponse == null) {
    			   $('#' + currentSegId).html(sourceText);
    		   } else {
    		     $('#' + currentSegId).html(transResponse.targetText);
    		   }
   	       }
       });    	
    };

  </script>
</html>