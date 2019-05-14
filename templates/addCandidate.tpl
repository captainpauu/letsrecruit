<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    {include 'header.tpl'}

    <title>Candidate Registration Form</title>
    <link rel="stylesheet" href="/assets/css/addCandidate.css">
</head>

<body>
<div class="wrapper">

    <!-- Side Navbar -->
    {include 'side-navbar.tpl'}

    <!-- Page Content -->
    <div id="content">
        <!-- Top Navbar -->
        {include 'top-navbar.tpl'}

        <div class="container-fluid">
            <div class="main-header">
                <h3>Candidate Registration Form</h3>
            </div>
            <div class="main-content">
                <form>
                    <div class="row col-md-12">
                        <div class="col-md-4">
                            <h5>1. Personal detailes</h5>
                        </div>
                        <div class="col-md-8">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputFname">First Name</label>
                                    <input type="text" class="form-control" id="inputFname" placeholder="First Name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputLname">Last Name</label>
                                    <input type="text" class="form-control" id="inputLname" placeholder="Last Name">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail">Email</label>
                                    <input type="email" class="form-control" id="inputEmail" placeholder="email@id.com">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputMobile">Mobile Number</label>
                                    <input type="text" class="form-control" id="inputMobile" placeholder="9876543210">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Address</label>
                                <input type="text" class="form-control" id="inputAddress"
                                       placeholder="Apartment, studio, or floor">
                            </div>
                            <div class="form-group">
                                <label for="inputAddress2">Address 2</label>
                                <input type="text" class="form-control" id="inputAddress2" placeholder="1234 Main St">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">City</label>
                                    <input type="text" class="form-control" id="inputCity">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputState">State</label>
                                    <select id="inputState" class="form-control">
                                        <option selected>Choose...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="inputZip">Zip</label>
                                    <input type="text" class="form-control" id="inputZip">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="formDivider"></div>
                    <div class="row col-md-12">
                        <div class="col-md-4">
                            <h5>2. Work detailes</h5>
                        </div>
                        <div class="col-md-8">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Email</label>
                                    <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Password</label>
                                    <input type="password" class="form-control" id="inputPassword4"
                                           placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Address</label>
                                <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                            </div>
                            <div class="form-group">
                                <label for="inputAddress2">Address 2</label>
                                <input type="text" class="form-control" id="inputAddress2"
                                       placeholder="Apartment, studio, or floor">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">City</label>
                                    <input type="text" class="form-control" id="inputCity">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputState">State</label>
                                    <select id="inputState" class="form-control">
                                        <option selected>Choose...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="inputZip">Zip</label>
                                    <input type="text" class="form-control" id="inputZip">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="formDivider"></div>
                    <div class="row col-md-12">
                        <div class="col-md-4">
                            <h5>3. Upload Documents</h5>
                        </div>
                        <div class="col-md-8">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Resume</label>
                                    <input type="file" class="form-control" id="inputResume" placeholder="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Photo</label>
                                    <input type="file" class="form-control" id="inputPhoto" placeholder="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="formDivider"></div>
                    <div class="row col-md-12 justify-content-end">
                        <div class="col-md-4">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                    <button type="reset" class="btn btn-outline-primary">cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
</body>

</html>