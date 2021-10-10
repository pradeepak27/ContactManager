<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New/Edit Contact</title>
<script type="text/javascript">
	function validate() {
		var name = document.forms["myForm"]["Name"];
		var email = document.forms["myForm"]["EMail"];
		var phone = document.forms["myForm"]["Phone"];
		var address = document.forms["myForm"]["Address"];
		var atposition=email.indexOf("@");  
		var dotposition=email.lastIndexOf(".");  

		if (name.value == "") {
			window.alert("Please enter your name.");
			name.focus();
			return false;
		}

		if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.value.length){  
			  alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
			  email.focus();
			  return false;  
			  }  
		
		if (address.value == "") {
			window.alert("Please enter your address.");
			address.focus();
			return false;
		}

		if (phone.value.length>=10) {
			window.alert("Please enter your phone number.");
			phone.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body style="background-color: lightblue">
	<div align="center">
		<h1>New/Edit Contact</h1>
		<form:form name="myForm" action="save" method="post"
			modelAttribute="contact" onsubmit="return validate()">
			<table cellpadding="5">
				<form:hidden path="id" />

				<tr>
					<td>Name:</td>
					<td><form:input path="name" name="Name" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><form:input path="email" name="Email" /></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><form:input path="address" name="Address" /></td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><form:input path="phone" name="Phone" /></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save"> <input type="submit" value="Update"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>