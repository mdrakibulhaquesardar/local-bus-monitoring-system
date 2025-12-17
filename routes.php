<?php
include "db.php";
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Handle favourite action
if (isset($_GET['fav'])) {
    $route_id = $_GET['fav'];
    $user_id = $_SESSION['user_id'];

    $check = "SELECT * FROM user_favourite_route 
              WHERE user_id=$user_id AND route_id=$route_id";
    $res = mysqli_query($conn, $check);

    if (mysqli_num_rows($res) == 0) {
        $insert = "INSERT INTO user_favourite_route (user_id, route_id)
                   VALUES ($user_id, $route_id)";
        mysqli_query($conn, $insert);
    }
}

$query = "SELECT * FROM route";
$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Available Routes</title>
</head>
<body>

<h2>Available Bus Routes</h2>

<ul>
<?php while ($row = mysqli_fetch_assoc($result)) { ?>
    <li>
        <?php echo $row['route_name']; ?>
        <a href="routes.php?fav=<?php echo $row['route_id']; ?>">
            [Add to Favourite]
        </a>
    </li>
<?php } ?>
</ul>

<br>
<a href="dashboard.php">Back to Dashboard</a>

</body>
</html>
