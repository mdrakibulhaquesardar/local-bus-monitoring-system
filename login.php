<?php
include "db.php";
session_start();

if (isset($_POST['login'])) {

    $email = $_POST['email'];
    $password = $_POST['password'];

    // IMPORTANT: user is a reserved keyword
    $query = "SELECT * FROM `user` WHERE email='$email'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) == 1) {

        $row = mysqli_fetch_assoc($result);

        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['user_name'] = $row['name'];

            echo "<p style='color:green;'>Login successful! Welcome, ".$row['name']."</p>";
        } else {
            echo "<p style='color:red;'>Incorrect password</p>";
        }

    } else {
        echo "<p style='color:red;'>User not found</p>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
</head>
<body>

<h2>User Login</h2>

<form method="POST">
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>

    <button type="submit" name="login">Login</button>
</form>

</body>
</html>
