<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Khai báo thư viện JSTL cho Jakarta EE (Tomcat 10/11) --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<html>
<head>
    <title>Kết quả tìm kiếm sự kiện</title>
    <style>
        .free-badge { color: white; background-color: green; padding: 2px 5px; border-radius: 4px; }
        .out-of-stock { color: red; font-weight: bold; }
        .low-stock { color: orange; }
        .normal-stock { color: blue; }
        .btn-disabled { color: gray; pointer-events: none; text-decoration: none; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
    </style>
</head>
<body>

<%-- A. Phần header tìm kiếm --%>
<div>
    <%-- CHỐNG XSS: Luôn dùng c:out cho dữ liệu người dùng nhập --%>
    <h2>Kết quả tìm kiếm cho: <c:out value="${keyword}" /></h2>
    <p>Tìm thấy <strong>${fn:length(events)}</strong> sự kiện.</p>
</div>

<c:choose>
    <%-- Trường hợp không có dữ liệu --%>
    <c:when test="${empty events}">
        <p>Không tìm thấy sự kiện nào phù hợp.</p>
    </c:when>

    <%-- B. Bảng kết quả khi có dữ liệu --%>
    <c:otherwise>
        <table>
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên sự kiện</th>
                <th>Ngày tổ chức</th>
                <th>Giá vé</th>
                <th>Vé còn lại</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="event" items="${events}" varStatus="status">
                <tr>
                        <%-- 1. STT dùng varStatus --%>
                    <td>${status.count}</td>

                        <%-- 2. Tên sự kiện (Chống XSS) --%>
                    <td><c:out value="${event.name}" /></td>

                        <%-- 3. Ngày tổ chức --%>
                    <td>${event.date}</td>

                        <%-- 4. Giá vé --%>
                    <td>
                        <c:choose>
                            <c:when test="${event.price == 0}">
                                <span class="free-badge">MIỄN PHÍ</span>
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${event.price}" type="number" /> VNĐ
                            </c:otherwise>
                        </c:choose>
                    </td>

                        <%-- 5. Vé còn lại --%>
                    <td>
                        <c:choose>
                            <c:when test="${event.remainingTickets == 0}">
                                <span class="out-of-stock">HẾT VÉ</span>
                            </c:when>
                            <c:when test="${event.remainingTickets < 10}">
                                <span class="low-stock">Sắp hết (còn ${event.remainingTickets} vé)</span>
                            </c:when>
                            <c:otherwise>
                                <span class="normal-stock">${event.remainingTickets}</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                        <%-- 6. Thao tác đặt vé --%>
                    <td>
                        <c:choose>
                            <c:when test="${event.remainingTickets == 0}">
                                <span class="btn-disabled">Đặt vé</span>
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/events/${event.id}/book'/>">Đặt vé</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<%-- C. Phần footer --%>
<div style="margin-top: 20px; border-top: 1px solid #ccc; padding-top: 10px;">
    <c:if test="${not empty events}">
        <p>Sự kiện đầu tiên: <strong>${fn:toUpperCase(events[0].name)}</strong></p>
    </c:if>
    <p>Từ khóa có: ${fn:length(keyword)} ký tự.</p>
</div>

</body>
</html>