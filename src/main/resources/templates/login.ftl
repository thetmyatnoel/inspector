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

            <!-- Display login error message -->
            <#if loginError??>
              <div class="alert alert-danger" role="alert">
                ${loginError}
              </div>
            </#if>

            <form class="pt-3" id="loginForm" action="/login" method="post">
              <div class="form-group">
                <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="Username">
                <label class="text-danger d-none" id="usernameAlertLabel"><i class="ti-alert"></i>Please enter your username</label>
              </div>
              <div class="form-group">
                <input type="text" class="form-control form-control-lg" id="password" name="password" placeholder="Phone">
                <label class="text-danger d-none" id="passwordAlertLabel"><i class="ti-alert"></i>Please enter your password</label>
              </div>
              <div class="mt-3">
                <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="loginBtn" disabled><i class="icon-check mr-1"></i> LOG IN</button>
                <p id="fillFieldsMsg" class="text-danger d-none">Please fill in both fields to log in.</p>
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
  function validateFields() {
    const username = $("#username").val();
    const password = $("#password").val();
    const isFilled = username && password;

    $("#loginBtn").prop('disabled', !isFilled);
    $("#fillFieldsMsg").toggleClass('d-none', isFilled);
  }

  $("#username, #password").on('input', validateFields);
</script>
</body>
</html>
