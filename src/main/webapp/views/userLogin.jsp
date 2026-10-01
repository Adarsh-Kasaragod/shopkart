<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <title>Shopkart - Customer Login</title>
    <style>
        * { font-family: 'Poppins', sans-serif; }
        body { min-height: 100vh; display: flex; align-items: center; justify-content: center;
               background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .login-card { background: #fff; border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.3);
                      max-width: 420px; width: 100%; overflow: hidden; }
        .login-header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        padding: 30px; text-align: center; color: #fff; }
        .login-header i { font-size: 50px; margin-bottom: 10px; }
        .login-header h2 { margin: 0; font-weight: 700; }
        .login-header p { margin: 5px 0 0; opacity: 0.8; font-size: 14px; }
        .login-body { padding: 30px 35px; }
        .form-group label { font-weight: 600; color: #333; font-size: 14px; }
        .form-control { border-radius: 10px; border: 2px solid #e0e0e0; padding: 12px 15px;
                        transition: border-color 0.3s; }
        .form-control:focus { border-color: #667eea; box-shadow: 0 0 0 0.2rem rgba(102,126,234,0.25); }
        .btn-login { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                     border: none; border-radius: 10px; padding: 12px; font-weight: 600;
                     font-size: 16px; transition: transform 0.2s, box-shadow 0.2s; }
        .btn-login:hover { transform: translateY(-2px); box-shadow: 0 5px 20px rgba(102,126,234,0.4); }
        .register-link { text-align: center; margin-top: 15px; font-size: 14px; }
        .register-link a { color: #764ba2; font-weight: 600; }
    </style>
</head>
<body>
<div class="login-card">
    <div class="login-header">
        <i class="fas fa-shopping-cart"></i>
        <h2>Shopkart</h2>
        <p>Customer Login</p>
    </div>
    <div class="login-body">
        <form action="/userloginvalidate" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="form-group">
                <label for="username"><i class="fas fa-user mr-1"></i> Username</label>
                <input type="text" name="username" id="username" placeholder="Enter your username" required class="form-control">
            </div>
            <div class="form-group">
                <label for="password"><i class="fas fa-lock mr-1"></i> Password</label>
                <input type="password" class="form-control" placeholder="Enter your password" required name="password" id="password">
            </div>
            <input type="submit" value="Login" class="btn btn-primary btn-login btn-block">
            <div class="register-link">
                Don't have an account? <a href="/register">Register here</a>
            </div>
            <h5 class="text-center text-danger mt-3">${msg}</h5>
        </form>
    </div>
</div>
</body>
</html>
