<!DOCTYPE html>
<html lang="en">
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8" />

    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/profile.css" />
    <link rel="stylesheet" href="static/css/footer.css" />
    <link rel="stylesheet" href="static/css/sellerAccount.css" />

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
            <div>Seller Account</div>
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
                
        <c:choose>
			<c:when test="${empty sellers}">
				<h3 id="msg">No Seller Account Found</h3>
			</c:when>
			<c:otherwise>
				<table id="seller_box">
					<tr id="hd">
						<th>&nbsp;</th>
						<th>Seller Account</th>
						<th>Start Date</th>
					</tr>
					
					<c:forEach var="seller" items="${sellers}">
						<tr>
							<td class="center cl1">
								<input type="checkbox" name="seller_id" value="${seller.sellerId}">
							</td>
							<td class="center cl2">
								<a href="seller_dashboard.do?seller_id=${seller.sellerId}&seller=${seller.sellerAccountName}">${seller.sellerAccountName}</a>
							</td>
							<td class="center cl3">${seller.startDate}</td>
						</tr>
					</c:forEach>
				</table>				
			</c:otherwise>
		</c:choose>
		



            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %>

    <script src="static/js/profile.js"></script>
</body>

</html>