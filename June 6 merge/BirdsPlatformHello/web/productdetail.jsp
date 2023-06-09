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
                                        <c:if test="${requestScope.productdetail.getType().length()!=0}">
                                            <span>/</span>
                                        </c:if>
                                        <a class="page-link" href="#">${requestScope.productdetail.getType()}</a>

                                    </li>
                                    <li class="page-item">

                                        <c:if test="${requestScope.productdetail.getCategory().length()!=0}">
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
                                        <h5 class="product-model">SALE UP ${100-(requestScope.productdetail.getpSale()*100)}% </h5>
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
                                    <h1 class="price">$ ${Math.round(requestScope.productdetail.getPriceOut()*requestScope.productdetail.getpSale())}</h1>


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
                                                <a href="product?action=detail&curPage=${page.curPage -1}&category=${requestScope.productdetail.getCategory()}&pid=${requestScope.productdetail.getProductID()}" class="arrow-btn d-flex align-items-center justify-content-center bg-light border-medium rounded-circle">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                                                    <path d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z" />
                                                    </svg>                                                   
                                                </a>
                                            </c:if>
                                            <c:if test="${requestScope.currentpage<requestScope.totalpage}">
                                                <a href="product?action=detail&curPage=${page.curPage +1}&category=${requestScope.productdetail.getCategory()}&pid=${requestScope.productdetail.getProductID()}" class="arrow-btn d-flex align-items-center justify-content-center bg-light border-medium rounded-circle">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                                                    <path d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" />
                                                    </svg>
                                                </a>
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
                                            <h3 class="price">$ ${Math.round(product.getPriceOut()*product.getpSale())}</h3>
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

        </form>     
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="js/js.js">

        </script>
        <!-- Client Suggestions Section-->

    </body>
</html>
