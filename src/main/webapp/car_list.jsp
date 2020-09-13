<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 9/12/20
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Car form</title>
    <jsp:include page="part_styles.jsp"/>
</head>
<body>
<jsp:include page="part_navigator.jsp"/>

<div class="container">
    <h2>Car List</h2>
    <div class="row header-row">
        <div class="col-1">Id</div>
        <div class="col-2">Registration</div>
        <div class="col-1">Name</div>
        <div class="col-2">Engine type</div>
        <div class="col-1">Mileage</div>
        <div class="col-2">Eng. capacity</div>
        <div class="col-2">VIN</div>
        <div class="col-1"></div>
    </div>
    <c:forEach items="${requestScope.car_list}" var="car">
        <div class="row car-row marginless">
            <div class="col-1">${car.id}</div>
            <div class="col-2">${car.registration}</div>
            <div class="col-1">${car.name}</div>
            <div class="col-2">${car.engineType}</div>
            <div class="col-1">${car.mileage}</div>
            <div class="col-2">${car.engineCapacity}</div>
            <div class="col-2">${car.vin}</div>
            <div class="col-1">
                <a href="${pageContext.request.contextPath}/car_details.jsp">Details</a>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="part_footer.jsp"/>
</body>
</html>
