<%-- 
    Document   : Navigation
    Created on : 26.10.2015, 14:44:09
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navigation</title>
    </head>
    <body>
        <div>
            <button type="button" onclick="parent.loadOrderView();">Bestellungen anzeigen</button><br>
            <button type="button" onclick="parent.loadAddUser();">Benutzer anlegen</button><br>
            <button type="button" onclick="parent.loadAddProduct();">Produkt anlegen</button><br>
            <button type="button" onclick="parent.loadAddPackage();">Paket anlegen</button><br>
        </div>
    </body>
</html>
