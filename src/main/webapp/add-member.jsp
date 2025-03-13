<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Member</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9; /* Calm, light background */
            font-family: 'Roboto', sans-serif; /* Clean and modern font */
            color: #333333; /* High contrast for readability */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            max-width: 480px;
            width: 100%;
            padding: 25px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
            border: 1px solid #e0e0e0; /* Subtle border */
        }
        .form-container h2 {
            font-size: 24px;
            font-weight: 500;
            margin-bottom: 20px;
            text-align: center;
            color: #444444; /* Subtle text color */
        }
        .form-container .form-control {
            margin-bottom: 15px;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #cccccc; /* Clean, neutral border */
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-container .form-control:focus {
            border-color: #007bff; /* Highlighted border on focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Subtle blue glow */
        }
        .btn-submit {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #007bff; /* Professional blue button */
            color: #ffffff;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-submit:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        label {
            font-size: 14px;
            font-weight: 500;
            color: #666666;
            margin-bottom: 5px;
            display: block;
        }
    </style>


</head>
<body>
<div class="form-container">
    <h2><i class="fas fa-user-plus me-2"></i>Add Member</h2>
    <form action="add-member" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="dateOfBirth" class="form-label">Date of Birth</label>
            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="mb-3">
            <label for="sport" class="form-label">Sport</label>
            <input type="text" class="form-control" id="sport" name="sport" required>
        </div>
        <button type="submit" class="btn btn-submit">Add Member</button>
    </form>
</div>
</body>
</html>