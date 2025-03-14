<%@ page import="com.dao.MembersDao" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.dao.MembersDao" %>
<%@ page import="com.dao.TrainersDao" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }
    .sidebar {
      height: 100vh;
      width: 250px;
      position: fixed;
      top: 0;
      left: 0;
      background-color: #343a40;
      padding: 20px;
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }
    .sidebar .logo {
      color: #fff;
      font-size: 24px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 30px;
    }
    .sidebar .nav-link {
      color: #adb5bd;
      padding: 10px 15px;
      border-radius: 5px;
      margin-bottom: 10px;
      transition: all 0.3s ease;
    }
    .sidebar .nav-link:hover {
      background-color: #495057;
      color: #fff;
    }
    .sidebar .nav-link.active {
      background-color: #0d6efd;
      color: #fff;
    }
    .main-content {
      margin-left: 250px;
      padding: 20px;
    }
    .header {
      background-color: #fff;
      padding: 15px 20px;
      border-bottom: 1px solid #e9ecef;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .header .welcome {
      font-size: 18px;
      color: #343a40;
    }
    .header .logout-btn {
      background-color: #dc3545;
      color: #fff;
      border: none;
      padding: 8px 15px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    .header .logout-btn:hover {
      background-color: #c82333;
    }
    .card {
      border: none;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }
    .card .card-header {
      background-color: #fff;
      border-bottom: 1px solid #e9ecef;
      padding: 15px 20px;
      font-size: 18px;
      font-weight: bold;
    }
    .card .card-body {
      padding: 20px;
    }
    .btn-primary {
      background-color: #0d6efd;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    .btn-primary:hover {
      background-color: #0b5ed7;
    }
  </style>
</head>
<body>
<div class="sidebar">
  <div class="logo">SportFlow</div>
  <nav class="nav flex-column">
    <a class="nav-link active" href="#">
      <i class="fas fa-tachometer-alt me-2"></i>Dashboard
    </a>
    <a class="nav-link" href="add-member.jsp">
      <i class="fas fa-user-plus me-2"></i>Add session
    </a>


  </nav>
</div>

<div class="main-content">
  <div class="header">
    <div class="welcome">
      Welcome, <%= session.getAttribute("admin") != null ? ((com.model.Admin) session.getAttribute("admin")).getName() : "Admin" %>!
    </div>
    <a href="logout" class="logout-btn">
      <i class="fas fa-sign-out-alt me-2"></i>Logout
    </a>
  </div>

  <div class="row">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          <i class="fas fa-users me-2"></i>Members Overview
        </div>
        <div class="card-body">
          <p>Total Members:<%= totalMembers %></p>
          <p>New Members (This Month): <%= newMembers %></p>
          <a href="list-members.jsp" class="btn btn-primary">
            <i class="fas fa-list me-2"></i>View Members
          </a>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          <i class="fas fa-chalkboard-teacher me-2"></i>Trainers Overview
        </div>
        <div class="card-body">
          <p>Total Trainers: 15</p>
          <p>Available Trainers: 10</p>
          <a href="list-trainers.jsp" class="btn btn-primary">
            <i class="fas fa-list me-2"></i>View Trainers
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>