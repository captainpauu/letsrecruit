<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Logout Page</title>
    <link rel="icon" href="/assets/images/Aventri-color-logo.webp">
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <script defer src="/assets/fontawesome/js/solid.js"></script>
    <script defer src="/assets/fontawesome/js/fontawesome.js"></script>
    <link rel="stylesheet" href="/assets/css/logout.css">
</head>
<body>
<div class="container col-md-4 justify-content-md-center">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Thank You!</div>
        <div class="card-body">
            <div class="icon">
                <i class="fas fa-sign-out-alt"></i>
            </div>
            <div class="icon-text">
                You Have Been Successfully Logged Out
            </div>
            <div>
                click here to <a href="{path_for name='login'}">Login</a> Again
            </div>
        </div>
    </div>
</div>
</body>
</html>