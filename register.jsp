<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Registration</title>
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
      width: 380px;
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

    .login-link {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .login-link a {
      color: #4e54c8;
      text-decoration: none;
      font-weight: 600;
    }

    .login-link a:hover {
      text-decoration: underline;
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
    <form id="registerForm" action="register" method="post">
      <h2>SignUp From</h2>

      <div class="input-group">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="fullname" placeholder="Enter your name" required>
      </div>

      <div class="input-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>
      </div>

      <div class="input-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>
      </div>

      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
      </div>

      <div class="input-group">
        <label for="cpassword">Confirm Password</label>
        <input type="password" id="cpassword" name="cpassword" placeholder="Confirm your password" required>
      </div>

      <button type="submit">Register</button>
      <p class="login-link">Already have an account? <a href="login.jsp">Login</a></p>
    </form>
  </div>
<script>
  document.getElementById("registerForm").addEventListener("submit", function (e) {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const cpassword = document.getElementById("cpassword").value.trim();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!name || !email || !username || !password || !cpassword) {
      alert("Please fill all fields!");
      e.preventDefault();
      return;
    }

    if (!emailRegex.test(email)) {
      alert("Invalid email address!");
      e.preventDefault();
      return;
    }

    if (password !== cpassword) {
      alert("Passwords do not match!");
      e.preventDefault();
      return;
    }

    if (password.length < 6) {
      alert("Password must be at least 6 characters long!");
      e.preventDefault();
      return;
    }
  });
  </script>
</body>
</html>

