<%-- 
    Document   : OrderView
    Created on : 26.10.2015, 15:26:32
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OrderView</title>
    </head>
    <body onload="loadOrderTable();">
        <h1>Bestellungen</h1>
        <div id="divOrderTable">
        </div>
        <script>
            function loadOrderTable() {
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        var data = xhr.responseText;
                        document.getElementById('divOrderTable').innerHTML = data;
                    }
                };
                xhr.open('GET', '/HipsterRentalCorp/LoadOrdersServlet', true);
                xhr.send(null);
            }
        </script>
    </body>
</html>
