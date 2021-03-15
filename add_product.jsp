<!DOCTYPE html>
<html lang="en">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8" />

    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/profile.css" />
    <link rel="stylesheet" href="static/css/footer.css" />
    <link rel="stylesheet" href="static/css/add_product.css">

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
            <div>Add new product</div>
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


                <!-- ############################################### -->

                <div id="new_product_box">
                    <a href="seller_page.do" id="seller_home">Seller Accounts</a>

                    <span>&nbsp;&nbsp;/&nbsp;&nbsp;</span>

                    <a href="seller_dashboard.do?seller_id=${seller.sellerId}&seller=${seller.sellerAccountName}"
                        id="seller_name">${seller.sellerAccountName}</a>

                    <span>&nbsp;&nbsp;/&nbsp;&nbsp;</span>

                    <span id="seller_name">New Product</span>
                </div>

                <div id="steps">
                    <ul id="step_list">
                        <li class="sel">1</li> &nbsp;&nbsp;----&nbsp;&nbsp;
                        <li>2</li> &nbsp;&nbsp;----&nbsp;&nbsp;
                        <li>3</li> &nbsp;&nbsp;----&nbsp;&nbsp;
                        <li>4</li> &nbsp;&nbsp;----&nbsp;&nbsp;
                        <li>5</li> &nbsp;&nbsp;----&nbsp;&nbsp;
                        <li>6</li> &nbsp;&nbsp;----&nbsp;&nbsp;
                        <li>7</li> &nbsp;&nbsp;----&nbsp;&nbsp;
                        <li>8</li>
                    </ul>

                    <div id="step1_box" class="show step_box">
                        <%@ include file="error.jsp" %>

                        <form id="product_form">
                            <table class="form_box">
                                <caption>New Product</caption>
                                <tr>
                                    <td class="lft">Product Category</td>
                                    <td class="rht">
                                        <select name="categor_id" class="input_normal">
                                            <option value="0">Select</option>

                                            <c:forEach var="category" items="${categories}">
                                                <option value="${category.categoryId}">${category.category}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lft">Product Name</td>
                                    <td class="rht">
                                        <input type="text" name="product_name" class="input_normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lft">Quantity</td>
                                    <td class="rht">
                                        <input type="number" name="quantity" class="input_normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lft">Price</td>
                                    <td class="rht">
                                        <input type="number" name="price" class="input_normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lft">Discount</td>
                                    <td class="rht">
                                        <input type="number" name="discount" placeholder="percent(%)"
                                            class="input_normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit" value="Save Product" class="button">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <div id="step2_box" class="hide step_box">
                        <h1 class="product_title"></h1>
                        <form>
                            <table class="form_box">
                                <caption>Product Description</caption>
                                <tr>
                                    <td class="onecol">
                                        <span class="instruction">Please provide Product Description here.</span>
                                        <textarea name="description" class="input_normal" rows="10"
                                            cols="65"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="submit" value="Save Details" class="button">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <div id="step3_box" class="hide step_box">
                        <h1 class="product_title"></h1>
                        <form>
                            <table class="form_box">
                                <caption>Product Warranty</caption>
                                <tr>
                                    <td class="onecol">
                                        <span class="instruction">Please provide Product Warranty details.</span>
                                        <textarea name="warranty" class="input_normal" rows="10" cols="65"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="submit" value="Save Warranty Details" class="button">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <div id="step4_box" class="hide step_box">
                        <h1 class="product_title"></h1>
                        <form>
                            <table class="form_box">
                                <caption>Product Returning Policy</caption>
                                <tr>
                                    <td class="onecol">
                                        <span class="instruction">Please provide Product Returning Policy
                                            details.</span>
                                        <textarea name="returning_policy" class="input_normal" rows="10"
                                            cols="65"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="submit" value="Save Returning Policy" class="button">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <div id="step5_box" class="hide step_box">
                        <h1 class="product_title"></h1>
                        <form>
                            <table class="form_box">
                                <caption>Shipment Details</caption>
                                <tr>
                                    <td class="onecol">
                                        <span class="instruction">Please provide Product Shipment details.</span>
                                        <textarea name="shipment_details" class="input_normal" rows="10"
                                            cols="65"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="submit" value="Save Shipment Details" class="button">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <div id="step6_box" class="hide step_box">
                        <h1 class="product_title"></h1>
                        <form>
                            <table class="form_box">
                                <caption>Payment Details</caption>
                                <tr>
                                    <td class="onecol">
                                        <span class="instruction">Please provide Product Payment details.</span>
                                        <textarea name="payment_details" class="input_normal" rows="10"
                                            cols="65"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="submit" value="Save Payment Details" class="button">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <div id="step7_box" class="hide step_box">
                        <form method="post">
                            <table class="form_box" id="prod_point_box_">
                                <caption>Pointwise Product Details</caption>
                                <thead>
                                    <tr class="record_header">
                                        <th class="label_">&nbsp;</th>
                                        <th class="label_">Point-Title</th>
                                        <th class="label_">Point-Value</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <td colspan="3" align="right">
                                            <span id="add_more_link">
                                                <img src="static/images/add.png" id="add_ico">
                                                <span id="add_more">Add More</span>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center">
                                            <input type="submit" value="Save Details" class="button">
                                        </td>
                                    </tr>
                                </tfoot>
                                <tbody id="product_point_record">
                                    <tr>
                                        <td class="block1">
                                            1.
                                        </td>
                                        <td class="block2">
                                            <input type="text" name="point_title" class="input_normal point_ttl">
                                        </td>
                                        <td class="block3">
                                            <textarea name="product_point" rows="3" cols="22"
                                                class="point_txt"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>

                    <div id="step8_box" class="hide step_box">
                        <form action="product_pic_upload.do" method="post" enctype="multipart/form-data">
                            <table class="form_box">
                                <caption>Upload Product Pics</caption>
                                <tbody id="upload_field_box">
                                    <tr>
                                        <td class="lft">1.</td>
                                        <td class="rht">
                                            <input type="file" name="product_pic_1" class="input_normal">
                                        </td>
                                    </tr>
                                </tbody>
                                <tr>
                                    <td colspan="2" align="right">
                                        <img src="static/images/add.png" id="add_file">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit" value="Upload" class="button">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <input type="hidden" id="product_id" value="">
                </div>

                <!-- ############################################### -->

            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %>

    <script src="static/js/add_product.js"> </script>
</body>

</html>