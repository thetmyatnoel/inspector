<!DOCTYPE html>
<html lang="en">

<#include "/common/head.ftl">
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="/index"><img src="images/logo-text.png" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="/index"><img src="images/logo.png" alt="logo"/></a>
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
              <#if username?? && username != "">
                ${username}
              <#else>
                User
              </#if>
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
                  <h3 class="font-weight-bold">점검리스트</h3>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <nav>
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                      <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-ing" role="tab" aria-controls="nav-ing" aria-selected="true">진행중 <label class="badge badge-danger" id="ingCountLabel">0</label></a>
                      <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-wait" role="tab" aria-controls="nav-wait" aria-selected="false">대기 <label class="badge badge-warning" id="waitCountLabel">0</label></a>
                      <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-end" role="tab" aria-controls="nav-end" aria-selected="false">완료 <label class="badge badge-success" id="endCountLabel">0</label></a>
                    </div>
                  </nav>
                  <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-ing" role="tabpanel" aria-labelledby="nav-ing-tab">
                      <div class="col-md-12 p-1 ingListDiv" data-toggle="modal" data-target="#progressModal">
                        <div class="col-md-12 stretch-card transparent" >
                        </div>
                      </div>
                    </div>

                    <div class="tab-pane fade" id="nav-wait" role="tabpanel" aria-labelledby="nav-wait-tab">
                      <#list aparts as apart>
                      <div class="col-md-12 p-1 waitListDiv" data-toggle="modal" data-target="#addModal"
                           data-apart-name="${apart.apartName}"
                           data-address="${apart.address}"
                           data-area="${apart.area}"
                           data-customer-name="${apart.customer_name}"
                           data-cus-phone="${apart.cus_phone}"
                           data-username="${username}">

                        <div class="col-md-12 stretch-card transparent"  id="card${apart.id}">
                          <div class="card card-outline-primary ">
                            <div class="card-body">
                              <div class="d-flex justify-content-between">
                                <p class="card-title" ><i class="ti-arrow-right"></i> ${apart.apartName}</p>
                              </div>
                              <p>${apart.address}</p>
                              <p>${apart.area}</p>

                            </div>
                           <div class="card-footer text-right">${apart.inspection_date}</div>
                          </div>
                        </div>

                      </div>
                      </#list>
                    </div>

                    <div class="tab-pane fade" id="nav-end" role="tabpanel" aria-labelledby="nav-end-tab">
                      <div class="col-md-12 p-1 endListDiv" data-toggle="modal" data-target="#endModal">
                        <div class="col-md-12 stretch-card transparent">
                          <div class="card card-outline-primary">
                            <div class="card-body">
                              <div class="d-flex justify-content-between">
                                <p class="card-title"><i class="ti-arrow-right"></i> Example Lable end</p>
                              </div>
                              <p>Sub 1</p>
                              <p>Sub 2</p>
                            </div>
                            <div class="card-footer text-right">2023-11-22</div>
                          </div>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
          <#include "/common/addModal.ftl">
          <#include "/common/progressModal.ftl">
          <#include "/common/endModal.ftl">
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <#include "/common/footer.ftl">
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <#include "/common/js.ftl">
  <script src="/page/index.js">
  </script>
  <!-- endinject -->
</body>

</html>

