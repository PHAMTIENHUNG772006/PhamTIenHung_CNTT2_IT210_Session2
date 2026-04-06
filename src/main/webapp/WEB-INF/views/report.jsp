
<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.List, com.re.session2.Kha.lession2.model.Student" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Báo cáo điểm</title>
    <style>
        table { border-collapse: collapse; width: 500px; }
        th, td { padding: 10px; text-align: center; }
    </style>
</head>
<body>

<h1>${reportTitle}</h1>

<p>Lượt xem trang: 1</p>

<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sv" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>

            <td><c:out value="${sv.fullName}" /></td>

            <td>${sv.score}</td>

            <td>
                <c:choose>
                    <c:when test="${sv.score >= 90}"><b>Xuất sắc</b></c:when>
                    <c:when test="${sv.score >= 80}">Giỏi</c:when>
                    <c:when test="${sv.score >= 70}">Khá</c:when>
                    <c:otherwise><span style="color:red">Yếu</span></c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>