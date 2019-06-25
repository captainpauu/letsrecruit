{extends 'index.tpl'}

{block name=head}
    <script src="/assets/ChartJs/Chart.js"></script>
{/block}

{block name=content}
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card prod-p-card bg-primary">
                    <div id="total-candidate" class="card-body">
                        <div class="row align-items-center text-white">
                            <div class="col">
                                <h6>Total Candidates</h6>
                                <h3>366</h3>
                            </div>
                            <div class="col-auto">
                                <h2><i class="fas fa-database"></i></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card prod-p-card bg-success">
                    <div id="total-offered" class="card-body">
                        <div class="row align-items-center text-white">
                            <div class="col">
                                <h6>Total Job Offered</h6>
                                <h3>100</h3>
                            </div>
                            <div class="col-auto">
                                <h2><i class="fas fa-thumbs-up"></i></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card prod-p-card bg-danger">
                    <div id="total-rejected" class="card-body">
                        <div class="row align-items-center text-white">
                            <div class="col">
                                <h6>Total Rejected</h6>
                                <h3>183</h3>
                            </div>
                            <div class="col-auto">
                                <h2><i class="fas fa-thumbs-down"></i></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card prod-p-card bg-warning">
                    <div id="total-hold" class="card-body">
                        <div class="row align-items-center text-white">
                            <div class="col">
                                <h6>Total On Hold</h6>
                                <h3>83</h3>
                            </div>
                            <div class="col-auto">
                                <h2><i class="fas fa-hand-paper"></i></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card social-res-card">
                    <div class="card-header">
                        <h5>Facebook Source</h5>
                    </div>
                    <div class="card-body">
                        <p class="m-b-10">Page Profile</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:25%"></div>
                        </div>
                        <p class="m-b-10">Favorite</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:85%"></div>
                        </div>
                        <p class="m-b-10">Like Story</p>
                        <div class="progress">
                            <div class="progress-bar bg-facebook" style="width:65%"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card social-res-card">
                    <div class="card-header">
                        <h5>Facebook Source</h5>
                    </div>
                    <div class="card-body">
                        <p class="m-b-10">Page Profile</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:25%"></div>
                        </div>
                        <p class="m-b-10">Favorite</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:85%"></div>
                        </div>
                        <p class="m-b-10">Like Story</p>
                        <div class="progress">
                            <div class="progress-bar bg-facebook" style="width:65%"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card social-res-card">
                    <div class="card-header">
                        <h5>Facebook Source</h5>
                    </div>
                    <div class="card-body">
                        <p class="m-b-10">Page Profile</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:25%"></div>
                        </div>
                        <p class="m-b-10">Favorite</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:85%"></div>
                        </div>
                        <p class="m-b-10">Like Story</p>
                        <div class="progress">
                            <div class="progress-bar bg-facebook" style="width:65%"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card social-res-card">
                    <div class="card-header">
                        <h5>Facebook Source</h5>
                    </div>
                    <div class="card-body">
                        <p class="m-b-10">Page Profile</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:25%"></div>
                        </div>
                        <p class="m-b-10">Favorite</p>
                        <div class="progress m-b-30">
                            <div class="progress-bar bg-facebook" style="width:85%"></div>
                        </div>
                        <p class="m-b-10">Like Story</p>
                        <div class="progress">
                            <div class="progress-bar bg-facebook" style="width:65%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

        </div>
    </div>
    <div style="width: 600px; margin-top: 200px;">
        <canvas id="myChart"></canvas>
        <script>
            var ctx = $('#myChart');
            var myChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                        label: 'Votes',
                        data: [12, 19, 3, 5, 2, 3],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                }
            });
        </script>
    </div>
{/block}