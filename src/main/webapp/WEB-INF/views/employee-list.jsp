<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ include file="header.jsp" %>

<div class="container mt-4">
    <h2 class="text-center mb-4">Employee Management</h2>

    <table class="table table-bordered table-hover">
        <thead class="table-dark text-center">
        <tr>
            <th>#</th>
            <th>Code</th>
            <th>Full Name</th>
            <th>Department</th>
            <th>Salary</th>
            <th>Join Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="emp" items="${employees}" varStatus="st">
            <tr>
                <td>${st.count}</td>

                <td>${emp.code}</td>
                <td>${emp.fullName}</td>
                <td>${emp.department}</td>

                <!-- LƯƠNG -->
                <td>
                    <c:choose>
                        <c:when test="${sessionScope.role == 'hr_manager'}">
                            <fmt:formatNumber value="${emp.salary}" type="currency"/>
                        </c:when>
                        <c:otherwise>
                            ***
                        </c:otherwise>
                    </c:choose>
                </td>

                <!-- DATE -->
                <td>
                    <fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy"/>
                </td>

                <!-- STATUS -->
                <td>
                    <c:choose>
                        <c:when test="${emp.status == 'Đang làm'}">
                            <span class="badge bg-success">Đang làm</span>
                        </c:when>
                        <c:when test="${emp.status == 'Nghỉ phép'}">
                            <span class="badge bg-warning text-dark">Nghỉ phép</span>
                        </c:when>
                        <c:when test="${emp.status == 'Thử việc'}">
                            <span class="badge bg-primary">Thử việc</span>
                        </c:when>
                    </c:choose>
                </td>

                <!-- ACTION -->
                <td>
                    <a href="<c:url value='/employees/${emp.code}'/>"
                       class="btn btn-sm btn-info">
                        Xem chi tiết
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>

        <!-- TOTAL -->
        <tfoot>
        <tr>
            <td colspan="4"><b>Tổng lương phòng Kỹ thuật</b></td>
            <td colspan="4">
                <fmt:formatNumber value="${totalTechSalary}" type="currency"/>
            </td>
        </tr>
        </tfoot>

    </table>
</div>

<%@ include file="footer.jsp" %>