<%--
  Created by IntelliJ IDEA.
  User: korneliajagodzinska
  Date: 13/09/2020
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Add Service Order</title>
</head>
<body>
<jsp:include page="part_navigator.jsp"/>

<form action="${pageContext.request.contextPath}/add_service_order/form" method="post">

    <c:choose>
    <c:when test="${requestScope.carId ==null}">
    <label for="car">Car:</label>
    <select id="car" name="carIdValue">
        <c:forEach items="${requestScope.all_cars}" var="car">
            <option value="${car.id}">
                <c:out value="${car.name} ${car.registration}"/>
            </option>
        </c:forEach>
    </select>
    <br/>
    </c:when>
    <c:otherwise>
    <input type="number" value="${requestScope.carId}" name="carIdValue" hidden>
    </c:otherwise>
    </c:choose>

    <h2>Service Order form</h2>

        <label for="servisOrderContentInput">Content:</label>
        <input id="servisOrderContentInput" name="serviceOrderContent"><br/>
        <label for="servisOrderDateTimeAddedInput">Date Time Added:</label>
        <input id="servisOrderDateTimeAddedInput" name="serviceOrderDateTimeAdded"><br/>
        <label for="servisOrderDateTimeFinishedInput">Date Time Finished:</label>
        <input id="servisOrderDateTimeFinishedInput" name="servisOrderDateTimeFinished"><br/>


        <br/>
        <input type="submit">
    </form>
</body>
</html>
