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
		initialize : function(sourceText, sourceLanguage, targetLanguage, targetText) {
			this.sourceText = sourceText;
			this.sourceLanguage = sourceLanguage;
			this.targetLanguage = targetLanguage;
			this.targetText = targetText;
		}
	};
var Translation=clazz.create(translationOpts);