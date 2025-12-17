<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body>

<h2>Welcome, <?php echo $_SESSION['user_name']; ?></h2>
<p>You are logged in.</p>

<a href="routes.php">View Routes</a>

<br><br>
<a href="logout.php">Logout</a>


</body>
</html>
