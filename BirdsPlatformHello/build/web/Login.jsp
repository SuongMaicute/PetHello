<%-- 
    Document   : Login
    Created on : May 21, 2023, 3:39:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <title>PetHello</title>
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans"
            rel="stylesheet"
            />

        <link
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="css/style_1.css" />
    </head>
    <body>
        <div class="container">
            <!-- partial:index.partial.html -->
            <div class="box-form">
                <div class="left">
                    <div class="overlay">
                        <img src="img/pic1.png" width="500px" height="400px"/>
                        <h2>Pet  Hello</h2>
                        <p>Order by 2pm local time <br> to get free delivery <br> by orders

<<<<<<< HEAD
                            <div class="heading">
                                <h2>Welcome Back</h2>
                                <h6>Not registred yet?</h6>
                                <a href="#" class="toggle">Sign up</a>
                            </div>

                            <div class="actual-form">
                                <div class="input-wrap">
                                    <input
                                        type="text"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        />
                                    <label>Name</label>
                                </div>

                                <div class="input-wrap">
                                    <input
                                        type="password"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        />
                                    <label>Password</label>
                                    <c:set var="valid" value="${requestScope.validAcc}"/>
                                </div>
                                <c:if test="${not empty valid}">
                                    <h4 style="color: red; padding-left: 10px; margin-top: 16px; margin-bottom: 0;">
                                        Incorrect username or password
                                    </h4>
                                </c:if>


                                <input  name="MAIN" type="submit" value="Login" class="sign-btn" />
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&amp;redirect_uri=http://localhost:8081/swp/LoginGoogleHandler&amp;response_type=code&amp;client_id=1037707091680-1aq2v2s9f844d1qs4dapbn521vdi89pe.apps.googleusercontent.com&amp;approval_prompt=force" class="gg-btn">
                                    <span class="btn-text">Google</span>
                                </a>


                                <p class="text">
                                    Forgotten your password or you login!!
                                    <a href="Checkmail.jsp">Click here</a> to get your Pass
                                </p>
                            </div>
                        </form>






                        <form action="DispatcherServlet" autocomplete="off" class="sign-up-form">
                            <div class="logo">
                                <a href="" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>
                            </div>

                            <div class="heading">
                                <h2>Get Started</h2>
                                <h6>Already have an account?</h6>
                                <a href="#" class="toggle">Sign in</a>
                            </div>

                            <div class="actual-form">
                                <div class="input-wrap">
                                    <input
                                        type="text" name="name"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        />
                                    <label>Name</label>
                                </div>
                                <c:set var="NameErr" value="${requestScope.NameERR}" />
                                <c:if test="${not empty NameErr}">
                                    <h4 style="color: red;">Your name is blank </h4>
                                </c:if>


                                <div class="input-wrap">
                                    <input
                                        type="email" name="email"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        />
                                    <label>Gmail</label>
                                </div>
                                <c:set var="EmailERR" value="${requestScope.EmailERR}" />
                                <c:if test="${not empty EmailERR}">
                                    <h4 style="color: red;">Your Gmail is blank </h4>
                                </c:if>

                                <c:set var="DuplicatedERR" value="${requestScope.DuplicatedERR}" />
                                <c:if test="${not empty DuplicatedERR}">
                                    <h4 style="color: red;">Your Gmail is already register in PetHello Platform</h4style=>
                                        </c:if>

                                        <div class="input-wrap">
                                    <input
                                        type="password" name="pass"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        />
                                    <label>Password</label>

                                </div>
                                <c:set var="PassERR" value="${requestScope.PassERR}" />
                                <c:if test="${not empty PassERR}">
                                    <h4 style="color: red;">Your password is blank </h4>
                                </c:if>   



                                <div class="input-wrap">
                                    <input
                                        type="password" name="re_pass"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        />
                                    <label>Confirm Password</label>

                                </div>

                                <c:set var="ConfirmERR" value="${requestScope.ConfirmERR}" />
                                <c:if test="${not empty ConfirmERR}">
                                    <h4 style="color: red;">Your confirm is blank </h4>
                                </c:if>

                                <c:set var="MatchERR" value="${requestScope.MatchERR}" />
                                <c:if test="${not empty MatchERR}">
                                    <h4 style="color: red;">Your password is not match</h4>
                                </c:if>
                                <input name="MAIN" type="submit" value="Register" class="sign-btn" />

                                <p class="text">
                                    By signing up, I agree to the
                                    <a href="#">Terms of Services</a> and
                                    <a href="#">Privacy Policy</a>
                                </p>
                            </div>
                        </form>
                    </div>

                    <div class="carousel">
                        <div class="images-wrapper">
                            <img src="./img/home-img-1.png" />
                        </div>

                        <div class="text-slider">
                            <div class="text-wrap">
                                <div class="text-group">

                                </div>
                            </div>

                            <div class="bullets">
                                <span class="active" data-value="1"></span>
                            </div>
                        </div>
=======
                            $35+ today</p>
>>>>>>> 1c3b3fb0d76bbf1aa901b41d03e526b099bdc7ab
                    </div>
                </div>

                <div class="right">
                    <h3 style="padding-left: 35px;">Welcome</h3>
                    <h3>to PetHello</h3>

                    <form action="DispatcherServlet">
                        <div class="inputs">
                            <input type="text" placeholder="Username" name="username" />
                            <br />
                            <input type="password" placeholder="Password" name ="pass" />
                        </div>

                        <c:set var="valid" value="${requestScope.validAcc}"/>
                        <c:if test="${not empty valid}">
                            <h4 style="color: red; padding-left: 10px; margin-top: 16px; margin-bottom: 0;">
                                Incorrect username or password
                            </h4>
                        </c:if>
                        
                        <div class="remember-me--forget-password">
                            <label>
                                <input type="checkbox" name="item" checked />
                                <span class="text-checkbox">Remember me</span>
                            </label>
                            <p>Forgot Password?</p>
                        </div>
                        <input name="MAIN" class="loginBT" type="submit" value="Login" />
                        <div class="loginBt">
                            
                        </div>
                    </form>

                    <div class="line" style="width: 80%; height: 1px; background-color: black;">
                        <h4>OR</h4>
                    </div>

                    <div class="google" >
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&amp;redirect_uri=http://localhost:8081/swp/LoginGoogleHandler&amp;response_type=code&amp;client_id=1037707091680-1aq2v2s9f844d1qs4dapbn521vdi89pe.apps.googleusercontent.com&amp;approval_prompt=force">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png" alt="google">
                            <h2> Login With Google</h2>
                            
                        </a>

                    </div>
                    <div class="signUP">
                        <a href="">Don't have one? Create account</a>
                    </div>


                </div>
            </div>
        </div>

    </body>
</html> 
