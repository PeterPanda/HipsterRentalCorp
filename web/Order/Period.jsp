<%-- 
    Document   : Period
    Created on : 28.10.2015, 08:41:38
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Period</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#fromDate").datepicker({
                    minDate: new Date(),
                    dateFormat: "dd.mm.yy"
                });
            });
            $(function () {
                $("#tillDate").datepicker({
                    minDate: new Date(),
                    dateFormat: "dd.mm.yy"
                });
            });

            function calculateCost() {
                var rent = '<%= session.getAttribute("rent")%>';

                var from = getFrom();
                var till = getTill();

                /* Calculate the final costs */
                var diff = Math.abs(till - from);
                diff = diff / 1000 / 60 / 60 / 24;
                diff = Math.ceil(diff);
                var cost = diff * rent;
                cost = cost.toFixed(2);
                $('#cost').html(cost + ' €');
            }

            function validate() {
                var from = document.getElementById('fromDate');
                var till = document.getElementById('tillDate');
                if (from.value.length === 0 || till.value.length === 0) {
                    alert("Bitte geben Sie einen korrekten Zeitraum an.");
                } else {
                    parent.createOrder(getFrom(), getTill());
                }
            }

            function getFrom() {
                /* Get the 'timestamp' attribute for the order */
                var fd = $('#fromDate').val();
                var ft = $('#fromTime').val();

                var splitfromdate = fd.split('.');
                var splitfromtime = ft.split(':');

                var from = new Date(splitfromdate[2], splitfromdate[1] - 1, splitfromdate[0], splitfromtime[0], splitfromtime[1], '0');
                return from;
            }
            function getTill() {
                /* Get the 'timestamp' attributes for the order */
                var td = $('#tillDate').val();
                var tt = $('#tillTime').val();

                var splittilldate = td.split('.');
                var splittilltime = tt.split(':');

                var till = new Date(splittilldate[2], splittilldate[1] - 1, splittilldate[0], splittilltime[0], splittilltime[1], '0');
                return till;
            }

        </script>
    </head>
    <body>
        <div>
            <p>Wählen Sie den Zeitraum Ihrer Bestellung:</p>
            <table>
                <tbody>
                    <tr>
                        <td>
                            Von:
                        </td>
                        <td>
                            <input type="date" id="fromDate" onchange="calculateCost()">
                        </td>
                        <td>
                            <form action="#"> 
                                <select id="fromTime" onchange="calculateCost()"> 
                                    <option>06:00</option> 
                                    <option>06:30</option> 
                                    <option>07:00</option> 
                                    <option>07:30</option>
                                    <option>08:00</option> 
                                    <option>08:30</option>
                                    <option>09:00</option> 
                                    <option>09:30</option>
                                    <option>10:00</option> 
                                    <option>10:30</option>
                                    <option>11:00</option> 
                                    <option>11:30</option>
                                    <option>12:00</option> 
                                    <option>12:30</option>
                                    <option>13:00</option> 
                                    <option>13:30</option>
                                    <option>14:00</option> 
                                    <option>14:30</option>
                                    <option>15:00</option> 
                                    <option>15:30</option>
                                    <option>16:00</option> 
                                    <option>16:30</option>
                                    <option>17:00</option> 
                                    <option>17:30</option>
                                </select> 
                            </form> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Bis:
                        </td>
                        <td>
                            <input type="date" id="tillDate" onchange="calculateCost()">
                        </td>
                        <td>
                            <form action="#"> 
                                <select id="tillTime" onchange="calculateCost()"> 
                                    <option>13:00</option> 
                                    <option>13:30</option>
                                    <option>14:00</option> 
                                    <option>14:30</option>
                                    <option>15:00</option> 
                                    <option>15:30</option>
                                    <option>16:00</option> 
                                    <option>16:30</option>
                                    <option>17:00</option>
                                </select> 
                            </form> 
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Kosten:</td>
                        <td><p id="cost"></p></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><button onclick="validate()">Bestellen</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
