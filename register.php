<?php
include "db.php";

if (isset($_POST['register'])) {

    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // IMPORTANT: user is a reserved keyword, so we use backticks
    $query = "INSERT INTO `user` (name, email, phone_number, password)
              VALUES ('$name', '$email', '$phone', '$password')";

    if (mysqli_query($conn, $query)) {
        echo "<p style='color:green;'>Registration successful!</p>";
    } else {
        echo "<p style='color:red;'>Error: " . mysqli_error($conn) . "</p>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
</head>
<body>

<h2>User Registration</h2>

<form method="POST">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Phone: <input type="text" name="phone"><br><br>
    Password: <input type="password" name="password" required><br><br>

    <button type="submit" name="register">Register</button>
</form>

</body>
</html>
