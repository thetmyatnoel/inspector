<!DOCTYPE html>
<html lang="en">

<#include "/common/head.ftl">
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo mr-5" href="/report"><img src="images/logo-text.png" class="mr-2" alt="logo"/></a>
            <a class="navbar-brand brand-logo-mini" href="/report"><img src="images/logo.png" alt="logo"/></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <span class="icon-menu"></span>
            </button>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="icon-menu"></span>
            </button>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown show">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown" aria-expanded="true">
                        <img src="/images/user.png" alt="profile">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="/login"><i class="ti-power-off text-primary"></i>Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <#include "/common/sidebar.ftl">
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 grid-margin">
                        <div class="row">
                            <div class="col-12 col-xl-8 mb-2 mb-xl-0">
                                <h3 class="font-weight-bold">총합 보고서</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">

                                <!-- Search Box -->
                                <div class="search-box rounded">
                                    <input type="search" class="form-control rounded" id="searchInput" placeholder="Search reports..." aria-label="Search" aria-describedby="search-addon" >

                                </div>

                                <!-- Cards List -->
                                <div class="cards-list">
                                    <div class="col-md-12 p-1 rounded card-item" data-label="Example Title 1">
                                        <div class="col-md-12 stretch-card transparent">
                                            <div class="card card-outline-primary">
                                                <div class="card-body">
                                                    <p class="card-title"><i class="ti-files p-2"></i> 1</p>
                                                    <p>Details for Card 1</p>
                                                </div>
                                                <div class="card-footer text-right">2023-11-22</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 p-1 card-item" data-label="Example Title 2">
                                        <div class="col-md-12 stretch-card transparent">
                                            <div class="card card-outline-primary">
                                                <div class="card-body">
                                                    <p class="card-title"><i class="ti-files p-2"></i> Example Title 2</p>
                                                    <p>Details for Card 2</p>
                                                </div>
                                                <div class="card-footer text-right">2023-11-23</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Additional card items can be added here -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <#include "/common/footer.ftl">
            </div>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<#include "/common/js.ftl">
<script src="/page/report.js"></script>
<!-- endinject -->
</body>

</html>
