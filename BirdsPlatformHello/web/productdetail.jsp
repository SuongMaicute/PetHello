<%-- 
    Document   : productdetail
    Created on : May 23, 2023, 3:27:23 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">    

        <title>${requestScope.productdetail.getProductName()}</title>
        <link rel="stylesheet" href="css/productdetail.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>
        <!--=== HEADER ===-->
        

        <header class="header-container bg-light w-100 border-bottom-light">
            <nav class="navbar container-full d-flex align-items-center mx-auto">
                <a class="navbar-logo d-flex align-items-center mr-auto" href="#">
                    <?xml version="1.0" encoding="UTF-8"?>
                    <svg width="80px" height="20px" viewBox="0 0 748 131" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <!-- LOGO-->
                    </svg>
                </a>
                <ul class="navbar-nav d-flex mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">New</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Rooms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Inspiration</a>
                    </li>
                </ul>
                <form class="search-form d-flex align-items-center">
                    <button class="search-btn nav-icon" type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 24 24" width="20">
                        <path d="M0 0h24v24H0z" fill="none" />
                        <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
                        </svg>
                    </button>
                    <input class="search-input" type="search" placeholder="Search products..." />
                </form>
                <div class="navbar-nav d-flex ml-auto d-flex align-items-center justify-content-center">
                    <a class="nav-icon subtotal-price" href="#">$0</a>

                    <a class="nav-icon d-flex align-items-center position-relative" href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 24 24" width="20">
                        <path d="M0 0h24v24H0z" fill="none" />
                        <path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z" />
                        </svg>
                        <span class="item-quantity badge position-absolute rounded-circle d-flex align-items-center justify-content-center">2</span>
                    </a>
                </div>
            </nav>
        </header>
        <!--=== END OF HEADER ===-->

        <!--=== MAIN CONTENT ===-->
        <form action="product">
            <main class="w-100 mx-auto">
                <!-- Main Section-->
                <section id="main-section" class="main-section container-full mx-auto d-flex">
                    <article class="product-showcase h-100 border-right-light">
                        <section class="product-path">
                            <header class="product-path__nav">
                                <ul class="nav d-flex align-items-center w-100">
                                    <li class="page-item">
                                        <a class="page-link" href="#">Home</a>
                                    </li>
                                    <li class="page-item">
                                        <c:if test="${!requestScope.productdetail.getType().isBlank()}">
                                            <span>/</span>
                                        </c:if>
                                        <a class="page-link" href="#">${requestScope.productdetail.getType()}</a>

                                    </li>
                                    <li class="page-item">

                                        <c:if test="${!requestScope.productdetail.getCategory().isBlank()}">
                                            <span>/</span>
                                        </c:if>
                                        <a class="page-link" href="#">${requestScope.productdetail.getCategory()}</a>

                                    </li>                                
                                </ul>
                            </header>
                        </section>

                        <section class="product-selected w-100 d-flex">
                            <div class="product-preview">
                                <div class="product-presentation d-flex">
                                    <div class="product-display d-flex align-items-center position-relative">

                                        <img src="${requestScope.productdetail.getImg()}" />

                                    </div>
                                </div>
                            </div>

                            <div class="product-description">
                                <div class="product-summary-container">
                                    <c:if test="${requestScope.productdetail.getpSale()!= 1.0}">
                                        <h5 class="product-model">SALE UP ${requestScope.productdetail.getpSale()} </h5>
                                    </c:if>

                                    <h1 class="product-type">${requestScope.productdetail.getProductName()}</h1>
                                    <p class="product-text-description">
                                        ${requestScope.productdetail.getDescription()}
                                    </p>
                                </div>
                                <div class="product-options d-flex align-items-center">



                                    <div class=" ">
                                        <div class="count-input">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus change">
                                                <input type="number" step="1" min="1" max="" name="quantity" value="1" title="Qty"
                                                       class="input-text qty text" size="4" pattern="" inputmode="">
                                                <input type="button" value="+" class="plus">
                                            </div>

                                        </div>


                                    </div>


                                </div>

                                <div class="product-price d-flex align-items-center">
                                    <h1 class="price">${requestScope.productdetail.getPriceOut()}</h1>


                                    <button class="add-cart-btn rounded-pill d-flex align-items-center justify-content-between" style="margin-left: 100px">
                                        Add to cart<span class="features-btn rounded-circle d-flex align-items-center justify-content-center">
                                            <svg class="rounded-circle" xmlns="http://www.w3.org/2000/svg" height="16" viewBox="0 0 24 24" width="16">
                                            <path d="M0 0h24v24H0z" fill="none" />
                                            <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" />
                                            </svg>
                                        </span>
                                    </button>  

                                </div>


                            </div>


                        </section>


                    </article>

                    <aside class="user-navbar h-100">
                        <div class="user-avatar position-relative">
                            <img src="${requestScope.productdetail.getShop().getAvatar()}" class="rounded-circle" />

                        </div>
                        <h3 class="user-greeting">
                            <span class="username">${requestScope.productdetail.getShop().getShopName()}</span>
                        </h3>
                        <div class="user-proposal">
                            <h5 class="title">Rate</h5>
                            <ul class="proposal-list">
                                <!-- Add icon library -->

                                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


                                <span class="nav-link">${Math.floor(requestScope.productdetail.getShop().getRate()*5*10)/10}/5.0  </span>
                                <span class="fa fa-star checked"></span>

                            </ul>
                        </div>
                        <div class="user-proposal">
                            <h5 class="title">Contact</h5>
                            <ul class="proposal-list">
                                <span class="nav-link">${requestScope.productdetail.getShop().getContact()}</span>                                   

                            </ul>
                        </div>


                    </aside>
                </section>

                <!-- Product Suggestions Section-->
                <c:if test = "${requestScope.suggestedlist != null}">
                    <c:if test="${not empty requestScope.suggestedlist}">
                        <section id="product-suggestion" class="product-suggestion w-100">
                            <div class="container-full d-flex justify-content-between mx-auto w-100">
                                <div class="section-title h-100">
                                    <h1>You Might Like</h1>

                                    <h5>${requestScope.currentpage} of ${requestScope.totalpage}</h5>
                                    <c:set var="curPage" value="${requestScope.currentpage}" scope="page"></c:set>

                                        <div class="d-flex align-items-center">
                                        <c:if test="${requestScope.totalpage>1}">
                                            <c:if test="${requestScope.currentpage>1}">
                                                <button href="product?action=suggestedlist&curPage=${page.curPage -1}&category=${requestScope.productdetail.getCategory()}" class="arrow-btn d-flex align-items-center justify-content-center bg-light border-medium rounded-circle">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                                                    <path d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z" />
                                                    </svg>
                                                </button>
                                            </c:if>
                                            <c:if test="${requestScope.currentpage<requestScope.totalpage}">
                                                <button href="product?action=suggestedlist&curPage=${page.curPage +1}&category=${requestScope.productdetail.getCategory()}" class="arrow-btn d-flex align-items-center justify-content-center bg-light border-medium rounded-circle">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                                                    <path d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" />
                                                    </svg>
                                                </button>
                                            </c:if>

                                        </c:if>

                                    </div>
                                </div>
                                <c:forEach var="product" items="${requestScope.suggestedlist}">
                                    <div class="product-suggestion-showcase d-flex align-items-center">
                                        <div class="suggestion-card h-100 bg-light d-flex column border-light position-relative">
                                            <img src="${product.getImg()}" />
                                            <h2>${product.getProductName()}</h2>
                                            <h5>${product.getCategory()}</h5>
                                            <h3 class="price">${product.getPriceOut()}</h3>
                                            <button class="add-cart-btn rounded-pill d-flex align-items-center justify-content-between">
                                                Add to cart<span class="features-btn rounded-circle d-flex align-items-center justify-content-center">
                                                    <svg class="rounded-circle" xmlns="http://www.w3.org/2000/svg" height="16" viewBox="0 0 24 24" width="16">
                                                    <path d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" />
                                                    </svg>
                                                </span>
                                            </button>
                                        </div>

                                    </div>
                                </c:forEach>

                            </div>
                        </section>
                    </c:if>         
                </c:if>

                <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>

                <script src="js/js.js">

                </script>
                <!-- Client Suggestions Section-->

                </body>
                </html>
