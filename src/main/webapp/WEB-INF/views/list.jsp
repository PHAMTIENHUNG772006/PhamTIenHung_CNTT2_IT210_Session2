<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<h2>Danh sách nhân viên</h2>
<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã NV</th>
        <th>Họ tên</th>
        <th>Phòng ban</th>
        <th>Lương (VNĐ)</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="emp" items="${list}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td><c:out value="${emp.code}"/></td>
            <td><c:out value="${emp.fullName}"/></td>
            <td>${emp.department}</td>
            <td><fmt:formatNumber value="${emp.salary}" pattern="#,###"/></td>
            <td>
                <c:set var="cls" value="${emp.status == 'Đang làm' ? 'green' : (emp.status == 'Nghỉ phép' ? 'orange' : 'blue')}"/>
                <span style="color: ${cls}">${emp.status}</span>
            </td>
            <td>
                <a href="<c:url value='/employees/${emp.code}'/>">Xem chi tiết</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><b>Tổng lương phòng Kỹ thuật: <fmt:formatNumber value="${totalTech}" pattern="#,###"/> VNĐ</b></p>
