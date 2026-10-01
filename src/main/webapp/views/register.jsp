<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <title>Shopkart - Register</title>
    <style>
        * { font-family: 'Poppins', sans-serif; }
        body { min-height: 100vh; display: flex; align-items: center; justify-content: center;
               background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 30px 0; }
        .register-card { background: #fff; border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.3);
                         max-width: 480px; width: 100%; overflow: hidden; }
        .register-header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                           padding: 25px; text-align: center; color: #fff; }
        .register-header i { font-size: 45px; margin-bottom: 8px; }
        .register-header h2 { margin: 0; font-weight: 700; }
        .register-header p { margin: 5px 0 0; opacity: 0.8; font-size: 14px; }
        .register-body { padding: 25px 35px; }
        .form-group label { font-weight: 600; color: #333; font-size: 14px; }
        .form-control { border-radius: 10px; border: 2px solid #e0e0e0; padding: 10px 15px;
                        transition: border-color 0.3s; }
        .form-control:focus { border-color: #667eea; box-shadow: 0 0 0 0.2rem rgba(102,126,234,0.25); }
        .btn-register { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        border: none; border-radius: 10px; padding: 12px; font-weight: 600;
                        font-size: 16px; color: #fff; transition: transform 0.2s; }
        .btn-register:hover { transform: translateY(-2px); box-shadow: 0 5px 20px rgba(102,126,234,0.4); color: #fff; }
        .login-link { text-align: center; margin-top: 15px; font-size: 14px; }
        .login-link a { color: #764ba2; font-weight: 600; }
    </style>
</head>
<body>
<div class="register-card">
    <div class="register-header">
        <i class="fas fa-user-plus"></i>
        <h2>Shopkart</h2>
        <p>Create Your Account</p>
    </div>
    <div class="register-body">
        <form action="newuserregister" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="form-group">
                <label><i class="fas fa-user mr-1"></i> Username</label>
                <input type="text" name="username" required placeholder="Choose a username" class="form-control">
            </div>
            <div class="form-group">
                <label><i class="fas fa-envelope mr-1"></i> Email</label>
                <input type="email" class="form-control" required placeholder="your@email.com" name="email">
                <small class="form-text text-muted">We'll never share your email with anyone.</small>
            </div>
            <div class="form-group">
                <label><i class="fas fa-lock mr-1"></i> Password</label>
                <input type="password" class="form-control" required placeholder="Create a strong password" name="password">
            </div>
            <div class="form-group">
                <label><i class="fas fa-map-marker-alt mr-1"></i> Address</label>
                <textarea class="form-control" rows="2" placeholder="Your delivery address" name="address"></textarea>
            </div>
            <input type="submit" value="Create Account" class="btn btn-register btn-block">
            <div class="login-link">
                Already have an account? <a href="/">Login here</a>
            </div>
            <h5 class="text-center text-danger mt-3">${msg}</h5>
        </form>
    </div>
</div>
</body>
</html>