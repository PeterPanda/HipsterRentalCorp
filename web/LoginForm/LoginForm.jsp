<%-- 
    Document   : LoginForm
    Created on : 09.10.2015, 16:09:56
    Author     : Jan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheetLoginForm.css">      
        <script type="text/javascript" src="javascriptLoginForm.js"></script>
        <title>LoginForm</title>
    </head>
    <body>
        <div id="divMain"> 
            <table>
                <tbody>
                    <tr>
                        <td> Benutzername</td> 
                        <td><input type='text' id='inputUsername'> </td>
                    </tr> 
                    <tr>
                        <td>Passwort</td>
                        <td><input type='password' id='inputPassword' onkeydown="checkEnter(event.keyCode);"> </td>
                    </tr> 
                    <tr> 
                        <td></td>
                        <td> Neukunde? <button class='link' id='buttonRegisterNewUser' onclick="loadRegistrationForm();">registrieren</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
