<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
	<style>
	.form-delete{
	position:relative;
	}
	.delete{
	position: absolute;
    top: -43px;
    left: -50px;}
	
	</style>
</head>
<body>

	<jsp:include page="_header.jsp" />
	<div class="custom">
	<div class="page-title1">Product</div>
	<div class="formm">

	<c:if test="${not empty errorMessage }">
		<div class="error-message">${errorMessage}</div>
	</c:if>

	<form:form modelAttribute="productForm" method="POST"
		enctype="multipart/form-data">
		<table style="text-align: left;">
			<tr class="name-cess">
				<td class="vul">Code (*) :</td>
				<td class="vul" style="color: black;"><c:if
						test="${not empty productForm.code}">
						<form:hidden path="code" />
                       ${productForm.code}
                  </c:if> <c:if test="${empty productForm.code}">
						<form:input  class="control" path="code" />
						<form:hidden  path="newProduct" />
					</c:if></td>
				<td class="vul"><form:errors path="code" class="error-message" /></td>
			</tr>

			<tr class="name-cess">
				<td class="vul">Name (*) :</td>
				<td class="vul"><form:input class="control" path="name" /></td>
				<td class="vul"><form:errors path="name" class="error-message" /></td>
			</tr>

			<tr class="name-cess">
				<td class="vul">Price (*) :</td>
				<td class="vul"><form:input class="control" path="price" /></td>
				<td class="vul"><form:errors path="price" class="error-message" /></td>
			</tr>
			<tr class="name-cess">
				<td class="vul">Image :</td>
				<td class="vul"><img
					src="${pageContext.request.contextPath}/productImage?code=${productForm.code}"
					width="100" /></td>
				<td class="vul"></td>
			</tr>
			<tr class="name-cess">
				<td class="vul">Upload Image :</td>
				<td class="vul"><form:input  type="file" path="fileData" /></td>
				<td class="vul"></td>
			</tr>


			<tr class="name-cess">
				<td>&nbsp;</td>
				<td><input class="submitt" type="submit" value="Submit" /> <input class="submitt1" type="reset"
					value="Reset" />
					
					</td>
			</tr>
		</table>
	</form:form>
	<c:url var="deleteUrl" value="/product/remove"/>
	<form class="form-delete" id="${fruitFormId}" action="${deleteUrl}" method="POST">
      <input id="product" name="productid" type="hidden" value="${productForm.code}"/>
      <input class="submitt1 delete" type="submit" value="delete" onClick="return confirm('sure?')"/>
	</form>
	

	</div>
	</div>


	<jsp:include page="_footer.jsp" />

</body>
</html>