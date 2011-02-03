<html>
  <head>
    <script type="text/javascript" src="jquery-1.4.4.js"></script>
    <script type="text/javascript" src="http://jquery-json.googlecode.com/files/jquery.json-1.3.min.js"></script>
    <script type="text/javascript" src="js/translate.js"></script>
    <link href="css/ui-lightness/jquery-ui-1.8.9.custom.css" 
          rel="stylesheet" type="text/css" media="screen"/>
  </head>

  <body>
    <span class="systran_seg" id="Sp14.s2_o">Bière</span>
  </body>
  
  <span class="systran_seg" id="Sp14.s2_o" style="display: none">Beer</span>
 
  <script>
    alert('foo');
    var trans = new Translation('beer','en');
    $.getJSON('/rest/translate', trans, function(data) {
    	  alert(data);
    	});
  </script>
</html>