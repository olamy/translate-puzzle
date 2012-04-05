var clazz={};
clazz.create= function (option){
	var newObj=null;
	if (option && option.initialize){
		newObj= function (){this.initialize.apply(this, arguments);}
	}else{
		newObj= function (){}
	}
	$.extend(newObj.prototype, option);
	return newObj;
};



var translationOpts = {
		sourceText: null,
		sourceLanguage: null,
		targetLanguage: null,
		targetText: null,
		initialize : function(sourceText, sourceLanguage, targetText, targetLanguage) {
			this.sourceText = sourceText;
			this.sourceLanguage = sourceLanguage;
			this.targetLanguage = targetLanguage;
			this.targetText = targetText;
		}
	};
var Translation=clazz.create(translationOpts);


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
	   $('#tabs, #my-tab-content').effect('slide');
};
var hideEditMode = function () {
	   $('#tabs, #my-tab-content').hide();
};	

var translateAndNext = function() {
	var trans = new Translation($('#sourceText').val(),'en', $('#targetText').val(), 'fr');

    $.ajax({
 	   url : pageContext + '/rest/TranslationService/reccordTranslation',
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
	   url : pageContext + '/rest/TranslationService/translate',
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