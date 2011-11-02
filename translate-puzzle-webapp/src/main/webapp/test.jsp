<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <script type="text/javascript" src="js/jquery-1.6.4.min.js"></script>
  <script type="text/javascript" src="http://jquery-json.googlecode.com/files/jquery.json-2.2.js"></script>

  <script type="text/javascript" src="js/jquery.regex.js"></script>
  <script type="text/javascript" src="js/jquery-ui-1.8.9.custom.min.js"></script>
  <script type="text/javascript" src="js/jQuery.validity.js"></script>
  <script type="text/javascript" src="js/jquery.dataTables.js"></script>

  <script type="text/javascript" src="js/jquery.tmpl.js"></script>
  <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
  <script type="text/javascript" src="js/jquery.tablesorter.pager.js"></script>


  <script type="text/javascript" src="js/bootstrap-alerts.js"></script>
  <script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
  <script type="text/javascript" src="js/bootstrap-modal.js"></script>
  <!--
  <script type="text/javascript" src="js/bootstrap-popover.js"></script>
  -->
  <script type="text/javascript" src="js/bootstrap-scrollspy.js"></script>
  <script type="text/javascript" src="js/bootstrap-tabs.js"></script>
  <script type="text/javascript" src="js/bootstrap-twipsy.js"></script>

  <script type="text/javascript" src="js/knockout-1.3.0beta.debug.js"></script>
  <script type="text/javascript" src="js/knockout.mapping-latest.debug.js"></script>
  <script type="text/javascript" src="js/knockout.simpleGrid.js"></script>


  <link rel="stylesheet" href="css/jquery.validity.css"/>
  <link rel="stylesheet" href="css/bootstrap.1.3.0.css"/>
  <link rel="stylesheet" href="css/datatable.css">

  <script type="text/html" id="translationsListTemplate">
    <table class='contactsEditor'>
      <tr>
        <th>First name</th>
        <th>Last name</th>
      </tr>

      <tr>
        <td>
          <!--input data-bind="value: sourceLanguage"/-->

          <div><a href="#" data-bind="click: function() { viewModel.removeContact(contact) }">Delete</a></div>
        </td>
        <td><!--input data-bind="value: sourceText"/--></td>

      </tr>

    </table>
  </script>

</head>
<body>
<h2>translations</h2>

  <div>
  <table data-bind='simpleGrid: gridViewModel' id="translationsTable" class="zebra-striped" cellspacing="0">

  </table>
  </div>
  <button data-bind='click: function() { items.push({ name: "New item", sales: 0, price: 100 }) }'>
      Add item
  </button>

  <button data-bind='click: sortByName'>
      Sort by name
  </button>

  <button data-bind='click: function() { gridViewModel.currentPageIndex(0) }'>
      Jump to first page
  </button>




<script type="text/html" id="translationsTableTpl">
  <tr>
    <td><input data-bind="value: sourceText" /></td>
    <td><input data-bind="value: sourceLanguage" /></td>
    <td><input data-bind="value: targetLanguage" /></td>
  </tr>
</script>


<ul data-bind="template: { name: 'translationsListTpl', foreach: translations }">
  <script type="text/html" id="translationsListTpl">
    <li>
      <input data-bind="value: sourceText" />
      <a href="#" data-bind="click: remove">Delete</a>
    </li>
  </script>
</ul>

</body>
<script type="text/javascript">



  function translation(sourceLanguage, sourceText, targetLanguage,targetText,ownerViewModel) {
      this.sourceLanguage = ko.observable(sourceLanguage);
      this.sourceText = ko.observable(sourceText);
      this.targetLanguage = ko.observable(targetLanguage);
      this.targetText = ko.observable(targetText);
      this.remove = function() {
        alert("remove");
        ownerViewModel.translations.destroy(this);
      }
  }

  function translationsListViewModel() {
    this.translations = ko.observableArray([]);
    var self = this;
    $.ajax("/rest/TranslationService/getTranslations", {

        type: "GET",
        dataType: 'json',
        success: function(data) {
            var mappedTranslations = $.map(data.translation, function(item) {
                return new translation(item.sourceLanguage, item.sourceText, item.targetLanguage,item.targetText,self);
            });
            self.translations(mappedTranslations);
        }
      }
    );

    this.gridViewModel = new ko.simpleGrid.viewModel({
      data: this.translations,
      columns: [
        {
          headerText: "SourceLanguage",
          rowText: "sourceLanguage"},
        {
          headerText: "SourceText",
          rowText: "sourceText"},
        {
          headerText: "targetLanguage",
          rowText: "targetLanguage"}
      ],
      pageSize: 2

    });

    this.sortByName = function() {
      this.items.sort(function(a, b) {
          return a.name < b.name ? -1 : 1;
      });
    };


  }


  ko.applyBindings(new translationsListViewModel());
  $(function() {
      $("#translationsTable").dataTable(  );
    });
  $("tfoot input").keyup( function () {
          /* Filter on the column (the index) of this element */
          oTable.fnFilter( this.value, $("tfoot input").index(this) );
      } );

</script>



</html>

