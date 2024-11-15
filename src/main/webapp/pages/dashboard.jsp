<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.ilmazidan.webapp.servlet.model.Student" %>
<%@ page import="com.ilmazidan.webapp.servlet.db.StudentDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <script type="text/javascript">
        function showStudentName(studentName) {
            alert("Student Name: " + studentName);
        }
    </script>
</head>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=Please%20Login%20First");
    } else {
        String username = (String) session.getAttribute("username");

        List<Student> studentList = StudentDB.getStudents();

        Map<String, Integer> totalStudentsByDept = new HashMap<>();
        Map<String, Integer> passedStudentsByDept = new HashMap<>();

        for (Student student : studentList) {
            String department = student.getDepartment();
            double mark = student.getMark();

            totalStudentsByDept.putIfAbsent(department, 0);
            passedStudentsByDept.putIfAbsent(department, 0);

            totalStudentsByDept.put(department, totalStudentsByDept.get(department) + 1);

            if (mark >= 40) {
                passedStudentsByDept.put(department, passedStudentsByDept.get(department) + 1);
            }
        }
%>

<body>
<h1>Welcome <%=username%></h1>
<h2>Dashboard</h2>

<table border="1">
    <tr>
        <th>Department</th>
        <th>Student ID</th>
        <th>Marks</th>
        <th>Pass %</th>
    </tr>
    <%
        // Loop through departments and calculate the pass percentage
        for (Student student : studentList) {
            String department = student.getDepartment();
            int total = totalStudentsByDept.get(department);
            int passed = passedStudentsByDept.get(department);
            double passPercentage = (double) passed / total * 100;
    %>
    <tr>
        <td><%= student.getDepartment() %></td>
        <td>
            <a href="javascript:void(0);" onclick="showStudentName('<%= student.getStudentName() %>')">
                <%= student.getStudentId() %>
            </a>
        </td>
        <td><%= student.getMark() %></td>
        <td><%= String.format("%.2f", passPercentage) %> %</td>
    </tr>
    <%
        }
    %>
</table>

</body>
<% } %>

</html>
