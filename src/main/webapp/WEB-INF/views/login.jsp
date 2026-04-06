<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Đăng nhập hệ thống</title>
    <style>
        .error { color: red; margin-bottom: 10px; }
        form { margin-top: 20px; }
    </style>
</head>
<body>
<h2>Cửa hàng Điện tử - Đăng nhập</h2>

<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>

<form action="<c:url value='/login'/>" method="POST">
    <div>
        Tài khoản: <input name="username" required />
    </div>
    <div style="margin-top: 10px;">
        Mật khẩu: <input name="password" type="password" required />
    </div>
    <button type="submit" style="margin-top: 15px;">Đăng nhập</button>
</form>
</body>
</html>