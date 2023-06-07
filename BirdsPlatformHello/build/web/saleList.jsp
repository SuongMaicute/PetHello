<%-- 
    Document   : saleList
    Created on : May 31, 2023, 12:12:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>blog</title>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="./css/total.css">

    </head>

    <body>

        <!-- header section starts  -->

        <header class="header">
            <a href="./Homepage.html" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>

            <form action="#" class="search-form">
                <input type="search" placeholder="search here..." id="search-box">
                <label for="search-box" class="ri-search-line"></label>
            </form>

            <div class="icons">
                <div id="menu-btn" class="ri-menu-line"></div>
                <div id="search-btn" class="ri-search-line"></div>
                <div id="cart-btn" class="ri-shopping-cart-line"></div>
                <div id="login-btn" class="ri-user-line"></div>
            </div>
        </header>

        <!-- header section ends  -->


        <!-- closer btn  -->

        <div id="closer" class="ri-close-line"></div>

        <!-- navbar start  -->

        <nav class="navbar">
            <a href="./HomePage.jsp">home</a>
            <a href="./shop.html">shop</a>
            <a href="./about.html">about</a>
            <a href="./team.html">team</a>
            <a href="./saleList.jsp">Sale</a>
            <a href="./contact.html">contact</a>
        </nav>

        <!-- navbar end  -->


        <!-- shopping cart start  -->

        <div class="shopping-cart">

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="./img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $ </span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="./img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $ </span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="./img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $1</span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="./img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $1 </span>
                </div>
            </div>

            <h3 class="total"> total : <span>$560.00</span> </h3>
            <a href="#" class="btn">checkout cart</a>

        </div>

        <!-- shopping cart end  -->


        <!-- login form start  -->

        <div class="login-form">
            <form action="#">
                <h3>login form</h3>
                <input type="email" placeholder="enter your email" class="box">
                <input type="password" placeholder="enter your password" class="box">
                <div class="remember">
                    <input type="checkbox" name="" id="remember-me">
                    <label for="remember-me">remember me</label>
                </div>
                <input name ="MAIN" type="submit" value="login now" class="btn">
                <p>forget password? <a href="#">click here</a> </p>
                <p>don't have an account? <a href="#">create now</a> </p>
            </form>
        </div>

        <!-- login form end  -->


        <!-- heading section start -->

        <section class="heading">
            <h3>our shop</h3>
            <p> <a href="./Homepage.html">home</a> / <span>blog</span> </p>
        </section>

        <!-- heading section end -->


        <!-- blog section start -->

        <section class="blog">

            <h1 class="title"> <span>our blogs</span> <a href="#">view all >></a> </h1>

            <div class="box-container">

                <c:set var="result" value="${requestScope.LIST}" />
                <c:if test="${ empty result}">
                    <h2> No sale found in system</h2>
                </c:if>

                <c:if test="${not empty result}">
                    <c:forEach var="dto" items="${result}" >
                    <div class="box">
                        <div class="image">
                            <img src="" alt="${dto.img}">
                        </div>
                        <div class="content">
                            <h3 style="color: red">Sale up to ${dto.saleUP}</h3>
                            <p>${dto.description}</p>
                            <a href="#" class="btn">Go to shop</a>
                            <div class="icons">
                                <a href="#"> <i class="fas fa-calendar"></i> ${dto.from} to ${dto.to} </a>
                                <a href="#"> <i class="fas fa-user"></i> by ${dto.shopName} shop </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </c:if>
                
            </div>

        </section>

        <!-- blog section end -->






        <!-- footer section start  -->
        <section class="footer">
            <div class="box-container">

                <div class="box">
                    <h3>quick links</h3>
                    <a href="./Homepage.html"> <i class="ri-arrow-right-line"></i> Home </a>
                    <a href="./shop.html"> <i class="ri-arrow-right-line"></i> Shop </a>
                    <a href="./about.html"> <i class="ri-arrow-right-line"></i> About </a>
                    <a href="./team.html"> <i class="ri-arrow-right-line"></i> Team </a>
                    <a href="./blog.html"> <i class="ri-arrow-right-line"></i> Blog </a>
                    <a href="./contact.html"> <i class="ri-arrow-right-line"></i> Contact </a>
                </div>

                <div class="box">
                    <h3>extra links</h3>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Order </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Wishlist </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Account </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Favorite </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> Terms of user </a>
                </div>

                <div class="box">
                    <h3>extra links</h3>
                    <a href="#"> <i class="ri-facebook-fill"></i> Facebook </a>
                    <a href="#"> <i class="ri-twitter-fill"></i> Twitter </a>
                    <a href="#"> <i class="ri-instagram-fill"></i> Instagram </a>
                    <a href="#"> <i class="ri-linkedin-box-fill"></i> Linkedin </a>
                    <a href="#"> <i class="ri-pinterest-fill"></i> Pinterest </a>
                </div>

                <div class="box">
                    <h3>newsletter</h3>
                    <p>subscribe for latest updates</p>
                    <form action="#">
                        <input type="email" name="" placeholder="enter your email" id="">
                        <input name="MAIN" type="submit" value="subscribe" class="btn">
                    </form>
                </div>

            </div>
        </section>

        <section class="credit">
            shopemail@gmail.com|+84 123456789
        </section>
        <!-- footer section end  -->

        <!-- custom js file link  -->
        <script src="./js/total.js"></script>

    </body>

</html>
