<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Login</title>
</head>
<body>

<h2>Đăng nhập</h2>

<form action="<c:url value='/login'/>" method="post">
    Tài khoản: <input name="username" required /> <br/>
    Mật khẩu: <input name="password" type="password" required /> <br/>
    <button type="submit">Đăng nhập</button>
</form>

<c:if test="${not empty errorMessage}">
    <p style="color:red">
        <c:out value="${errorMessage}"/>
    </p>
</c:if>

</body>
</html>