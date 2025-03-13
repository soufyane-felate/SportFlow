<%@ page import="com.model.Role" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Sport Flow</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<div class="container my-5">
    <div class="text-center mb-4">
        <h1 class="display-4">Welcome to Sport Flow</h1>
        <p class="lead text-muted">Choose your role below to get started</p>
    </div>
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-primary text-white text-center py-4">
                    <h4 class="mb-0"><i class="fas fa-user-shield me-2"></i>Admin</h4>
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Manage users, tasks, and all administrative activities seamlessly.</p>
                    <form>
                        <a href="loginAdmin.jsp" class="btn btn-primary w-100" aria-label="Select Admin">
                            <i class="fas fa-check-circle me-2"></i>Select Admin
                        </a>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-success text-white text-center py-4">
                    <h4 class="mb-0"><i class="fas fa-users me-2"></i>Member</h4>
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Engage in activities and make the most of the platform features.</p>
                    <form>
                        <a href="loginMember.jsp" class="btn btn-primary w-100" aria-label="Select Admin">
                            <i class="fas fa-check-circle me-2"></i>Select Member
                        </a>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-warning text-dark text-center py-4">
                    <h4 class="mb-0"><i class="fas fa-dumbbell me-2"></i>Trainer</h4>
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Organize training sessions and guide members with expertise.</p>
                    <form>

                        <a href="loginTrainer.jsp" class="btn btn-primary w-100" aria-label="Select Admin">
                            <i class="fas fa-check-circle me-2"></i>Select Trainer
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
