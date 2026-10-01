<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmed - Shopkart</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<style>
    * { font-family: 'Poppins', sans-serif; }
    body { background: #f0f2f5; min-height: 100vh; display: flex; flex-direction: column;
           align-items: center; justify-content: center; }
    .success-card { background: #fff; border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.1);
                    padding: 50px; text-align: center; max-width: 500px; }
    .success-icon { font-size: 80px; color: #38ef7d; margin-bottom: 20px;
                    animation: scaleIn 0.5s ease; }
    @keyframes scaleIn { 0% { transform: scale(0); } 100% { transform: scale(1); } }
    .success-card h1 { font-weight: 700; color: #333; font-size: 1.8rem; }
    .success-card p { color: #666; font-size: 15px; }
    .btn-continue { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    border: none; border-radius: 10px; padding: 12px 30px; font-weight: 600;
                    color: #fff; transition: transform 0.2s; }
    .btn-continue:hover { transform: translateY(-2px); color: #fff;
                          box-shadow: 0 8px 25px rgba(102,126,234,0.4); }
</style>
</head>
<body>
    <div class="success-card">
        <div class="success-icon"><i class="fas fa-check-circle"></i></div>
        <h1>Order Placed Successfully!</h1>
        <p class="mt-3">Thank you for shopping with <strong>Shopkart</strong>. Your order will be delivered to your address soon.</p>
        <p><i class="fas fa-money-bill-wave mr-1" style="color: #38ef7d;"></i><strong>Payment:</strong> Cash on Delivery</p>
        <a href="/" class="btn btn-continue mt-3"><i class="fas fa-shopping-cart mr-2"></i>Continue Shopping</a>
    </div>
</body>
</html>
