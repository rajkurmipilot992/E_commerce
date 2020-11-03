
<div id="header">
    <div id="header_container">
        <a href="index.jsp"><img id="web_logo" src="static/images/logo.png" id="logo" /></a>
        <span id="auth_ctrl_box">
            <input type="text" id="search_box" />
            <a href="#"><img id="search_img" src="static/images/search.png" # /></a>
            
        <% if (request.getSession().getAttribute("user")==null){ %>        
            <a href="signin.do">LOGIN</a>
            <a href="signup_page.do">REGISTER</a>
        <% }else{ %>
            <a href="profile.do">PROFILE</a>
            <a href="logout.do">LOGOUT</a>
            <%  }%>
        </span>
        <i><span id="header_username">${user.userName}</span></i>
    </div>
</div>