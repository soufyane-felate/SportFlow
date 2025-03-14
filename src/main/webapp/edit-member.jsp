<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.dao.MembersDao" %>
<%@ page import="com.model.Member" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Member - SportFlow</title>
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
        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }
    </style>
</head>
<body>
<%
    // Check if admin is logged in
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("loginAdmin.jsp");
        return;
    }

    // Get member ID from request
    String idParam = request.getParameter("id");
    int memberId = 0;
    Member member = null;

    if (idParam != null && !idParam.isEmpty()) {
        try {
            memberId = Integer.parseInt(idParam);

            // Get member data
            MembersDao membersDao = new MembersDao();
            member = membersDao.getMemberById(memberId);

            if (member == null) {
                response.sendRedirect("list-members.jsp?error=Member not found");
                return;
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("list-members.jsp?error=Invalid member ID");
            return;
        } catch (Exception e) {
            response.sendRedirect("list-members.jsp?error=Error: " + e.getMessage());
            return;
        }
    } else {
        response.sendRedirect("list-members.jsp?error=No member ID provided");
        return;
    }

    // Format date for the form
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = "";
    if (member.getDateOfBirth() != null) {
        formattedDate = dateFormat.format(member.getDateOfBirth());
    }
%>

<div class="sidebar">
    <div class="logo">SportFlow</div>
    <nav class="nav flex-column">
        <a class="nav-link" href="dashboard.jsp">
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
            <i class="fas fa-user-edit me-2"></i>Edit Member
        </div>
        <div class="card-body">
            <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getParameter("error") %>
            </div>
            <% } %>

            <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success">
                <%= request.getParameter("success") %>
            </div>
            <% } %>

            <form action="update-member" method="post">
                <input type="hidden" name="memberId" value="<%= member.getId() %>">

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name"
                           value="<%= member.getName() %>" required>
                </div>

                <div class="mb-3">
                    <label for="dateOfBirth" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"
                           value="<%= formattedDate %>" required>
                </div>

                <div class="mb-3">
                    <label for="sport" class="form-label">Sport</label>
                    <input type="text" class="form-control" id="sport" name="sport"
                           value="<%= member.getSport() %>" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">New Password (leave empty to keep current)</label>
                    <input type="password" class="form-control" id="password" name="password">
                    <small class="text-muted">Leave blank if you don't want to change the password</small>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="list-members.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left me-2"></i>Back to List
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Save Changes
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>