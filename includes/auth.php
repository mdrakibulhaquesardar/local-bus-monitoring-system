<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

function require_login(): void
{
    if (empty($_SESSION['user_id'])) {
        header("Location: /bus/pages/login.php");
        exit();
    }
}

function redirect_if_logged_in(): void
{
    if (!empty($_SESSION['user_id'])) {
        header("Location: /bus/pages/dashboard.php");
        exit();
    }
}


