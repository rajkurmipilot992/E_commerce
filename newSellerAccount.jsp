
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />

    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/profile.css" />
    <link rel="stylesheet" href="static/css/footer.css" />
    <link rel="stylesheet" href="static/css/newSellerAccount.css" />

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
            <div>Create New Seller Account</div>
        </div>
        <div id="profile_main_box">
            <div class="profile_main_box_items" id="profile_navbar_box">
                <div id="greeting_box">
                    <div class="greeting_box_items"><img src="static/images/user.svg"></div>
                    <div class="greeting_box_items"><span>Hello,</span>
                        <div id="greeting_name">${user.userName}</div>
                    </div>
                </div>

                <div class="navbar_menu_box">
                    <div class="navbar_menu">
                        <div class="navbar_menu_item"><img class="navbar_menu_img" src="static/images/user_blue.svg">
                        </div>
                        <div class="navbar_menu_item navbar_menu_heading">ACCOUNT SETTINGS</div>
                    </div>
                    <a href="seller_page.do">
                        <div class="navbar_menu_subheading">My Seller Account</div>
                    </a>
                    <a href="newSellerAccount.jsp">
                        <div class="navbar_menu_subheading">New Seller Account</div>
                    </a>
                    

                    <div class="navbar_menu">
                        <div class="navbar_menu_item"><img class="navbar_menu_img" src="static/images/activity.svg">
                        </div>
                        <div class="navbar_menu_item navbar_menu_heading">ACTIVITY</div>
                    </div>
                    
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
                
                <form action="new_seller.do" method="post">
                    <table class="form_box">
                        
                        <tr>
                            <td class="lft">Account Name: </td>
                            <td class="rht">
                                <input type="text" name="account_name" class="input_normal">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Create New Account" class="button">
                            </td>
                        </tr>
                    </table>
                </form>
                
            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %>

    <script src="static/js/profile.js"></script>
</body>

</html>