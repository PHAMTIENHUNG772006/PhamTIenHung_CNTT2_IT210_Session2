<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ include file="header.jsp" %>

<div class="container mt-4">
    <h2>Employee Detail</h2>

    <p><b>Code:</b> ${employee.code}</p>
    <p><b>Name:</b> ${employee.fullName}</p>
    <p><b>Department:</b> ${employee.department}</p>

    <p><b>Salary:</b>
        <c:choose>
            <c:when test="${sessionScope.role == 'hr_manager'}">
                <fmt:formatNumber value="${employee.salary}" type="currency"/>
            </c:when>
            <c:otherwise>***</c:otherwise>
        </c:choose>
    </p>

    <p><b>Join Date:</b>
        <fmt:formatDate value="${employee.joinDate}" pattern="dd/MM/yyyy"/>
    </p>

    <p><b>Status:</b> ${employee.status}</p>

    <a href="<c:url value='/employees'/>" class="btn btn-secondary">
        Quay lại
    </a>
</div>

<%@ include file="footer.jsp" %>