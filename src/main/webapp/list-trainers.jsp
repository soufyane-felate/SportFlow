<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Trainers" %>
<%@ page import="com.dao.TrainersDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Members - SportFlow</title>
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
            margin-bottom: 20px;
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
            text-decoration: none;
        }
        .header .logout-btn:hover {
            background-color: #c82333;
            text-decoration: none;
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
        .table {
            width: 100%;
            margin-bottom: 0;
        }
        .table th {
            background-color: #f8f9fa;
            border-top: none;
        }
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            line-height: 1.5;
            border-radius: 0.2rem;
        }
        .btn-edit {
            background-color: #ffc107;
            color: #212529;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
        }
        .search-box {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%
    // Check if admin is logged in
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login");
        return;
    }
    // Get all trainers
    TrainersDao trainersDao = new TrainersDao();
    List<Trainers> trainers = trainersDao.getAllTrainers();

%>

<div class="sidebar">
    <div class="logo">SportFlow</div>
    <nav class="nav flex-column">
        <a class="nav-link" href="dashboard">
            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
        </a>
        <a class="nav-link" href="add-member.jsp">
            <i class="fas fa-user-plus me-2"></i>Add Member
        </a>
        <a class="nav-link" href="add-trainer.jsp">
            <i class="fas fa-chalkboard-teacher me-2"></i>Add Trainer
        </a>
        <a class="nav-link active" href="list-members.jsp">
            <i class="fas fa-users me-2"></i>List Members
        </a>
        <a class="nav-link" href="list-trainers.jsp">
            <i class="fas fa-list me-2"></i>List Trainers
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

    <div class="card">
        <div class="card-header">
            <i class="fas fa-users me-2"></i>Trainers List
        </div>
        <div class="card-body">
            <div class="row search-box">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" class="form-control" id="searchInput" placeholder="Search by name...">
                        <button class="btn btn-primary" type="button">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
                <div class="col-md-6 text-end">
                    <a href="add-trainer.jsp" class="btn btn-success">
                        <i class="fas fa-user-plus me-2"></i>Add New Trainer
                    </a>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Speciality</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Trainers trainer : trainers) { %>
                    <tr>
                        <td><%= trainer.getId() %></td>
                        <td><%= trainer.getName() %></td>

                        <td><%=trainer.getSpeciality()%></td>
                        <td>
                            <a href="edit-trainer.jsp?id=<%= trainer.getId() %>" class="btn btn-sm btn-warning me-2">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="delete-member?id=<%= trainer.getId() %>" class="btn btn-sm btn-danger"
                               onclick="return confirm('Are you sure you want to delete this member?')">
                                <i class="fas fa-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            <% if (trainers.isEmpty()) { %>
            <div class="alert alert-info mt-3">No trainers found.</div>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    //  search
    document.getElementById('searchInput').addEventListener('keyup', function() {
        const searchText = this.value.toLowerCase();
        const rows = document.querySelectorAll('tbody tr');

        rows.forEach(row => {
            const name = row.getElementsByTagName('td')[1].textContent.toLowerCase();
            if (name.includes(searchText)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>