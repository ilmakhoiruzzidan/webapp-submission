<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.ilmazidan.webapp.servlet.model.Student" %>
<%@ page import="com.ilmazidan.webapp.servlet.db.StudentDB" %>
<%@ page import="java.util.ArrayList" %>
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
<body>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=Please%20Login%20First");
    } else {
        String username = (String) session.getAttribute("username");

        List<Student> studentList = StudentDB.getStudents();

        Map<String, Integer> totalStudentsByDept = new HashMap<>();
        Map<String, Integer> passedStudentsByDept = new HashMap<>();
        Map<String, List<Student>> studentsByDept = new HashMap<>();

        for (Student student : studentList) {
            String department = student.getDepartment();
            double mark = student.getMark();

            totalStudentsByDept.putIfAbsent(department, 0);
            passedStudentsByDept.putIfAbsent(department, 0);
            studentsByDept.putIfAbsent(department, new ArrayList<>());

            totalStudentsByDept.put(department, totalStudentsByDept.get(department) + 1);
            studentsByDept.get(department).add(student);

            if (mark >= 40) {
                passedStudentsByDept.put(department, passedStudentsByDept.get(department) + 1);
            }
        }
%>

<h1>Welcome <%=username%>
</h1>
<h2>Dashboard</h2>

<h3>Student Details</h3>
<table>
    <tr>
        <th>Department</th>
        <th>Student ID</th>
        <th>Marks</th>
        <th>Pass %</th>
    </tr>
    <%
        for (Map.Entry<String, List<Student>> entry : studentsByDept.entrySet()) {
            String department = entry.getKey();
            List<Student> students = entry.getValue();

            int total = totalStudentsByDept.get(department);
            int passed = passedStudentsByDept.get(department);
            double passPercentage = (double) passed / total * 100;

            for (int i = 0; i < students.size(); i++) {
                Student student = students.get(i);

                if (i == 0) {
    %>
    <tr>
        <td rowspan="<%= students.size() %>"><%= department %>
        </td>
        <td><a href="javascript:void(0);" onclick="showStudentName('<%= student.getStudentName() %>')">
            <%= student.getStudentId() %>
        </a></td>
        <td><%= student.getMark() %>
        </td>
        <td rowspan="<%= students.size() %>"><%= String.format("%.2f", passPercentage) %> %</td>
    </tr>
    <%
    } else {
    %>
    <tr>
        <td><a href="javascript:void(0);" onclick="showStudentName('<%= student.getStudentName() %>')">
            <%= student.getStudentId() %>
        </a></td>
        <td><%= student.getMark() %>
        </td>
    </tr>
    <%
                    }
                }
            }
        }
    %>
</table>

</body>
</html>
