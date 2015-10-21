<%-- 
    Document   : WelcomeForm
    Created on : 19.10.2015, 12:52:59
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WelcomeForm</title>

        <!--<script type="text/javascript" src="WelcomeForm.js"></script>-->
    </head>
    <body>
        <div>
            <p>Hallo,<br>
                ${requestScope.customer.getVorname()} ${requestScope.customer.getNachname()}.<br>
            </p>
            <button type="button" id="buttonLogout" onclick="userLogout()">Abmelden</button>
            <script>
                function userLogout() {
                    alert(<%= session.getAttribute("User")%>);
                }
            </script>
        </div>
    </body>
</html>
