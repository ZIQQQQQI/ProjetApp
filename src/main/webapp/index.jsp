<%--
  Created by IntelliJ IDEA.
  User: woshi
  Date: 2020/11/2
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Resa Machine TP - Authentification</title>
    <!--Logo icon ut1 capitole-->
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <!-- Le fichier est associé à styleAuthentification.css qui est chagé de la mise en forme-->
    <link rel="stylesheet" href="CSS/styleAuthentification.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="ombre">
    <h2>Plateforme de réservation d'une machine</h2>
    <!-- Défintion des champs pour l'identifiant et le mot de passe -->
    <form method="get" action="/GestionMachine/ServletLogin">
        <fieldset>
            <legend class="entete">Identifiant : </legend>
            <div class="input_container">
                <span class="input_icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                <input type="text" name="login" required/>
            </div>
        </fieldset>

        <fieldset>
            <legend class="entete">Mot de passe : </legend>
            <div class="input_container">
                <span class="input_icon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                <input type="password" name="motdepasse" placeholder="********" required />
            </div>
            <br/>

        </fieldset>

        <br/>
        <input type="submit" name="submit" value="Se connecter" class="connection" />
    </form>
    <img src="Images/logo_ut1_auth.jpg" alt="Logo du site" id="logo">
</div>

</body>
</html>
