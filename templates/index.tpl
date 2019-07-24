<!DOCTYPE html>
<html lang="en">
<head>
    {include 'header.tpl'}
    {block name=head}{/block}
</head>
<body>
<div class="wrapper">
    <input type="hidden" id="{$smarty.session.csrf_name}" name="{$smarty.session.csrf_name}" value="{$smarty.session.csrf_token}">

    <!-- Side Navbar -->
    {include 'navbars/side-navbar.tpl'}

    <!-- Page Content -->
    <div id="content">
        <!-- Top Navbar -->
        {include 'navbars/top-navbar.tpl'}

        {block name=content}{/block}

    </div>
</div>
</body>
</html>