<%-- 
    Document   : SignUp
    Created on : May 23, 2023, 12:35:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form action="signUpController" method="POST" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                                <c:set var="NameErr" value="${requestScope.NameERR}" />
                                <c:if test="${not empty NameErr}">
                                    <h3>Your name is blank </h3>
                                </c:if>
                                   
                                
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                                <c:set var="EmailERR" value="${requestScope.EmailERR}" />
                                <c:if test="${not empty EmailERR}">
                                    <h3>Your Gmail is blank </h3>
                                </c:if>
                                    
                                <c:set var="DuplicatedERR" value="${requestScope.DuplicatedERR}" />
                                <c:if test="${not empty DuplicatedERR}">
                                    <h3>Your gmail is already existed </h3>
                                </c:if>
                                    
                                
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                                <c:set var="PassERR" value="${requestScope.PassERR}" />
                                <c:if test="${not empty PassERR}">
                                    <h3>Your password is blank </h3>
                                </c:if>
                                
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Confirm your password"/>
                                
                                <c:set var="ConfirmERR" value="${requestScope.ConfirmERR}" />
                                <c:if test="${not empty ConfirmERR}">
                                    <h3>Your confirm is blank </h3>
                                </c:if>
                                    
                                <c:set var="MatchERR" value="${requestScope.MatchERR}" />
                                <c:if test="${not empty MatchERR}">
                                    <h3>Your password is not match</h3>
                                </c:if>
                                
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span>I agree all statements in </span> <a href="./Term.html" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <c:set var="TermERR" value="${requestScope.TermERR}" />
                                <c:if test="${not empty TermERR}">
                                    <h3>You need to agree with our policy</h3>
                                </c:if>
                                <input type="submit" name="MAIN" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="img/signup-image.jpg" alt="sing up image"></figure>
                        <a href="#" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

       <!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>