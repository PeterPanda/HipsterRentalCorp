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
        <title>LoginForm</title>
    </head>
    <body onload="init();">
        <div> 
            <form action="/HipsterRentalCorp/loginServlet" method="post">  
                <table>
                    <tbody> 
                        <tr>
                            <td>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td> E-Mail</td> 
                                            <td><input type='text' name='inputEmail'> </td>
                                            <td></td>
                                        </tr> 
                                        <tr>
                                            <td>Passwort</td>
                                            <td><input type='password' name='inputPassword'> </td>
                                        </tr> 
                                    </tbody>
                                </table>

                            </td>
                            <td><input type="submit" value="login"/></td>
                        </tr>
                        <tr> 
                            <td> Neukunde? <button class='link' id='buttonRegisterNewUser' onclick="parent.loadRegistrationForm();">registrieren</button></td>
                            <td></td>
                        </tr>                     
                    </tbody>
                </table>
            </form>
        </div>
        <script>
            function init() {
                /* Load WelcomeMain-Page */
                parent.loadWelcomePage();
                
                /* User still loged in? */
                var user = '<%= session.getAttribute("User")%>';
                if (user !== null && user !== "" && user !== "null") {

                }
            }
        </script>
    </body>
</html>
