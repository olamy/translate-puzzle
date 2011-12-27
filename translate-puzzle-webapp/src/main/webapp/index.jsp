<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <script type="text/javascript" src="js/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="http://jquery-json.googlecode.com/files/jquery.json-2.2.js"></script>
    <script type="text/javascript" src="js/translate.js"></script>
    <script type="text/javascript" src="js/jquery.regex.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.9.custom.min.js"></script>
    <script type="text/javascript" src="js/jQuery.validity.js"></script>
    <script type="text/javascript" src="js/knockout-1.3.0beta.debug.js"></script>
    <script type="text/javascript" src="js/bootstrap-alerts.js"></script>
    <script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
    <script type="text/javascript" src="js/bootstrap-modal.js"></script>
    <!--
    <script type="text/javascript" src="js/bootstrap-popover.js"></script>
    -->
    <script type="text/javascript" src="js/bootstrap-scrollspy.js"></script>
    <script type="text/javascript" src="js/bootstrap-tabs.js"></script>
    <script type="text/javascript" src="js/bootstrap-twipsy.js"></script>

    <link rel="stylesheet" href="css/jquery.validity.css"/>
    <link rel="stylesheet" href="css/bootstrap.1.3.0.css"/>

    <style>
      .effects-dotted { border: 2px dotted gray; }
    </style> 
  
  </head>

  <body>
    <c:if test="${param.edit == true}">
      <button onclick="displayEditMode();" id="editMode" class="btn">Edit Mode</button>
      <button onclick="hideEditMode();" id="displayMode" class="btn">Display Mode</button>
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


  <ul class="tabs" id="tabs">
    <li class="active"><a href="#edition">Edition</a></li>
    <li><a href="#images">Images</a></li>
    <li><a href="#javascript">Javascript</a></li>
  </ul>
  <div id="my-tab-content" class="tab-content">
    <div class="active" id="edition">
      <form id="trRq">
        <fieldset>
          <div class="clearfix">
            <div class="input">
              Source :
              <input type="text" id="sourceText"/>
            </div>
          </div>
          <div class="clearfix">
            <div class="input">
            Target :
            <input type="text" id="targetText"/>
            </div>
          </div>
          <button onclick="translateAndNext();" id="translate" class="btn">Translate</button>
        </fieldset>
      </form>
    </div>
    <div id="images">
      <form id="test" method="get" action="index.jsp">
        <fieldset>
          <div class="clearfix">
            <label for="name">Name</label>
            <div class="input">
              <input type="text" id="name" name="name" size="30"/>
            </div>
          </div>
          <div class="clearfix">
            <label for="age">Age</label>
            <div class="input">
              <input type="text" id="age" name="age"/>
            </div>
          </div>
          <input type="submit" class="btn"/>
        </fieldset>
      </form>
    </div>
    <div id="javascript">
      <form id="test2">
        <fieldset>
          <div class="clearfix">
            <label for="name2">Name2</label>
            <div class="input">
              <input type="text" id="name2" name="name"/>
            </div>
          </div>
          <div class="clearfix">
            <label for="age2">Age2</label>
            <div class="input">
              <input type="text" id="age2" name="age"/>
            </div>
          </div>
        </fieldset>
      </form>
    </div>
  </div>

</body>



  <script>
    var pageContext = "${pageContext.request.contextPath}";

    $(function () {
      $('.tabs').tabs()
    })

    $("#test").validity(function() {
      $("#name").require();
      $("#age").require();

    });

  (function(){

      $.validity.outputs.bootstrap = {

          // The start function will be called when validation starts.
          // This allows you to prepare the page for validation, for instance
          // you might remove any validation messages that are already on the page.
          start:function(){
            $("div.clearfix").removeClass("error");
          },

          // The end function is called when validation has concluded.
          // This allows you to flush any buffers or do anything you need to
          // after all of the validators have been called.
          // results will be the results object.
          // results.valid is a boolean representing whether the form is valid.
          // results.errors is an integer of how many errors there are.
          end:function(results) {

          },

          // The raise function is called to raise an error for a specific input.
          // The first argument is a jQuery object of the input to raise the error message for.
          // The second argument is the string of the error message.
          raise:function($obj, msg){
            //var previous = $obj.attr("class");

            $obj.parents("div.clearfix").addClass("error");
          },

          // The raiseAggregate function is similar to the raise function, except that
          // the $obj argument will be a jQuery object of several inputs,
          // all of which are invalid aggregately.
          raiseAggregate:function($obj, msg){

          }
      }
  })();
    $.validity.setup({ outputMode:'bootstrap' });
    // class ++ error
    function getIdentifier($obj) {
        return $obj.attr('id').length ?
            $obj.attr('id') :
            $obj.attr('name');
    }
  </script>
</html>