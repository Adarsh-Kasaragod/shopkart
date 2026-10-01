<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <title>Shopkart - Welcome</title>
    <style>
        * { font-family: 'Poppins', sans-serif; margin: 0; padding: 0; }
        body { min-height: 100vh; display: flex; align-items: center; justify-content: center;
               background: linear-gradient(135deg, #0f0c29 0%, #302b63 50%, #24243e 100%); }
        .landing-container { text-align: center; max-width: 700px; padding: 40px; }
        .brand { color: #fff; margin-bottom: 50px; }
        .brand i { font-size: 60px; color: #667eea; margin-bottom: 15px; display: block; }
        .brand h1 { font-size: 3rem; font-weight: 700; }
        .brand p { color: rgba(255,255,255,0.6); font-size: 1.1rem; }
        .role-cards { display: flex; gap: 30px; justify-content: center; flex-wrap: wrap; }
        .role-card { background: rgba(255,255,255,0.05); border: 2px solid rgba(255,255,255,0.1);
                     border-radius: 20px; padding: 40px 35px; width: 280px;
                     transition: all 0.4s; cursor: pointer; text-decoration: none; }
        .role-card:hover { transform: translateY(-10px); border-color: #667eea;
                           background: rgba(102,126,234,0.1); text-decoration: none; }
        .role-card .icon { font-size: 55px; margin-bottom: 20px; display: block; }
        .role-card h3 { color: #fff; font-weight: 700; font-size: 1.3rem; margin-bottom: 10px; }
        .role-card p { color: rgba(255,255,255,0.5); font-size: 13px; margin-bottom: 20px; }
        .customer-card .icon { color: #38ef7d; }
        .customer-card:hover { border-color: #38ef7d; background: rgba(56,239,125,0.08); }
        .customer-card .btn-role { background: linear-gradient(135deg, #11998e, #38ef7d); }
        .admin-card .icon { color: #e94560; }
        .admin-card:hover { border-color: #e94560; background: rgba(233,69,96,0.08); }
        .admin-card .btn-role { background: linear-gradient(135deg, #e94560, #c23152); }
        .btn-role { border: none; border-radius: 10px; padding: 10px 30px; font-weight: 600;
                    color: #fff; font-size: 14px; }
        .credentials { color: rgba(255,255,255,0.35); font-size: 12px; margin-top: 30px; }
        .credentials span { color: rgba(255,255,255,0.55); }
    </style>
</head>
<body>
<div class="landing-container">
    <div class="brand">
        <i class="fas fa-shopping-cart"></i>
        <h1>Shopkart</h1>
        <p>Your One-Stop E-Commerce Platform</p>
    </div>
    <div class="role-cards">
        <form action="/userloginvalidate" method="post" class="role-card customer-card" onclick="this.submit()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="username" value="adarsh">
            <input type="hidden" name="password" value="adarsh123">
            <span class="icon"><i class="fas fa-user"></i></span>
            <h3>Customer</h3>
            <p>Browse products, add to cart, and shop amazing deals</p>
            <span class="btn btn-role">Shop Now <i class="fas fa-arrow-right ml-1"></i></span>
        </form>
    </div>
    <div class="credentials">
        Demo Credentials &mdash; Customer: <span>adarsh / adarsh123</span>
    </div>
</div>
</body>
</html>
