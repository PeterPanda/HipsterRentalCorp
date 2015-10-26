<%-- 
    Document   : RegistrationForm
    Created on : 26.10.2015, 12:31:52
    Author     : janFk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistrationForm</title>
    </head>
    <body>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td>Vorname*:</td>
                        <td><input type='text' name='inputVorname' required="true"></td>
                    </tr>
                    <tr>
                        <td>Nachname*:</td>
                        <td><input type='text' name='inputNachname' required="true"></td>
                    </tr>
                    <tr>
                        <td>Email*:</td>
                        <td><input type='text' name='inputEmail' required="true"></td>
                    </tr>
                    <tr>
                        <td>Passwort*:</td>
                        <td><input type='text' name='inputPasswort' required="true"></td>
                    </tr>
                    <tr>
                        <td>Passwort wiederholen*:</td>
                        <td><input type='text' name='inputPasswortWDH' required="true"></td>
                    </tr>
                    <tr>
                        <td>Organisation:</td>
                        <td><input type='text' name='inputOrganisation'></td>
                    </tr>
                    <tr>
                        <td>Ort*:</td>
                        <td><input type='text' name='inputOrt' required="true"></td>
                    </tr>
                    <tr>
                        <td>PLZ*:</td>
                        <td><input type='text' name='inputPLZ' required="true"></td>
                    </tr>
                    <tr>
                        <td>Strasse*:</td>
                        <td><input type='text' name='inputStrasse' required="true"></td>
                    </tr>
                    <tr>
                        <td>Hausnummer*:</td>
                        <td><input type='text' name='inputHausnummer' required="true"></td>
                    </tr>
                    <tr>
                        <td>Telefonnummer*:</td>
                        <td><input type='text' name='inputTelefonnummer' required="true"></td>
                    </tr>
                    <tr>
                        <td>Handynummer:</td>
                        <td><input type='text' name='inputHandynummer'></td>
                    </tr>
                    <tr>
                        <td><button type="submit">Registrieren</button></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <p>*Pflichtfeld</p>
        </div>
    </body>
</html>
