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

                            $35+ today</p>
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
