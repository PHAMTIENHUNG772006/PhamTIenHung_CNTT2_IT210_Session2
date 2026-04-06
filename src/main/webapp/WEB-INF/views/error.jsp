<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="header.jsp" %>

<h2>Lỗi hệ thống</h2>

<p style="color:red;">
    <c:out value="${errorMessage}"/>
</p>

<a href="<c:url value='/employees'/>">Quay lại</a>

<%@ include file="footer.jsp" %>