<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Login Page</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/assets/css/login.css">
</head>
<body>
<div class="container col-md-4 justify-content-md-center">
    <form action="{path_for name='login'}" method="post">
        <label class="text-danger">{$errorMsg}</label>
        <div class="form-group">
            <label>User Name</label>
            <input class="form-control" type="text" name="username" placeholder="Enter your username"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input class="form-control" type="password" name="password" placeholder="Enter your password"/>
        </div>
        <div class="form-group">
            <input class="form-control" type="checkbox"/>
            <span>Remember me</span>
        </div>
        <div class="form-group">
            <input class="btn btn-primary col-md-12" type="submit" value="Login"/>
        </div>
        <div class="form-group" id="forget_pass">
            <span>forgot passwod? <a href="">click here</a></span>
        </div>
    </form>
</div>
</body>
</html>