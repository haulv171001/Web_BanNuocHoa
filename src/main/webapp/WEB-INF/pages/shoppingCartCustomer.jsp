<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Enter Customer Information</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">


</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<div class="custom">
	<div class="page-title1">Enter Customer Information</div>
	<div class="formm">
	<form:form method="POST" modelAttribute="customerForm"
		action="${pageContext.request.contextPath}/shoppingCartCustomer">

		<table>
			<tr class="name-cess">
				<td class="vul" style="padding-left: 50px;">NAME: </td>
				<td class="vul"><form:input class="control" path="name" /></td>
				<td class="vul"><form:errors path="name" class="error-message" /></td>
			</tr>

			<tr class="name-cess">
				<td class="vul" style="padding-left: 50px">EMAIL: </td>
				<td class="vul"><form:input class="control" path="email" /></td>
				<td class="vul"><form:errors path="email" class="error-message" /></td>
			</tr>

			<tr class="name-cess">
				<td class="vul" style="padding-left: 50px">PHONE: </td>
				<td class="vul"><form:input class="control" path="phone" /></td>
				<td class="vul"><form:errors path="phone" class="error-message" /></td>
			</tr>

			<tr class="name-cess">
				<td class="vul" style="padding-left: 50px" >ADDRESS: </td>
				<td class="vul"><form:input class="control" path="address" /></td>
				<td class="vul"><form:errors path="address" class="error-message" /></td>
			</tr>
			<br>

			<tr class="name-cess">
				<td>&nbsp;</td>
				<td><input class="submitt" type="submit" value="Submit" /> <input class="submitt1" type="reset"
					value="Reset" /></td>
			</tr>
		</table>

	</form:form>
	</div>
	
	</div>


	<jsp:include page="_footer.jsp" />


</body>
</html>