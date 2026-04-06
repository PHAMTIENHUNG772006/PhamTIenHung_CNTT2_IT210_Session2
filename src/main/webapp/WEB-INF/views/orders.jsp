<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>
<head>
    <title>Danh sách đơn hàng</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .info { background: #e7f3fe; padding: 15px; border-radius: 5px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #04AA6D; color: white; }
    </style>
</head>
<body>

<div class="info">
    <h2>Xin chào, ${sessionScope.loggedUser}!</h2>
    <p>Vai trò của bạn: <strong>${sessionScope.role}</strong></p>
    <a href="<c:url value='/logout'/>">Đăng xuất</a>
</div>

<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã đơn</th>
        <th>Tên sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Ngày đặt</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="o" items="${orderList}" varStatus="stt">
        <tr>
            <td>${stt.count}</td>
            <td>${o.id}</td>
            <td><c:out value="${o.productName}" /></td>
            <td>
                <fmt:formatNumber value="${o.amount}" type="currency" currencySymbol="VNĐ" />
            </td>
            <td>
                <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy" />
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div style="margin-top: 30px; padding: 10px; border-top: 2px solid #333;">
    <h4>Thống kê hệ thống:</h4>
    <p>Tổng lượt xem đơn hàng toàn cầu: <strong>${applicationScope.totalViewCount}</strong></p>
</div>

</body>
</html>