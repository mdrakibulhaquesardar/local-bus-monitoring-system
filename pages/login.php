<?php
session_start();
include __DIR__ . "/../includes/db.php";

$message = "";
$messageClass = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login'])) {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    $query = "SELECT * FROM `user` WHERE email='$email'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);

        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['user_name'] = $row['name'];

            $message = "Login successful! Welcome, " . htmlspecialchars($row['name']);
            $messageClass = "alert-success";

            header("Location: /bus/pages/dashboard.php");
            exit();
        } else {
            $message = "Incorrect password";
            $messageClass = "alert-error";
        }
    } else {
        $message = "User not found";
        $messageClass = "alert-error";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="/bus/assets/css/style.css">
</head>
<body class="auth-body">
    <section class="auth-page">
        <div class="auth-layout-card">
            <div class="auth-visual">
                <div class="auth-visual-overlay">
                    <div class="auth-brand">
                        <span class="auth-logo-circle"></span>
                        <span class="auth-brand-name">Local Bus Monitoring</span>
                    </div>
                    <div class="auth-quote">
                        <p class="auth-quote-text">
                            “Simply all the tools that my team and I need.”
                        </p>
                        <p class="auth-quote-meta">
                            Project by <span>Nahin</span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="auth-panel">
                <div class="auth-panel-inner">
                    <div class="auth-heading">
                        <h2>Welcome Back</h2>
                        <p>Sign in with your email and password to continue.</p>
                    </div>

                    <?php if (!empty($message)) : ?>
                        <div class="<?php echo $messageClass; ?>">
                            <?php echo htmlspecialchars($message); ?>
                        </div>
                    <?php endif; ?>

                    <form method="POST" class="auth-form">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input
                                type="email"
                                id="email"
                                name="email"
                                class="form-control"
                                placeholder="you@example.com"
                                required
                            >
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input
                                type="password"
                                id="password"
                                name="password"
                                class="form-control"
                                placeholder="Enter your password"
                                required
                            >
                        </div>

                        <div class="auth-row">
                            <label class="switch-label">
                                <span>Remember me</span>
                                <span class="switch">
                                    <span class="switch-handle"></span>
                                </span>
                            </label>
                            <a href="#" class="link-small">Forgot password?</a>
                        </div>

                        <button type="submit" name="login" class="btn-primary">
                            Log In
                        </button>
                    </form>

                    <div class="auth-meta">
                        <span>Don’t have an account?</span>
                        <a href="/bus/pages/register.php">Sign up</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>


