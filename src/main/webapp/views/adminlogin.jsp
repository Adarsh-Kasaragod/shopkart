<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <title>Shopkart - Admin Login</title>
    <style>
        * { font-family: 'Poppins', sans-serif; }
        body { min-height: 100vh; display: flex; align-items: center; justify-content: center;
               background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%); }
        .admin-card { background: #1e1e2f; border-radius: 20px;
                      box-shadow: 0 20px 60px rgba(0,0,0,0.5); max-width: 420px; width: 100%;
                      border: 1px solid rgba(255,255,255,0.1); overflow: hidden; }
        .admin-header { background: linear-gradient(135deg, #e94560 0%, #c23152 100%);
                        padding: 30px; text-align: center; color: #fff; }
        .admin-header i { font-size: 50px; margin-bottom: 10px; }
        .admin-header h2 { margin: 0; font-weight: 700; }
        .admin-header p { margin: 5px 0 0; opacity: 0.8; font-size: 14px; }
        .admin-body { padding: 30px 35px; }
        .form-group label { font-weight: 600; color: #aaa; font-size: 14px; }
        .form-control { border-radius: 10px; border: 2px solid #333; background: #2a2a3d;
                        color: #fff; padding: 12px 15px; transition: border-color 0.3s; }
        .form-control:focus { border-color: #e94560; background: #2a2a3d; color: #fff;
                              box-shadow: 0 0 0 0.2rem rgba(233,69,96,0.25); }
        .form-control::placeholder { color: #666; }
        .btn-admin { background: linear-gradient(135deg, #e94560 0%, #c23152 100%);
                     border: none; border-radius: 10px; padding: 12px; font-weight: 600;
                     font-size: 16px; color: #fff; transition: transform 0.2s; }
        .btn-admin:hover { transform: translateY(-2px); box-shadow: 0 5px 20px rgba(233,69,96,0.4); color: #fff; }
    </style>
</head>
<body>
<div class="admin-card">
    <div class="admin-header">
        <i class="fas fa-shield-alt"></i>
        <h2>Shopkart</h2>
        <p>Admin Panel Login</p>
    </div>
    <div class="admin-body">
        <form action="/admin/loginvalidate" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="form-group">
                <label><i class="fas fa-user-shield mr-1"></i> Admin Username</label>
                <input type="text" name="username" id="username" placeholder="Admin username" required class="form-control">
            </div>
            <div class="form-group">
                <label><i class="fas fa-key mr-1"></i> Password</label>
                <input type="password" class="form-control" placeholder="Admin password" required name="password" id="password">
            </div>
            <input type="submit" value="Login to Dashboard" class="btn btn-admin btn-block mt-4">
            <h5 class="text-center text-danger mt-3">${msg}</h5>
        </form>
    </div>
</div>
</body>
</html>
