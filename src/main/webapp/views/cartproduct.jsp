<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <title>Your Cart - Shopkart</title>
    <style>
        * { font-family: 'Poppins', sans-serif; }
        body { background: #f0f2f5; }
        .navbar { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important; }
        .navbar-brand { font-weight: 700; font-size: 24px; color: #fff !important; }
        .cart-container { background: #fff; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); padding: 30px; margin-top: 40px; }
        .cart-header { font-weight: 700; color: #333; border-bottom: 2px solid #eee; padding-bottom: 15px; margin-bottom: 25px; }
        .table img { border-radius: 8px; object-fit: cover; }
        .table th { border-top: none; color: #888; font-weight: 600; }
        .table td { vertical-align: middle; font-weight: 500; }
        .btn-checkout { background: linear-gradient(135deg, #11998e, #38ef7d); border: none; color: #fff; padding: 12px 30px; font-weight: 700; border-radius: 10px; }
        .btn-checkout:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(56,239,125,0.4); color: #fff; }
        .btn-remove { border-radius: 8px; }
        .empty-cart { text-align: center; padding: 50px 0; color: #888; }
        .empty-cart i { font-size: 60px; color: #ccc; margin-bottom: 15px; }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="/"><i class="fas fa-shopping-cart mr-2"></i>Shopkart</a>
            <span class="text-light">Welcome, ${username}!</span>
        </div>
    </nav>
    <div class="container">
        <div class="cart-container">
            <h2 class="cart-header"><i class="fas fa-shopping-bag mr-2"></i>Your Shopping Cart</h2>
            
            <c:if test="${empty cartProducts}">
                <div class="empty-cart">
                    <i class="fas fa-box-open"></i>
                    <h4>Your cart is empty!</h4>
                    <a href="/" class="btn btn-primary mt-3">Continue Shopping</a>
                </div>
            </c:if>
            
            <c:if test="${not empty cartProducts}">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cartProducts}">
                                <tr>
                                    <td><img src="${item.image}" width="60" height="60"></td>
                                    <td>${item.name}</td>
                                    <td><span class="badge badge-info">${item.category.name}</span></td>
                                    <td class="text-success font-weight-bold">&#8377;${item.price}</td>
                                    <td>
                                        <a href="/cart/delete?id=${item.id}" class="btn btn-sm btn-outline-danger btn-remove">
                                            <i class="fas fa-trash-alt"></i> Remove
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-4 pt-3 border-top">
                    <h4 class="font-weight-bold">Total: <span class="text-success">&#8377;${total}</span></h4>
                    <a href="/checkout" class="btn btn-checkout">Proceed to Checkout <i class="fas fa-arrow-right ml-1"></i></a>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>