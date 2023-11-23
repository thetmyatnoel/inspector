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
                <h6 class="font-weight-light">User Sign up</h6>
              </div>
              <form class="pt-3">
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="username" placeholder="Username">
                  <label class="text-danger d-none" id="usernameAlertLabel"><i class="ti-alert"></i>Please enter your username..</label>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="passsword1" placeholder="Password">
                  <label class="text-danger d-none" id="passwordAlertLabel1"><i class="ti-alert"></i>Please enter your passsword..</label>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="passsword2" placeholder="Confirm Password">
                  <label class="text-danger d-none" id="passwordAlertLabel2"><i class="ti-alert"></i>Please enter your confirm passsword..</label>
                </div>
                <div class="mt-3">
                  <label class="text-danger d-none" id="checkPasswordLabel"><i class="ti-alert"></i>Please check your password..</label>
                  <a class="btn btn-block btn-info btn-lg font-weight-medium auth-form-btn" href="#" id="signUpBtn"><i class="icon-check mr-1"></i> SIGN UP</a>
                </div>

                <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="register" class="text-primary">Create</a>
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
    $("#signUpBtn").click(function (){
      let getUsername = $("#username").val();
      let getPasssword1 = $("#passsword1").val();
      let getPasssword2 = $("#passsword2").val();

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

      if(isStringNullOrEmpty(getPasssword1)){
        status = false;
        $("#passsword1").addClass('border-danger');
        $("#passwordAlertLabel1").removeClass('d-none').addClass('d-inline');
      }else{
        status = true;
        $("#passsword1").removeClass('border-danger').addClass('border-success');;
        $("#passwordAlertLabel1").removeClass('d-inline').addClass('d-none');
      }

      if(isStringNullOrEmpty(getPasssword2)){
        status = false;
        $("#passsword2").addClass('border-danger');
        $("#passwordAlertLabel2").removeClass('d-none').addClass('d-inline');
      }else{
        status = true;
        $("#passsword2").removeClass('border-danger').addClass('border-success');;
        $("#passwordAlertLabel2").removeClass('d-inline').addClass('d-none');
      }

      if(getPasssword1 !== getPasssword2){
        $("#checkPasswordLabel").removeClass('d-none').addClass('d-inline');
        status = false;
      }

      if(status){
        $("#passsword1,#passsword2").addClass('border-danger');
        $("#signUpBtn").attr('href','/login');
        $("#signUpBtn").click();
      }else{
        return;
      }

    });
  </script>
</body>

</html>
