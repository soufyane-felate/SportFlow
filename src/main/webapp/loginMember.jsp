<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #3b82f6, #9333ea);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .login-card {
            border: none;
            border-radius: 15px;
            background: white;
            max-width: 400px;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .login-header {
            background: #3b82f6;
            color: white;
            text-align: center;
            padding: 30px 20px;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .form-icon {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 15px;
            color: #6c757d;
        }
        .form-control {
            border-radius: 30px;
            padding-left: 50px;
        }
        .btn-login {
            background: #3b82f6;
            color: white;
            border-radius: 30px;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            transition: background 0.3s ease;
        }
        .btn-login:hover {
            background: #9333ea;
        }
        .alert {
            margin-top: 20px;
        }
        .toggle-password {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="login-card">
    <div class="login-header">
        <h2><i class="fas fa-user-lock"></i> Member Login</h2>
        <p>Sign in to access your account</p>
    </div>
    <div class="card-body p-4">
        <form action="login" method="post">
            <div class="mb-4 form-group position-relative">
                <i class="fas fa-user form-icon"></i>
                <input type="text" class="form-control" id="name" name="name"
                       placeholder="Enter your name" required aria-label="Name">
            </div>
            <div class="mb-4 form-group position-relative">
                <i class="fas fa-lock form-icon"></i>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Enter your password" required aria-label="Password">
                <i class="fas fa-eye toggle-password" onclick="togglePasswordVisibility()"></i>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-login">
                    <i class="fas fa-sign-in-alt me-2"></i>Login
                </button>
            </div>
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
    </div>
</div>

<script>
    function togglePasswordVisibility() {
        const passwordField = document.getElementById('password');
        const toggleIcon = document.querySelector('.toggle-password');
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }
</script>
</body>
</html>
