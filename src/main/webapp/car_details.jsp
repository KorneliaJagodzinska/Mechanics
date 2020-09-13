<%--
  Created by IntelliJ IDEA.
  User: korneliajagodzinska
  Date: 13/09/2020
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Car Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="part_navigator.jsp"/>
<h1>Details of Car with id: ${requestScope.car.id}</h1>

<div class="details-container">
    <div class="details-section">
        <h2>Dane auta:</h2>
        <div class="details-param">
            <div class="details-label">Id:</div>
            <div class="detail">${requestScope.car.id}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Name:</div>
            <div class="detail">${requestScope.car.name}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Registration:</div>
            <div class="detail">${requestScope.car.registration}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Engine Type:</div>
            <div class="detail">${requestScope.car.engineType}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Mileage:</div>
            <div class="detail">${requestScope.car.mileage}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Engine Capacity:</div>
            <div class="detail">${requestScope.car.engineCapacity}</div>
        </div>
        <div class="details-param">
            <div class="details-label">Vin:</div>
            <div class="detail">${requestScope.car.vin}</div>
        </div>
        <div class="details-param">
            <div class="details-label"></div>
            <div class="detail">
                <a href="${pageContext.request.contextPath}/add/service/order/form?carId=${requestScope.car.id}">Add zlecenie...</a>
            </div>
        </div>
    </div>
    <div class="details-section">
        <h2>Zlecenia:</h2>
        <div class="zlecenie-container">
            <div class="zlecenie-table-header">
                <div class="zlecenie-table-header-cell">
                    Id
                </div>
                <div class="zlecenie-table-header-cell">
                   Content
                </div>
                <div class="zlecenie-table-header-cell">
                    Date Time Added
                </div>
                <div class="zlecenie-table-header-cell">
                   Date Time Finished
                </div>
                <div class="zlecenie-table-header-cell">
                    Actions
                </div>
            </div>
            <c:forEach items="${requestScope.car.serviceOrders}" var="serviceOrders">
                <div class="zlecenie-table-row">
                    <div class="zlecenie-table-cell">
                            ${serviceOrders.id}
                    </div>
                    <div class="zlecenie-table-cell">
                            ${serviceOrders.content}
                    </div>
                    <div class="zlecenie-table-cell">
                            ${serviceOrders.dateTimeAdded}
                    </div>
                    <div class="zlecenie-table-cell">
                            ${serviceOrders.dateFinished}
                    </div>
                    <div class="zlecenie-table-cell">
                        <a href="${pageContext.request.contextPath}/add/service/order/form?id=${serviceOrders.id}">Delete</a>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>

</body>
</html>
