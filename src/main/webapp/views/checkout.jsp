<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Shopkart</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<style>
    * { font-family: 'Poppins', sans-serif; }
    body { background: #f0f2f5; }
    .navbar { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important; }
    .navbar-brand { font-weight: 700; font-size: 24px; color: #fff !important; }
    .checkout-card { background: #fff; border-radius: 16px; box-shadow: 0 10px 40px rgba(0,0,0,0.1);
                     padding: 35px; margin-top: 30px; }
    .checkout-card h2 { font-weight: 700; color: #333; margin-bottom: 25px; }
    .form-control { border-radius: 10px; border: 2px solid #e0e0e0; padding: 12px 15px; }
    .form-control:focus { border-color: #667eea; box-shadow: 0 0 0 0.2rem rgba(102,126,234,0.25); }
    .form-group label { font-weight: 600; color: #555; }
    .btn-place-order { background: linear-gradient(135deg, #11998e, #38ef7d); border: none;
                       border-radius: 10px; padding: 14px; font-weight: 700; font-size: 18px;
                       color: #fff; transition: transform 0.2s; }
    .btn-place-order:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(56,239,125,0.4); color: #fff; }
    .cod-badge { background: linear-gradient(135deg, #667eea, #764ba2); color: #fff;
                 padding: 12px 20px; border-radius: 12px; display: inline-flex; align-items: center; }
    .cod-badge i { font-size: 24px; margin-right: 10px; }
</style>
</head>
<body>
    <nav class="navbar navbar-dark">
        <a class="navbar-brand" href="/"><i class="fas fa-shopping-cart mr-2"></i>Shopkart</a>
    </nav>
    <div class="container">
        <div class="checkout-card">
            <h2><i class="fas fa-credit-card mr-2" style="color: #667eea;"></i>Checkout</h2>
            <form action="/orderConfirmation" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="form-group">
                    <label><i class="fas fa-map-marker-alt mr-1"></i> Delivery Address</label>
                    <textarea class="form-control" name="address" rows="3" required
                              placeholder="Enter your full delivery address..."></textarea>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-wallet mr-1"></i> Payment Method</label><br>
                    <div class="cod-badge mt-2">
                        <i class="fas fa-money-bill-wave"></i>
                        <div>
                            <input type="radio" name="payment" value="COD" checked>
                            <strong>Cash on Delivery (COD)</strong>
                            <br><small style="opacity:0.8;">Pay when you receive your order</small>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-place-order btn-block mt-4">
                    <i class="fas fa-check-circle mr-2"></i>Place Order
                </button>
            </form>
        </div>
    </div>
</body>
</html>
