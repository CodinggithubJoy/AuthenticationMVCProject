<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: #fff;
        }
        h2 {
            margin-bottom: 20px;
        }
        .logout-btn {
            background-color: #ff4b5c;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .logout-btn:hover {
            background-color: #e63946;
        }
    </style>
</head>
<body>

    <h2>Welcome, <%= username %> 🎉</h2>
    <form action="logout" method="post">
        <button type="submit" class="logout-btn">Logout</button>
    </form>

</body>
</html>
