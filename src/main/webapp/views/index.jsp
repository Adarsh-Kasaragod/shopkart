<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <title>Shopkart - Your One Stop Shop</title>
    <style>
        * { font-family: 'Poppins', sans-serif; }
        body { background: #f0f2f5; }
        .navbar { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
                  box-shadow: 0 4px 15px rgba(0,0,0,0.2); }
        .navbar-brand { font-weight: 700; font-size: 24px; color: #fff !important; }
        .navbar-brand i { margin-right: 8px; }
        .nav-link { color: rgba(255,255,255,0.9) !important; font-weight: 500; transition: color 0.3s; }
        .nav-link:hover { color: #fff !important; }
        .hero { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: #fff; padding: 50px 0 40px; text-align: center; margin-bottom: 30px; }
        .hero h1 { font-weight: 700; font-size: 2.5rem; }
        .hero p { font-size: 1.1rem; opacity: 0.9; }
        .product-card { border: none; border-radius: 15px; overflow: hidden;
                        box-shadow: 0 5px 20px rgba(0,0,0,0.08);
                        transition: transform 0.3s, box-shadow 0.3s; height: 100%; }
        .product-card:hover { transform: translateY(-8px); box-shadow: 0 15px 40px rgba(0,0,0,0.15); }
        .product-card .card-img-top { height: 180px; object-fit: cover; background: #f8f9fa; }
        .product-card .card-body { padding: 20px; display: flex; flex-direction: column; }
        .product-card .card-title { font-weight: 600; font-size: 15px; color: #333;
                                     overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
        .product-card .price { font-size: 20px; font-weight: 700; color: #e94560; }
        .product-card .category-badge { background: linear-gradient(135deg, #667eea, #764ba2);
                                         color: #fff; padding: 3px 10px; border-radius: 20px;
                                         font-size: 11px; font-weight: 600; display: inline-block; margin-bottom: 8px; }
        .product-card .desc { font-size: 12px; color: #888; overflow: hidden;
                              text-overflow: ellipsis; white-space: nowrap; margin-bottom: 12px; }
        .btn-cart { border-radius: 8px; font-weight: 600; font-size: 13px; padding: 8px 14px; }
        .btn-buynow { background: linear-gradient(135deg, #11998e, #38ef7d); border: none;
                      border-radius: 8px; font-weight: 600; font-size: 13px; padding: 8px 14px; color: #fff; }
        .btn-buynow:hover { color: #fff; box-shadow: 0 4px 15px rgba(56,239,125,0.4); }
        .col-product { margin-bottom: 25px; }
        footer { background: #1a1a2e; color: #aaa; padding: 25px 0; text-align: center; margin-top: 40px; }
        footer a { color: #667eea; }
        .welcome-text { color: rgba(255,255,255,0.9); font-weight: 500; margin-right: 15px; }

        /* Chatbot CSS */
        #chatbot-toggler { position: fixed; bottom: 30px; right: 30px; background: linear-gradient(135deg, #667eea, #764ba2); color: white; border: none; border-radius: 50%; width: 60px; height: 60px; font-size: 24px; box-shadow: 0 5px 15px rgba(0,0,0,0.2); cursor: pointer; z-index: 1000; transition: transform 0.3s; }
        #chatbot-toggler:hover { transform: scale(1.1); }
        #chatbot { position: fixed; bottom: 100px; right: 30px; width: 320px; background: white; border-radius: 15px; box-shadow: 0 10px 40px rgba(0,0,0,0.15); overflow: hidden; display: none; z-index: 1000; flex-direction: column; }
        .chat-header { background: linear-gradient(135deg, #667eea, #764ba2); color: white; padding: 15px; font-weight: 600; display: flex; justify-content: space-between; align-items: center; }
        .chat-header .close-btn { cursor: pointer; font-size: 18px; }
        .chat-body { height: 300px; overflow-y: auto; padding: 15px; display: flex; flex-direction: column; gap: 10px; background: #f8f9fa; }
        .chat-msg { max-width: 80%; padding: 10px 15px; border-radius: 15px; font-size: 13px; }
        .msg-bot { background: #e9ecef; color: #333; align-self: flex-start; border-bottom-left-radius: 3px; }
        .msg-user { background: #667eea; color: white; align-self: flex-end; border-bottom-right-radius: 3px; }
        .chat-input { display: flex; padding: 10px; border-top: 1px solid #ddd; background: white; }
        .chat-input input { flex: 1; border: 1px solid #ddd; border-radius: 20px; padding: 8px 15px; font-size: 13px; outline: none; }
        .chat-input button { background: #667eea; color: white; border: none; border-radius: 50%; width: 35px; height: 35px; margin-left: 8px; cursor: pointer; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="/"><i class="fas fa-shopping-cart"></i>Shopkart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <span class="welcome-text ml-3">Welcome, ${ username }!</span>
            
            <form action="/" method="get" class="form-inline ml-auto mr-auto">
                <div class="input-group" style="width: 350px;">
                    <input type="text" class="form-control" name="search" placeholder="Search products..." value="${currentSearch}">
                    <div class="input-group-append">
                        <button class="btn" type="submit" style="background: white; color: #667eea;"><i class="fas fa-search"></i></button>
                    </div>
                </div>
                <c:if test="${not empty currentCategoryId}">
                    <input type="hidden" name="categoryId" value="${currentCategoryId}">
                </c:if>
            </form>

            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/cart"><i class="fas fa-shopping-bag mr-1"></i>Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="/myorders"><i class="fas fa-clipboard-list mr-1"></i>My Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="/profileDisplay"><i class="fas fa-user mr-1"></i>Profile</a></li>
                <li class="nav-item"><a class="nav-link" sec:authorize="isAuthenticated()" href="logout"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="hero">
    <div class="container">
        <h1><i class="fas fa-store mr-2"></i>Welcome to Shopkart</h1>
        <p>Discover amazing products at unbeatable prices. Shop from thousands of items!</p>
    </div>
</div>

<main>
    <div class="container-fluid" style="max-width: 1400px;">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-2 col-md-3 mb-4">
                <div class="card" style="border-radius: 12px; border: none; box-shadow: 0 4px 15px rgba(0,0,0,0.05);">
                    <div class="card-header bg-white" style="font-weight: 700; border-bottom: 2px solid #eee;">
                        <i class="fas fa-list mr-1"></i> Categories
                    </div>
                    <div class="list-group list-group-flush" style="max-height: 600px; overflow-y: auto;">
                        <a href="/" class="list-group-item list-group-item-action ${empty currentCategoryId ? 'active' : ''}" style="${empty currentCategoryId ? 'background: #667eea; color: white;' : 'color: #555;'}">All Products</a>
                        <c:forEach var="cat" items="${categories}">
                            <a href="/?categoryId=${cat.id}${not empty currentSearch ? '&search=' += currentSearch : ''}" 
                               class="list-group-item list-group-item-action ${currentCategoryId == cat.id ? 'active' : ''}"
                               style="${currentCategoryId == cat.id ? 'background: #667eea; color: white;' : 'color: #555; font-size: 14px;'}">
                                ${cat.name}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            
            <!-- Products Grid -->
            <div class="col-lg-10 col-md-9">
                <c:if test="${not empty msg}">
                    <div class="alert alert-warning">${msg}</div>
                </c:if>
                <div class="row">
                    <c:forEach var="product" items="${products}">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-product">
                            <div class="card product-card">
                                <img class="card-img-top" src="${product.image}" alt="${product.name}">
                                <div class="card-body">
                                    <span class="category-badge">${product.category.name}</span>
                                    <h5 class="card-title" title="${product.name}">${product.name}</h5>
                                    
                                    <!-- Star Ratings -->
                                    <div class="mb-2" style="color: #ffc107; font-size: 12px;">
                                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                        <c:choose>
                                            <c:when test="${product.id % 2 == 0}"><i class="fas fa-star-half-alt"></i></c:when>
                                            <c:otherwise><i class="fas fa-star"></i></c:otherwise>
                                        </c:choose>
                                        <span style="color: #aaa; margin-left: 5px;">(${(product.id * 7) % 150 + 12})</span>
                                    </div>

                                    <p class="desc">${product.description}</p>
                                    <div class="price mb-2">&#8377;${product.price}</div>
                                    <div class="d-flex justify-content-between mt-auto">
                                        <a href="/products/addtocart?id=${product.id}" class="btn btn-outline-primary btn-cart"><i class="fas fa-cart-plus mr-1"></i>Add</a>
                                        <a href="/checkout" class="btn btn-buynow"><i class="fas fa-bolt mr-1"></i>Buy Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <div class="container">
        <p><i class="fas fa-shopping-cart mr-1"></i> <strong>Shopkart</strong> &copy; 2024. All rights reserved.</p>
    </div>
</footer>

<button id="chatbot-toggler"><i class="fas fa-comment-dots"></i></button>
<div id="chatbot">
    <div class="chat-header">
        <span><i class="fas fa-robot mr-2"></i> Shopkart Support</span>
        <span class="close-btn" id="chatbot-close"><i class="fas fa-times"></i></span>
    </div>
    <div class="chat-body" id="chat-body">
        <div class="chat-msg msg-bot">Hi there! I am the Shopkart virtual assistant. How can I help you today?</div>
    </div>
    <div class="chat-input">
        <input type="text" id="chat-text" placeholder="Type a message..." onkeypress="handleChat(event)">
        <button onclick="sendChat()"><i class="fas fa-paper-plane"></i></button>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
    const chatbot = document.getElementById('chatbot');
    const chatBody = document.getElementById('chat-body');
    const chatText = document.getElementById('chat-text');

    document.getElementById('chatbot-toggler').addEventListener('click', () => {
        chatbot.style.display = chatbot.style.display === 'flex' ? 'none' : 'flex';
    });
    
    document.getElementById('chatbot-close').addEventListener('click', () => {
        chatbot.style.display = 'none';
    });

    function handleChat(e) {
        if (e.key === 'Enter') sendChat();
    }

    function sendChat() {
        const text = chatText.value.trim();
        if (!text) return;
        
        chatBody.innerHTML += '<div class="chat-msg msg-user">' + text + '</div>';
        chatText.value = '';
        chatBody.scrollTop = chatBody.scrollHeight;
        
        setTimeout(() => {
            let msg = text.toLowerCase();
            let reply = "";
            
            if (msg.includes('order') || msg.includes('cart') || msg.includes('buy')) {
                reply = "You can view or place orders by clicking the 'Cart' button at the top!";
            } else if (msg.includes('hello') || msg.includes('hi') || msg.includes('hey')) {
                reply = "Hello! Looking for any specific products today? Feel free to browse our catalog.";
            } else if (msg.includes('admin')) {
                reply = "Admin login is restricted. Please refer to the HR documentation.";
            } else if (msg.includes('shipping') || msg.includes('delivery')) {
                reply = "We offer fast Delivery anywhere! You can select Cash on Delivery at checkout.";
            } else if (msg.includes('price') || msg.includes('cost') || msg.includes('discount')) {
                reply = "All our prices are heavily discounted for this demo! Click 'Buy Now' on any product to see.";
            } else if (msg.includes('payment') || msg.includes('pay') || msg.includes('card')) {
                reply = "Currently, we only accept Cash on Delivery (COD).";
            } else if (msg.includes('thanks') || msg.includes('thank you')) {
                reply = "You're very welcome! Let me know if you need anything else.";
            } else {
                const fallbacks = [
                    "That's a great question! For this demo, please explore our product catalog above.",
                    "I am still learning, but I highly recommend trying out our 'Add to Cart' feature!",
                    "I'm a demo assistant! While I can't answer that directly, feel free to try our Checkout process."
                ];
                reply = fallbacks[Math.floor(Math.random() * fallbacks.length)];
            }
            
            chatBody.innerHTML += '<div class="chat-msg msg-bot">' + reply + '</div>';
            chatBody.scrollTop = chatBody.scrollHeight;
        }, 800);
    }
</script>
</body>
</html>
