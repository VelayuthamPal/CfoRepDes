<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Delinquent Action</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
    if(location.hash) {
        $('a[href=' + location.hash + ']').tab('show');
        alert(location.hash);
    }
    $(document.body).on("click", "a[data-toggle]", function(event) {
        location.hash = this.getAttribute("href");
    });
});
$(window).on('popstate', function() {
    var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");
    $('a[href=' + anchor + ']').tab('show');
});
</script>
  <script>
  function ajaxCallEmail()
  {
	  $.ajax({
			url:'RepFirst.jsp',
			success:function(responseText){
				$("#AjaxResponseEmail").html(responseText);
			}
		});
  }
  
  function ajaxCallPhone()
  {
	  $.ajax({
			url:'Call.jsp',
			success:function(responseText){
				$("#AjaxResponsePhone").html(responseText);
			}
		});
  }
  
  function ajaxCallLetter()
  {
	  $.ajax({
			url:'Letter.jsp',
			success:function(responseText){
				$("#AjaxResponseLetter").html(responseText);
			}
		});
  }
  </script>
    <script>
  </script>
</head>
<body>

<div class="container">
  <h2>Delinquent Customer List</h2>
  <ul class="nav nav-tabs" id="myTab">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">eMail List</a></li>
    <li><a data-toggle="tab" href="#menu2">Call List</a></li>
    <li><a data-toggle="tab" href="#menu3">Letter List</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>This page contains the list of defaulters</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>eMail List</h3>
      <input type="button" value="View Mail List" onclick="ajaxCallEmail()"/>
    	<div id="AjaxResponseEmail" class="AjaxResponseEmail"></div>
      
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Call List</h3>
      <input type="button" value="View Phone List" onclick="ajaxCallPhone()"/>
    <div id="AjaxResponsePhone" class="AjaxResponsePhone"></div>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Letter List</h3>
	<input type="button" value="View Letter List" onclick="ajaxCallLetter()"/>
    <div id="AjaxResponseLetter" class="AjaxResponseLetter"></div>
    </div>
  </div>
</div>

</body>
</html>
    