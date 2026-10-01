<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<title>Shopkart Admin Dashboard</title>
<style>
    * { font-family: 'Poppins', sans-serif; }
    body { background: #0f0f1a; min-height: 100vh; }
    .navbar { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%) !important;
              box-shadow: 0 4px 20px rgba(0,0,0,0.4); }
    .navbar-brand { font-weight: 700; font-size: 22px; color: #e94560 !important; }
    .nav-link { color: rgba(255,255,255,0.8) !important; font-weight: 500; }
    .nav-link:hover { color: #e94560 !important; }
    .dashboard-hero { background: linear-gradient(135deg, #1a1a2e 0%, #0f3460 100%);
                      padding: 50px 0 40px; text-align: center; color: #fff;
                      border-bottom: 3px solid #e94560; }
    .dashboard-hero h1 { font-weight: 700; font-size: 2.2rem; }
    .dashboard-hero p { opacity: 0.7; font-size: 1rem; }
    .admin-card { background: #1e1e2f; border: none; border-radius: 16px;
                  box-shadow: 0 8px 30px rgba(0,0,0,0.3); transition: transform 0.3s, box-shadow 0.3s;
                  overflow: hidden; height: 100%; }
    .admin-card:hover { transform: translateY(-10px); box-shadow: 0 15px 40px rgba(0,0,0,0.5); }
    .card-icon { font-size: 50px; margin-bottom: 15px; }
    .card-categories .card-icon { color: #667eea; }
    .card-products .card-icon { color: #e94560; }
    .card-customers .card-icon { color: #38ef7d; }
    .admin-card .card-body { text-align: center; padding: 35px 25px; }
    .admin-card .card-title { color: #fff; font-weight: 700; font-size: 20px; }
    .admin-card .card-text { color: #888; font-size: 14px; margin-bottom: 20px; }
    .btn-manage-cat { background: linear-gradient(135deg, #667eea, #764ba2); border: none;
                      border-radius: 10px; padding: 10px 30px; font-weight: 600; color: #fff; }
    .btn-manage-prod { background: linear-gradient(135deg, #e94560, #c23152); border: none;
                       border-radius: 10px; padding: 10px 30px; font-weight: 600; color: #fff; }
    .btn-manage-cust { background: linear-gradient(135deg, #11998e, #38ef7d); border: none;
                       border-radius: 10px; padding: 10px 30px; font-weight: 600; color: #fff; }
    .btn-manage-cat:hover, .btn-manage-prod:hover, .btn-manage-cust:hover {
        transform: translateY(-2px); color: #fff; box-shadow: 0 5px 20px rgba(0,0,0,0.3); }
    .stats-section { padding: 40px 0; }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fas fa-shield-alt mr-2"></i>Shopkart Admin</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto"></ul>
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="/admin/"><i class="fas fa-home mr-1"></i>Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/logout"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="dashboard-hero">
        <h1><i class="fas fa-tachometer-alt mr-2"></i>Admin Dashboard</h1>
        <p>Manage your store from one place</p>
    </div>

    <div class="container stats-section">
        <div class="row justify-content-center">
            <div class="col-md-3 mb-4">
                <div class="card admin-card card-categories">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-tags"></i></div>
                        <h4 class="card-title">Categories</h4>
                        <p class="card-text">Organize products into categories for easy browsing.</p>
                        <a href="/admin/categories" class="btn btn-manage-cat">Manage <i class="fas fa-arrow-right ml-1"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card admin-card card-products">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-box-open"></i></div>
                        <h4 class="card-title">Products</h4>
                        <p class="card-text">Add, update, and manage all your product listings.</p>
                        <a href="/admin/products" class="btn btn-manage-prod">Manage <i class="fas fa-arrow-right ml-1"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card admin-card card-customers">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-users"></i></div>
                        <h4 class="card-title">Customers</h4>
                        <p class="card-text">View and manage your registered customer base.</p>
                        <a href="/admin/customers" class="btn btn-manage-cust">Manage <i class="fas fa-arrow-right ml-1"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card admin-card" style="border-top: 4px solid #f39c12;">
                    <div class="card-body">
                        <div class="card-icon" style="color: #f39c12;"><i class="fas fa-user-shield"></i></div>
                        <h4 class="card-title">Admins</h4>
                        <p class="card-text">Add a new administrator to the Shopkart team.</p>
                        <button class="btn btn-manage-cat" style="background: linear-gradient(135deg, #f39c12, #d35400);" data-toggle="modal" data-target="#addAdminModal">Add Admin <i class="fas fa-plus ml-1"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Admin Modal -->
        <div class="modal fade" id="addAdminModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="background: #1e1e2f; color: #fff;">
                    <div class="modal-header" style="border-bottom: 1px solid #333;">
                        <h5 class="modal-title"><i class="fas fa-user-shield mr-2 text-warning"></i>Add New Administrator</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/admin/add-admin" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" name="username" class="form-control" style="background: #2a2a3d; color: #fff; border: 1px solid #444;" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control" style="background: #2a2a3d; color: #fff; border: 1px solid #444;" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="password" class="form-control" style="background: #2a2a3d; color: #fff; border: 1px solid #444;" required>
                            </div>
                        </div>
                        <div class="modal-footer" style="border-top: 1px solid #333;">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-warning">Create Admin</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mt-5">
            <div class="col-md-12">
                <div class="card admin-card" style="padding: 20px; text-align: left;">
                    <h4 style="color: #fff; margin-bottom: 20px;"><i class="fas fa-chart-line mr-2" style="color: #667eea;"></i> Revenue & Sales Analytics (Last 7 Days)</h4>
                    <canvas id="salesChart" height="100"></canvas>
                </div>
            </div>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('salesChart').getContext('2d');
    
    const gradient = ctx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, 'rgba(102, 126, 234, 0.5)');
    gradient.addColorStop(1, 'rgba(102, 126, 234, 0.05)');

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
            datasets: [{
                label: 'Revenue (₹)',
                data: [12500, 19200, 15000, 22400, 18000, 35000, 42000],
                borderColor: '#667eea',
                backgroundColor: gradient,
                borderWidth: 3,
                pointBackgroundColor: '#e94560',
                pointRadius: 5,
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { labels: { color: '#ccc' } }
            },
            scales: {
                y: { grid: { color: 'rgba(255,255,255,0.1)' }, ticks: { color: '#aaa' } },
                x: { grid: { color: 'rgba(255,255,255,0.1)' }, ticks: { color: '#aaa' } }
            }
        }
    });
</script>
</body>
</html>