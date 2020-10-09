<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />

  <link rel="stylesheet" href="static/css/common.css" />
  <link rel="stylesheet" href="static/css/form.css" />
  <link rel="stylesheet" href="static/css/signup.css" />
  <link rel="stylesheet" href="static/css/footer.css" />

  <script src="https://www.google.com/recaptcha/api.js" async defer></script>

  <title>Signup</title>
</head>

<body>
  <!-- header -->
  <%@ include file="header.jsp" %>

  <!-- Navbar menu -->
  <%@ include file="menu.jsp" %>

  <!-- main page -->
  <div id="main_body">
    <div id="login_signup_heading">
      <div>Register / Login</div>
    </div>
    <div id="login_signup_container">

      <div id="login_box">
        <div id="login_box1">Already have an account?</div>
        <div id="login_box2">
          There are advances being made in science and technology everyday, and a good example of this is the
        </div>
        <div id="login_box3">
          <a href="signin_page.do"><input class="button" id="login_button" type="submit" value="Login Now" /></a>
        </div>
      </div>
      <div id="signup_box">
        <div id="signup_box1">CREATE AN ACCOUNT</div>
        <div id="signup_box2">
          <form action="signup_page.do" method="POST">
            <input class="input" maxlength="30" minlength="5" type="text" placeholder="Username" name="username" />
            <input class="input" type="email" placeholder="Email" name="email" />
            <input class="input" maxlength="12" minlength="6" type="password" placeholder="password" name="password" />
            <input class="input" type="password" maxlength="12" minlength="6" placeholder="Retype-Password"
              name="repassword" />
            <div id="recaptcha" class="g-recaptcha" data-sitekey="6Lea-dMZAAAAAHwT9-OQbXT3y3Q1rQWxr32hU_G9"></div><br />
            <input class="button" id="register_button" type="submit" value="Register" />
          </form>
        </div>
      </div>

    </div>
    <% String error = (String)request.getAttribute("error"); %>
    <div id="error_box" style='display: <%= error==null?"none":"block"%>;'>
      <%=error%>
    </div>
  </div>

  <!-- footer -->
  <%@ include file="footer.jsp" %>

  <!-- <div style="border: 1px solid red;">sfds</div> -->
  <script src="static/js/signup.js"> </script>
</body>

</html>