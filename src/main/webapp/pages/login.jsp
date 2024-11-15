<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../css/index.css">

    <script src="../js/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#loginForm").submit(function (e) {
                const username = $("#username").val();
                const password = $("#password").val();
                if (username === "" || password === "") {
                    e.preventDefault();
                    alert("Both fields are required.");
                }
            }).validate({
                rules: {
                    username: {
                        required: true,
                        minlength: 4,
                    },
                    password: {
                        required: true,
                        minlength: 5,
                    }
                },
                messages: {
                    username: {
                        required: 'Enter username',
                    },
                    password: {
                        required: 'Enter password',
                    },
                }
            });
        });
    </script>


</head>
<body>

<div class="login-container">
    <h2>Login Page</h2>
    <form id="loginForm" action="login" method="post">
        <%
            String errorMessage = request.getParameter("error");
            if (errorMessage != null) {
        %>
        <div class="error-message">
            <%= errorMessage %>
        </div>
        <% } %>

        <label for="username">
            <span>Username</span>
            <input type="text" id="username" name="username" required>
        </label>

        <label for="password">
            <span>Password</span>
            <input type="password" id="password" name="password" required>
        </label>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
