<%-- 
    Document   : updateProduct
    Created on : Jun 5, 2023, 12:45:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="DispatcherServlet">
            <input type="hidden" name="productID" value="" />
            <br> img
            <input type="text" name="img" value="" />
            <button id="upload" onclick="">Check Image</button>
            <br>
            productname: 
            <input type="text" name="productname" value=""  />
            <br> price In
            <input type="text" name="priceIn" value="" />
            <br> Type
            <input type="text" name="type" value="" />    
            <br> category
            <input type="text" name="category" value="" />
            <br> quantity
            <input type="text" name="quantity" value="" />
            <br> description
            <input type="text" name="description" value="" />
            <br> status
            <input type="text" name="status" value="" />
            
            <br>
            <input type="submit" name="MAIN" value="Goooooooooooooooo" />     
        </form>
    </body>
</html>
