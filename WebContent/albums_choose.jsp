<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<jsp:include page="style.css"/>
		<title>Purchase Album</title>
		<link href="style.css" rel="stylesheet" type="text/css">
	</head>	
	
	 <form action="album_process.jsp" method="post">
	    <div class="checkbox_style">
	    	<img src="album1.jpg" width="100" height="100" id="album1">
	  		<input type="checkbox" class="check" name="voucher" id="check_1" value="Queen"><label for="check_1">Queen</label>
	    </div>
	    <div class="checkbox_style">
	    	<img src="album2.jpg" width="100" height="100" id="album2">
	  		<input type="checkbox" class="check" name="voucher" id="check_2" value="Weeknd"><label for="check_2">Weeknd</label>
	    </div>
	     <div class="checkbox_style">
	    	<img src="album3.jpg" width="100" height="100" id="album3">
	 		 <input type="checkbox" class="check" name="voucher" id="check_3" value="Nirvana"><label for="check_3">Nirvana</label>
	    </div>
	    <div class="checkbox_style">
	    	<img src="album4.jpg" width="100" height="100" id="album4">
			  <input type="checkbox" class="check" name="voucher" id="check_4" value="LadyGaga"><label for="check_4">LadyGaga</label>
	    </div>
	    <div class="checkbox_style">
	   		<input type="submit" id="submit" name="submit" />
	    </div>
	</form>
	
	<script>
	$(function(){
	    $('input:checkbox').each(function() {
	        // ITERATE OVER THE CHECKBOXES AND SET THEIR "CHECK" VALUES BASED ON THE SESSION DATA
	        var $el = $(this);
	        $el.prop('checked', sessionStorage[$el.prop('id')] === 'true');
	    });

	    $('input:checkbox').on('change', function() {
	        // SAVE THE INDIVIDUAL CHECKBOX IN THE SESSION INSIDE THE `CHANGE` EVENT, 
	        // USING THE CHECKBOX "ID" ATTRIBUTE
	        var $el = $(this);
	        sessionStorage[$el.prop('id')] = $el.is(':checked');
	    });
	});
	// 	DISABLES THE SUBMIT BUTTON, UNTILL A CHECKBOX IS CHECKED
	$('.check').change(function () {
	    $('#submit').prop("disabled", !this.checked);
	}).change()
	</script>

</html>


