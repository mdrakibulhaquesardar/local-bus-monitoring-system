<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!function_exists('require_admin_login')) {
    function require_admin_login(): void
    {
        if (empty($_SESSION['admin_id'])) {
            header("Location: /bus/admin/login.php");
            exit();
        }
    }
}

if (!function_exists('redirect_if_admin_logged_in')) {
    function redirect_if_admin_logged_in(): void
    {
        if (!empty($_SESSION['admin_id'])) {
            header("Location: /bus/admin/dashboard.php");
            exit();
        }
    }
}

