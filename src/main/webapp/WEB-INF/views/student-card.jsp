<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Thẻ Sinh Viên</title>
    <style>
        body {
            font-family: Arial;
        }
        .card {
            border: 2px solid #333;
            width: 350px;
            padding: 15px;
            margin-top: 20px;
            border-radius: 10px;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        .good { color: green; }
        .quite { color: blue; }
        .avg { color: orange; }
        .bad { color: red; font-weight: bold; }
    </style>
</head>
<body>

<h2>Tra cứu thẻ sinh viên</h2>

<form method="get" action="${pageContext.request.contextPath}/student-card">
    Nhập mã SV: <input type="text" name="msv"/>
    <button type="submit">Tra cứu</button>
</form>

<!-- HIỂN THỊ LỖI -->
<c:if test="${not empty errorMessage}">
    <div class="error">${errorMessage}</div>
</c:if>

<!-- HIỂN THỊ THẺ -->
<c:if test="${empty errorMessage and not empty studentName}">
    <div class="card">
        <h3>🎓 Thẻ Sinh Viên</h3>
        <p><b>Mã SV:</b> ${msv}</p>
        <p><b>Họ tên:</b> ${studentName}</p>
        <p><b>Khoa:</b> ${faculty}</p>
        <p><b>Năm học:</b> ${year}</p>
        <p><b>GPA:</b> ${gpa}</p>

        <p><b>Xếp loại:</b>
            <c:choose>
                <c:when test="${gpa >= 8}">
                    <span class="good">Giỏi</span>
                </c:when>
                <c:when test="${gpa >= 6.5}">
                    <span class="quite">Khá</span>
                </c:when>
                <c:when test="${gpa >= 5}">
                    <span class="avg">Trung bình</span>
                </c:when>
                <c:otherwise>
                    <span class="bad">Cảnh báo học vụ</span>
                </c:otherwise>
            </c:choose>
        </p>
    </div>
</c:if>

<br>
<a href="${pageContext.request.contextPath}/student-card">
    Tra cứu sinh viên khác
</a>

</body>
</html>