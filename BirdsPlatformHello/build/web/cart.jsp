<%-- 
    Document   : cart
    Created on : May 27, 2023, 12:18:32 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <<form action="cart">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta charset="utf-8">
            <title>Cart</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/cart.css">
        </head>
        <body>

            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <div class="container padding-bottom-3x mb-1">
                <c:choose>
                    <c:when test="${sessionScope.cartlist==null || empty sessionScope.cartlist}">
                        <div class="alert alert-info alert-dismissible fade show text-center"
                             style="margin-bottom: 30px; background-color: rgb(185, 229, 248);">
                            <span class="alert-close"
                                  data-dismiss="alert"></span>
                            &nbsp;&nbsp;Have no product in your cart!
                            <div class="column"><a class="btn btn-outline-secondary change" href="#"><i
                                        class="icon-arrow-left"></i>&nbsp;Back
                                    to Shopping</a></div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info alert-dismissible fade show text-center"
                             style="margin-bottom: 30px; background-color: rgb(185, 229, 248);">
                            <span class="alert-close"
                                  data-dismiss="alert"></span>
                            <img class="d-inline align-center"
                                 src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA1MTIuMDAzIDUxMi4wMDMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMi4wMDMgNTEyLjAwMzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiPgo8Zz4KCTxnPgoJCTxnPgoJCQk8cGF0aCBkPSJNMjU2LjAwMSw2NGMtNzAuNTkyLDAtMTI4LDU3LjQwOC0xMjgsMTI4czU3LjQwOCwxMjgsMTI4LDEyOHMxMjgtNTcuNDA4LDEyOC0xMjhTMzI2LjU5Myw2NCwyNTYuMDAxLDY0eiAgICAgIE0yNTYuMDAxLDI5OC42NjdjLTU4LjgxNiwwLTEwNi42NjctNDcuODUxLTEwNi42NjctMTA2LjY2N1MxOTcuMTg1LDg1LjMzMywyNTYuMDAxLDg1LjMzM1MzNjIuNjY4LDEzMy4xODQsMzYyLjY2OCwxOTIgICAgIFMzMTQuODE3LDI5OC42NjcsMjU2LjAwMSwyOTguNjY3eiIgZmlsbD0iIzUwYzZlOSIvPgoJCQk8cGF0aCBkPSJNMzg1LjY0NCwzMzMuMjA1YzM4LjIyOS0zNS4xMzYsNjIuMzU3LTg1LjMzMyw2Mi4zNTctMTQxLjIwNWMwLTEwNS44NTYtODYuMTIzLTE5Mi0xOTItMTkycy0xOTIsODYuMTQ0LTE5MiwxOTIgICAgIGMwLDU1Ljg1MSwyNC4xMjgsMTA2LjA2OSw2Mi4zMzYsMTQxLjE4NEw2NC42ODQsNDk3LjZjLTEuNTM2LDQuMTE3LTAuNDA1LDguNzI1LDIuODM3LDExLjY2OSAgICAgYzIuMDI3LDEuNzkyLDQuNTY1LDIuNzMxLDcuMTQ3LDIuNzMxYzEuNjIxLDAsMy4yNDMtMC4zNjMsNC43NzktMS4xMDlsNzkuNzg3LTM5Ljg5M2w1OC44NTksMzkuMjMyICAgICBjMi42ODgsMS43OTIsNi4xMDEsMi4yNCw5LjE5NSwxLjI4YzMuMDkzLTEuMDAzLDUuNTY4LTMuMzQ5LDYuNjk5LTYuNGwyMy4yOTYtNjIuMTQ0bDIwLjU4Nyw2MS43MzkgICAgIGMxLjA2NywzLjE1NywzLjU0MSw1LjYzMiw2LjY3Nyw2LjcyYzMuMTM2LDEuMDY3LDYuNTkyLDAuNjQsOS4zNjUtMS4yMTZsNTguODU5LTM5LjIzMmw3OS43ODcsMzkuODkzICAgICBjMS41MzYsMC43NjgsMy4xNTcsMS4xMzEsNC43NzksMS4xMzFjMi41ODEsMCw1LjEyLTAuOTM5LDcuMTI1LTIuNzUyYzMuMjY0LTIuOTIzLDQuMzczLTcuNTUyLDIuODM3LTExLjY2OUwzODUuNjQ0LDMzMy4yMDV6ICAgICAgTTI0Ni4wMTcsNDEyLjI2N2wtMjcuMjg1LDcyLjc0N2wtNTIuODIxLTM1LjJjLTMuMi0yLjExMi03LjMxNy0yLjM4OS0xMC42ODgtMC42NjFMOTQuMTg4LDQ3OS42OGw0OS41NzktMTMyLjIyNCAgICAgYzI2Ljg1OSwxOS40MzUsNTguNzk1LDMyLjIxMyw5My41NDcsMzUuNjA1TDI0Ni43LDQxMS4yQzI0Ni40ODcsNDExLjU2MywyNDYuMTY3LDQxMS44NCwyNDYuMDE3LDQxMi4yNjd6IE0yNTYuMDAxLDM2Mi42NjcgICAgIEMxNjEuOSwzNjIuNjY3LDg1LjMzNSwyODYuMTAxLDg1LjMzNSwxOTJTMTYxLjksMjEuMzMzLDI1Ni4wMDEsMjEuMzMzUzQyNi42NjgsOTcuODk5LDQyNi42NjgsMTkyICAgICBTMzUwLjEwMywzNjIuNjY3LDI1Ni4wMDEsMzYyLjY2N3ogTTM1Ni43NTksNDQ5LjEzMWMtMy40MTMtMS43MjgtNy41MDktMS40NzItMTAuNjg4LDAuNjYxbC01Mi4zNzMsMzQuOTIzbC0zMy42NDMtMTAwLjkyOCAgICAgYzQwLjM0MS0wLjg1Myw3Ny41ODktMTQuMTg3LDEwOC4xNi0zNi4zMzFsNDkuNTc5LDEzMi4yMDNMMzU2Ljc1OSw0NDkuMTMxeiIgZmlsbD0iIzUwYzZlOSIvPgoJCTwvZz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K"
                                 width="18" height="18" alt="Medal icon">&nbsp;&nbsp;With this purchase you will earn
                            <strong>290</strong> Reward Points.
                        </div>

                        <div class="table-responsive shopping-cart">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th class="text-center">Quantity</th>
                                        <th class="text-center">Subtotal</th>
                                        <th class="text-center">Discount</th>
                                        <th class="text-center"><a class="btn btn-sm btn-outline-danger" href="#">Clear Cart</a></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="item" items="${sessionScope.cartlist}">
                                        <tr>
                                            <td>
                                                <div class="product-item">
                                                    <a class="product-thumb" href="#"><img
                                                            src="${item.getProduct().getImg()}" alt="Product"></a>
                                                    <div class="product-info">
                                                        <h4 class="product-title"><a href="#">${item.getProduct().getProductName()}</a></h4>
                                                        <span>
                                                            <em>Sale up:</em>${item.getProduct().getpSale()}
                                                        </span>
                                                        <!--                                                <span>
                                                                                                            <em>Color:</em> Dark Blue
                                                                                                        </span>-->
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="count-input">
                                                    <form action="cart">
                                                        <div class="quantity buttons_added">
                                                            <input type="submit" value="-" class="minus">


                                                            <input type="number" step="1" min="1" max="${item.getProduct().getQuantity()}" name="quantity" value="${item.getQuantity()}" title="Qty"
                                                                   class="input-text qty text" size="4" pattern="" inputmode="">
                                                            <input type="submit" value="+" class="plus">
                                                            <input type="hidden" name="action" value="update"/>
                                                            <input type="hidden" name="productID" value="${item.getProduct().getProductID()}"/>
                                                        </div>
                                                    </form>


                                                </div>
                                            </td>
                                            <td class="text-center text-lg text-medium">${item.getQuantity()*item.getProduct().getPriceOut()}</td>
                                            <td class="text-center text-lg text-medium">${item.getQuantity()*item.getProduct().getPriceOut()*(1-item.getProduct().getpSale())}</td>
                                            <td class="text-center"><a class="remove-from-cart" href="cart?action=removeitem&productID=${item.getProduct().getProductID()}" data-toggle="tooltip" title
                                                                       data-original-title="Remove item"><i class="fa fa-trash"></i></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                        <div class="shopping-cart-footer">
                            <div class="column">
                                <form class="coupon-form" method="post">
                                    <input class="form-control form-control-sm" type="text" placeholder="Coupon code" required>
                                    <button class="btn btn-outline-primary btn-sm change" type="submit"
                                            style="color: gray;border:rgb(84, 195, 242);">Apply Coupon</button>
                                </form>
                            </div>
                            <div class="column text-lg">Subtotal: <span class="text-medium">$289.68</span></div>
                        </div>
                        <div class="shopping-cart-footer">
                            <div class="column"><a class="btn btn-outline-secondary change" href="#"><i
                                        class="icon-arrow-left"></i>&nbsp;Back
                                    to Shopping</a></div>
                            <div class="column">                        
                                <a class="btn btn-success changecheck"
                                   href="#">Checkout</a></div>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>

            <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>

            <script type="text/javascript">
                function wcqib_refresh_quantity_increments() {
                    jQuery("div.quantity:not(.buttons_added), td.quantity:not(.buttons_added)").each(function (a, b) {
                        var c = jQuery(b);
                        c.addClass("buttons_added"), c.children().first().before('<input type="button" value="-" class="minus" />'), c.children().last().after('<input type="button" value="+" class="plus" />')
                    })
                }
                String.prototype.getDecimals || (String.prototype.getDecimals = function () {
                    var a = this,
                            b = ("" + a).match(/(?:\.(\d+))?(?:[eE]([+-]?\d+))?$/);
                    return b ? Math.max(0, (b[1] ? b[1].length : 0) - (b[2] ? +b[2] : 0)) : 0
                }), jQuery(document).ready(function () {
                    wcqib_refresh_quantity_increments()
                }), jQuery(document).on("updated_wc_div", function () {
                    wcqib_refresh_quantity_increments()
                }), jQuery(document).on("click", ".plus, .minus", function () {
                    var a = jQuery(this).closest(".quantity").find(".qty"),
                            b = parseFloat(a.val()),
                            c = parseFloat(a.attr("max")),
                            d = parseFloat(a.attr("min")),
                            e = a.attr("step");
                    b && "" !== b && "NaN" !== b || (b = 0), "" !== c && "NaN" !== c || (c = ""), "" !== d && "NaN" !== d || (d = 0), "any" !== e && "" !== e && void 0 !== e && "NaN" !== parseFloat(e) || (e = 1), jQuery(this).is(".plus") ? c && b >= c ? a.val(c) : a.val((b + parseFloat(e)).toFixed(e.getDecimals())) : d && b <= d ? a.val(d) : b > 0 && a.val((b - parseFloat(e)).toFixed(e.getDecimals())), a.trigger("change")
                });
            </script>
        </body>

    </form>
</html>
zzs