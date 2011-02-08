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

    <!-- FIXME move it to an external page  -->
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
    var pageContext = "${pageContext.request.contextPath}";

  </script>
</html>