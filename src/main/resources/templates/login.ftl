<!DOCTYPE html>
<html lang="en">

<#include "/common/head.ftl">

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo text-center">
                <img src="images/logo.png" alt="logo" class="align-top">
                <label class="fs-40">INSPECTOR</label>
                <h6 class="font-weight-light">User Login</h6>
              </div>
              <form class="pt-3">
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="username" placeholder="Username">
                  <label class="text-danger d-none" id="usernameAlertLabel"><i class="ti-alert"></i>Please enter your username..</label>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="passsword" placeholder="Password">
                  <label class="text-danger d-none" id="passwordAlertLabel"><i class="ti-alert"></i>Please enter your passsword..</label>
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="#" id="signInBtn"><i class="icon-check mr-1"></i> SIGN IN</a>
                </div>

                <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="/register" class="text-primary">Create</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <#include "/common/js.ftl">
  <script>
    $("#signInBtn").click(function (){
      let getUsername = $("#username").val();
      let getPasssword = $("#passsword").val();

      let status = true;
      if(isStringNullOrEmpty(getUsername)){
        status = false;
        $("#username").addClass('border-danger');
        $("#usernameAlertLabel").removeClass('d-none').addClass('d-inline');
      }else{
        status = true;
        $("#username").removeClass('border-danger').addClass('border-success');
        $("#usernameAlertLabel").removeClass('d-inline').addClass('d-none');
      }

      if(isStringNullOrEmpty(getPasssword)){
        status = false;
        $("#passsword").addClass('border-danger');
        $("#passwordAlertLabel").removeClass('d-none').addClass('d-inline');
      }else{
        status = true;
        $("#passsword").removeClass('border-danger').addClass('border-success');;
        $("#passwordAlertLabel").removeClass('d-inline').addClass('d-none');
      }

      if(status){
        $("#signInBtn").attr('href','/index');
        $("#signInBtn").click();
      }else{
        return;
      }

    });
  </script>
</body>

</html>
