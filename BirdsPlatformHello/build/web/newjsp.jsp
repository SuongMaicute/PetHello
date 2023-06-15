<%-- 
    Document   : newjsp
    Created on : Jun 15, 2023, 3:16:20 PM
    Author     : Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UpdateAccountServlet" method="POST" >
           
            ${requestScope.ROLEID}
        </form>
    </body>
</html>
