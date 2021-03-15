<!DOCTYPE html>
<html lang="en">
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <div>${seller.sellerAccountName} Dashboard</div>
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
                    <a href="#">
                        <div class="navbar_menu_subheading">All Product</div>
                    </a><a href="new_product.do">
                        <div class="navbar_menu_subheading">Add New Products</div>
                    </a>
                    </a><a href="#">
                        <div class="navbar_menu_subheading">Orders</div>
                    </a>
                    </a><a href="#">
                        <div class="navbar_menu_subheading">Return / Cancel Request</div>
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
                
        



            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %>

    <script src="static/js/profile.js"></script>
</body>

</html>