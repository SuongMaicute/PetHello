<%-- 
    Document   : search
    Created on : Jun 18, 2023, 12:42:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH Page</title>
    </head>
    <body>
        <h1>test search function</h1>
        
        <c:set var="Shop" value="${requestScope.SHOP}" />
        
        <h2> shop: </h2> <br>
        <p>
            id: ${Shop.shopID}
            , name: ${Shop.shopName}
            , rate:${Shop.rate}
            , contact: ${Shop.contact}
            , account ID:${Shop.accountID}
            , address ID: ${SHop.addressID}
        </p>
        
        <c:set var="List" value="${requestScope.SEARCHLIST}" />
        <h2> Product List: ${List}</h2>
        <c:forEach var="dto" items="${List}">
            ${dto.productID} <br>
        </c:forEach>
    </body>
</html>
