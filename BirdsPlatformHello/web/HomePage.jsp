<%-- 
    Document   : HomePage
    Created on : May 29, 2023, 1:24:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/total.css">

    </head>

    <body>


        <!-- header section starts  -->

        <header class="header">
            <a href="./HomePage.jsp" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>

            <form action="#" class="search-form">
                <input type="search" placeholder="Search here..." id="search-box">
                <label for="search-box" class="ri-search-line"></label>
            </form>

            <div class="icons">
                <div id="menu-btn" class="ri-menu-line"></div>
                <div id="search-btn" class="ri-search-line"></div>


                <a href="cartview.jsp">
                    <div id="cart-btn" class="ri-shopping-cart-line"></div> 
                </a>





                <c:set var="User" value="${sessionScope.USERDTOBYUSERNAME}" /> 
                <c:if test="${empty User}">
                    <c:set var="User" value="${sessionScope.GOOGLE_ACC}" /> 
                </c:if>
                <c:if test="${empty User}">
                    <a href="Login.jsp">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                </c:if>
                <c:if test="${not empty User}">
                    <a href="userProfile_1.jsp">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                </c:if>

            </div>
        </header>

        <!-- header section ends  -->






        <!-- closer btn  -->

        <div id="closer" class="ri-close-line"></div>

        <!-- navbar start  -->

        <nav class="navbar">
            <a href="./HomePage.jsp">home</a>
            <a href="shop.html">shop</a>
            <a href="about.html">about</a>
            <a href="team.html">team</a>
            <a href="saleListController">On Sale</a>
            <a href="contact.html">contact</a>
        </nav>

        <!-- navbar end  -->


        >






        <!-- home section starts  -->

        <section class="home">
            <div class="slides-container">

                <div class="slide active">
                    <div class="content">
                        <span>xxxxxxxxxxxxxx</span>
                        <h3>xxxxxxxxxxxxxx</h3>
                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Vero, magni harum cupiditate perferendis expedita pariatur?</p>
                        <a href="#" class="btn">shop now</a>
                    </div>
                    <div class="image">
                        <img id="FixNow" src="img/home-img-1.png" alt="">
                    </div>
                </div>

                <div class="slide">
                    <div class="content">
                        <span>xxxxxxxxxxxxxxxxxxxx</span>
                        <h3>xxxxxxxxxxxx</h3>
                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Vero, magni harum cupiditate perferendis expedita pariatur?</p>
                        <a href="#" class="btn">shop now</a>
                    </div>
                    <div class="image">
                        <img src="img/home-img-2.png" alt="">
                    </div>
                </div>

            </div>

            <div id="slide-next" onclick="next()" class="ri-arrow-right-line"></div>
            <div id="slide-prev" onclick="prev()" class="ri-arrow-left-line"></div>
        </section>

        <!-- home section ends -->


        <!-- banner section starts  -->

        <section class="banner-container">

            <div class="banner">
                <img src="img/banner-1.jpg" alt="">
                <div class="content">
                    <span>limited offer</span>
                    <h3>upto 50% off</h3>
                    <a href="#" class="btn">shop now</a>
                </div>
            </div>

            <div class="banner">
                <img src="img/banner-2.jpg" alt="">
                <div class="content">
                    <span>limited offer</span>
                    <h3>upto 50% off</h3>
                    <a href="#" class="btn">shop now</a>
                </div>
            </div>

            <div class="banner">
                <img src="img/banner-3.jpg" alt="">
                <div class="content">
                    <span>limited offer</span>
                    <h3>upto 50% off</h3>
                    <a href="#" class="btn">shop now</a>
                </div>
            </div>

        </section>

        <!-- banner section ends -->





        <!-- products section start -->

        <section class="products">
            <h3 style="font-size: 30px;"> The product your image about on Pet Hello ! </h3>


            <div class="box-container">

                <c:if test="${empty requestScope.LIST}">
                    <h3 style="font-size: 30px;"> No Product on Sale, Please comeback later. </h3>
                    </c:if>
                    <c:if test="${ not empty requestScope.LIST}">
                        <c:forEach var="dto" items="${requestScope.LIST}">
                            <div class="box">
                                <div class="icons">
                                    <form action="product">
                                        <a href="#" class="ri-eye-line"></a>
                                        <input type="hidden" name="productID" value="${dto.productID}" />
                                        <input type="hidden" name="action" value="detail" /> 
                                        <input style="background-color: inherit;" type="submit" name="" value="View product">
                                    </form>

                                </div>
                                <div class="image">
                                    <img style="object-fit: cover;" src="${dto.img}" alt="">
                                </div>
                                <div class="content">



                                    <c:set var = "salee"  value = "${dto.pSale}"/>
                                    <c:if test = "${salee <1}">
                                        <div class="sale">
                                            <h1> <c:out value = "${ Math.round(100 - dto.pSale*100)} %"/><h1>

                                                    </div>

                                                    <div class="price">
                                                        <h4>${dto.priceOut} $</h4>
                                                        <h4 id="new">${Math.round(dto.priceOut*dto.pSale)} $ </h4>
                                                    </div>


                                                </c:if>


                                                <c:if test="${salee >= 1}">
                                                    <div class="price">
                                                        <h4 style="text-decoration: none;">${dto.priceOut} $</h4>
                                                    </div>
                                                </c:if>





                                                <h3>${dto.productName}</h3>
                                                <div style="display: flex;" class="stars">
                                                    <i style="color: #5e473e;" class="fa-solid fa-shop"></i>
                                                    <form class="ShopGo" action="">
                                                        <input type="hidden" name="shopID" value="${dto.shop.shopID}" /> 
                                                        <input style="color: #5e473e;" type="Submit" name="MAIN" value="${dto.shop.shopName}">
                                                    </form>
                                                    <div class="${dto.shop.rate}">
                                                        <span> (4,5 </span>
                                                        <i style="color: gold" class="fas fa-star"></i>
                                                        <span> ) </span>
                                                    </div>

                                                </div>
                                                </div>
                                                </div>

                                            </c:forEach>
                                        </c:if>
                                        </div>

                                        </section>

                                        <!-- products section end -->




                                        <!-- footer section start  -->
                                        <section class="footer">
                                            <div class="box-container">

                                                <div class="box">
                                                    <h3>quick links</h3>
                                                    <a href="home.html"> <i class="ri-arrow-right-line"></i> Home </a>
                                                    <a href="shop.html"> <i class="ri-arrow-right-line"></i> Shop </a>
                                                    <a href="about.html"> <i class="ri-arrow-right-line"></i> About </a>
                                                    <a href="team.html"> <i class="ri-arrow-right-line"></i> Team </a>
                                                    <a href="blog.html"> <i class="ri-arrow-right-line"></i> Blog </a>
                                                    <a href="contact.html"> <i class="ri-arrow-right-line"></i> Contact </a>
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
                                                        <input type="submit" value="subscribe" class="MAIN">
                                                    </form>
                                                </div>

                                            </div>
                                        </section>

                                        <section class="credit">
                                            shopemail@gmail.com|+84 123456789
                                        </section>
                                        <!-- footer section end  -->


                                        <!-- custom js file link  -->
                                        <script src="js/total.js"></script>

                                        </body>

                                        </html>
