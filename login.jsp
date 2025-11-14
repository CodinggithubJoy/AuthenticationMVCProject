<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Login</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: brown;
    }

    .container {
      background: #fff;
      padding: 40px 35px;
      border-radius: 16px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
      width: 360px;
      transition: all 0.3s ease;
    }

    .container:hover {
      transform: translateY(-4px);
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 25px;
      font-size: 26px;
      font-weight: 600;
    }

    .input-group {
      margin-bottom: 18px;
    }

    label {
      display: block;
      margin-bottom: 6px;
      color: #555;
      font-weight: 500;
      font-size: 14px;
    }

    input {
      width: 100%;
      padding: 10px 12px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
      transition: 0.3s;
    }

    input:focus {
      border-color: #4e54c8;
      box-shadow: 0 0 5px rgba(78, 84, 200, 0.4);
      outline: none;
    }

    button {
      width: 100%;
      background-color: #4e54c8;
      color: #fff;
      border: none;
      padding: 12px;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    button:hover {
      background-color: #3d42a1;
    }

    .bottom-text {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .bottom-text a {
      color: #4e54c8;
      text-decoration: none;
      font-weight: 600;
    }

    .bottom-text a:hover {
      text-decoration: underline;
    }

    .error {
      color: #d93025;
      font-size: 13px;
      text-align: center;
      margin-bottom: 10px;
    }

    @media (max-width: 420px) {
      .container {
        width: 90%;
        padding: 25px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <form id="loginForm" action="login" method="post">
      <h2>Login</h2>
     <div id="errorMessage" style="color:red; text-align:center;">
         <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
                out.print(error);
            }
         %>
       </div>

      <div class="input-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>
      </div>

      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
      </div>

      <button type="submit">Login</button>

      <p class="bottom-text">
        Don’t have an account? <a href="register.jsp">Register</a>
      </p>
    </form>
  </div>

  <script>
    document.getElementById("loginForm").addEventListener("submit", function (e) {

      const username = document.getElementById("username").value.trim();
      const password = document.getElementById("password").value.trim();
      const errorDiv = document.getElementById("errorMessage");

      errorDiv.textContent = "";

      if (!username || !password) {
        errorDiv.textContent = " Please fill in all fields!";
        return;
      }

      if (password.length < 6) {
        errorDiv.textContent = " Password must be at least 6 characters!";
        return;
      }
    });
  </script>
</body>
</html>