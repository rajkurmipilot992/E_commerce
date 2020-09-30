<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/form.css" />
    <link rel="stylesheet" href="static/css/signin.css" />
    <link rel="stylesheet" href="static/css/footer.css" />
    
    <title>Signin</title>
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
          
            <div id="signup_box">
            <div id="signup_box1">New to our website?</div>
            <div id="signup_box2">
              There are advances being made in science and technology everyday,
              and a good example of this is the
            </div>
            <div id="signup_box3">
                <a href="signup_page.do"><input class="button" id="reg_button" type="submit" value="Register" /></a>
            </div>
          </div>
          <div id="login_box">
            <div id="login_box1">LOGIN TO ENTER</div>
            <div id="login_box2">
              <form>
                <input class="input" maxlength="30" minlength="5" type="text" placeholder="Username" name="username" />
                <input class="input" type="password" maxlength="12" minlength="6" placeholder="Password" name="password" />
                <input class="button" id="login_button" type="submit" value="Login" />
              </form>
            </div>
          </div>
        
        </div>
      </div>
    
    <!-- footer -->
    <%@ include file="footer.jsp" %>

</body>

</html>