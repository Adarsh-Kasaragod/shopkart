<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <title>My Orders - Shopkart</title>
    <style>
        * { font-family: 'Poppins', sans-serif; }
        body { background: #f0f2f5; }
        .navbar { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important; }
        .navbar-brand { font-weight: 700; font-size: 24px; color: #fff !important; }
        .orders-container { background: #fff; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); padding: 30px; margin-top: 40px; }
        .orders-header { font-weight: 700; color: #333; border-bottom: 2px solid #eee; padding-bottom: 15px; margin-bottom: 25px; }
        .order-item { display: flex; align-items: center; padding: 15px; border-radius: 12px; background: #f8f9fa; margin-bottom: 12px; transition: transform 0.2s; }
        .order-item:hover { transform: translateX(5px); background: #eef1f7; }
        .order-item img { width: 60px; height: 60px; border-radius: 8px; object-fit: cover; margin-right: 15px; }
        .order-item .details { flex: 1; }
        .order-item .details h6 { font-weight: 600; margin-bottom: 2px; }
        .order-item .details small { color: #888; }
        .order-item .price { font-weight: 700; color: #e94560; font-size: 16px; }
        .status-badge { padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 600; }
        .status-delivered { background: #d4edda; color: #155724; }
        .status-shipped { background: #fff3cd; color: #856404; }
        .status-processing { background: #cce5ff; color: #004085; }
        .empty-orders { text-align: center; padding: 50px 0; color: #888; }
        .empty-orders i { font-size: 60px; color: #ccc; margin-bottom: 15px; }
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
        <div class="orders-container">
            <h2 class="orders-header"><i class="fas fa-clipboard-list mr-2"></i>My Orders</h2>
            
            <c:if test="${empty pastOrders}">
                <div class="empty-orders">
                    <i class="fas fa-box-open"></i>
                    <h4>No orders yet!</h4>
                    <p>Start shopping and your orders will appear here.</p>
                    <a href="/" class="btn btn-primary mt-3">Start Shopping</a>
                </div>
            </c:if>
            
            <c:if test="${not empty pastOrders}">
                <c:forEach var="item" items="${pastOrders}" varStatus="loop">
                    <div class="order-item">
                        <img src="${item.image}" alt="${item.name}">
                        <div class="details">
                            <h6>${item.name}</h6>
                            <small>${item.category.name}</small>
                        </div>
                        <div class="mr-3">
                            <c:choose>
                                <c:when test="${loop.index % 3 == 0}">
                                    <span class="status-badge status-delivered"><i class="fas fa-check-circle mr-1"></i>Delivered</span>
                                </c:when>
                                <c:when test="${loop.index % 3 == 1}">
                                    <span class="status-badge status-shipped"><i class="fas fa-truck mr-1"></i>Shipped</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-processing"><i class="fas fa-cog mr-1"></i>Processing</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="price">&#8377;${item.price}</div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</body>
</html>
