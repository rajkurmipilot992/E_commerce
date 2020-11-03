<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />

    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/profile.css" />
    <link rel="stylesheet" href="static/css/footer.css" />

    <title>Profile</title>
</head>

<body>
    <!-- header -->
    <%@ include file="header.jsp" %>

    <!-- Navbar menu -->
    <%@ include file="menu.jsp" %>

    <!-- main page -->
    <div id="main_body">
        <div id="profile_heading">
            <div>Personal Information</div>
        </div>
        <div id="profile_main_box">
            <div class="profile_main_box_items" id="profile_navbar_box">
                <div id="greeting_box">
                    <div class="greeting_box_items"><img src="static/images/user.svg"></div>
                    <div class="greeting_box_items"><span>Hello,</span>
                        <div id="greeting_name">Anonmyous</div>
                    </div>
                </div>

                <div class="navbar_menu_box">
                    <div class="navbar_menu">
                        <div class="navbar_menu_item"><img class="navbar_menu_img" src="static/images/user_blue.svg">
                        </div>
                        <div class="navbar_menu_item navbar_menu_heading">ACCOUNT SETTINGS</div>
                    </div>
                    <a href="#">
                        <div class="navbar_menu_subheading">Profile Information</div>
                    </a>
                    <a href="#">
                        <div class="navbar_menu_subheading">Manage Address</div>
                    </a>
                    <a href="#">
                        <div class="navbar_menu_subheading">Manage Payment</div>
                    </a>

                    <div class="navbar_menu">
                        <div class="navbar_menu_item"><img class="navbar_menu_img" src="static/images/activity.svg">
                        </div>
                        <div class="navbar_menu_item navbar_menu_heading">ACTIVITY</div>
                    </div>
                    <a href="#">
                        <div class="navbar_menu_subheading">My Wishlist</div>
                    </a>
                    <a href="#">
                        <div class="navbar_menu_subheading">My Cart</div>
                    </a>
                    <a href="#">
                        <div class="navbar_menu_subheading">My Orders</div>
                    </a>
                    <hr>
                    <div class="navbar_menu">
                        <a href="logout.do">
                            <div class="navbar_menu_item">
                                <img class="navbar_menu_img" src="static/images/logout.png">
                                <span class="navbar_menu_item navbar_menu_heading">LOGOUT</span>
                            </div>
                        </a>
                    </div>


                </div>

            </div>


            <div class="profile_main_box_items" id="Profile_main_content_box">
                <form action="profile.do" method="POST" id="profile_form">
                    <label class="form_heading">Personal Information</label><br>
                    <input class="input" value="${user.firstName}" maxlength="20" placeholder="First Name" name="firstName" type="text">
                    <input class="input" value="${user.middleName}" maxlength="20" placeholder="Middle Name" name="middleName" type="text">
                    <input class="input" maxlength="20" value="${user.lastName}" placeholder="Last Name" name="lastName" type="text">
                    <br><label value="${user.dob}"  class="form_heading">Date of Birth</label><br>
                    <input class="input" name="dateOfBirth" type="date">
                    <br><label class="form_heading" >Email Address</label><br>
                    <input class="input" maxlength="60" value="${user.email}"  placeholder="Email" name="email" type="email">
                    <br><label class="form_heading">Mobile Number</label><br>
                    <input class="input" maxlength="10" placeholder="Mobile" value="${user.mobile}"  name="mobile" type="number">
                    <br><input class="button" id="send_otp_btn" type="submit" value="SEND OTP">

                    <div id="otp_box_wrapper">
                        <div id="loader">
                            <img src="static/images/loader.gif" id="loader_img">
                        </div>
                        <div id="otp_box">
                            <span id="close_box">
                                <img src="static/images/close.png" id="close">
                            </span>
                            <div>
                                OTP sent to your registered Number:
                            </div>
                            <label for="otp" id="otp_label">Enter OTP : </label>
                            <input type="text" minlength="6" maxlength="6" name="otp" id="otp">
                            <input type="submit" value="Submit" id="otp_btn">
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %>

    <script src="static/js/profile.js"></script>
</body>

</html>