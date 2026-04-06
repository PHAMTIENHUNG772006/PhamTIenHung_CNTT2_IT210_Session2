<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div style="background:#eee; padding:10px;">
    <h3>Mini Portal Nhân sự</h3>

    <c:if test="${not empty sessionScope.loggedUser}">
        Xin chào: <b><c:out value="${sessionScope.loggedUser}"/></b> |
        Vai trò: <b><c:out value="${sessionScope.role}"/></b> |

        <a href="<c:url value='/employees'/>">Danh sách</a>

        <c:if test="${sessionScope.role == 'hr_manager'}">
            | <span>Quản lý</span>
        </c:if>

        | <a href="<c:url value='/logout'/>">Đăng xuất</a>
    </c:if>
</div>
<hr/>