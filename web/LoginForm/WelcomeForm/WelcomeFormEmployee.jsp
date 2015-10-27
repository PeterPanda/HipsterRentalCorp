<%-- 
    Document   : WelcomeFormEmployee
    Created on : 26.10.2015, 14:15:46
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WelcomeFormEmployee</title>
    </head>
    <body onload="mainPageLoadEmployeeOverlay()">
        <div>
            <p>Hallo,<br>
                ${requestScope.employee.getVorname()} ${requestScope.employee.getNachname()}.<br>
                ${requestScope.employee.getMitarbeiterNR()} - ${requestScope.employee.administrator()} <br>
            </p>
            <table>
                <tbody>
                    <tr>
                        <td>
                            <form action="/HipsterRentalCorp/LogoutServlet" method="post">
                                <button type="submit">Abmelden</button>
                            </form>
                        </td>
                        <td>

                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <script>
            /**
             * Loads the employee overly in the main page.
             * @returns {undefined}
             */
            function mainPageLoadEmployeeOverlay() {
                parent.loadEmployeeOverlay();
            }
        </script>
    </body>
</html>
