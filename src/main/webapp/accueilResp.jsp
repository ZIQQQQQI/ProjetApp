<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 03/11/2020
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation Machine TP</title>
    <!-- Accepter les caractères spécieaux -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--Logo icon ut1 capitole-->
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <!-- Style de la barre de navigation de bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <!-- Le fichier est associé à styleAccueil.css qui est chargé de la mise en forme-->
    <link rel="stylesheet" href="CSS/styleAccueil.css">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
</head>
<body>
<!-- Création de la barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #B22222;">

    <a class="navbar-brand" href="accueilResp.jsp"><img src="Images/logo_grid.gif" alt="Logo ut1"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <a class="nav-link disabled" href="" style="color:#ffffff;">Déconnexion</a>
    </div>
</nav>

<div id="foctResp">
    <!--
    <button class="bouton" type="button" onclick="window.location.href = 'formAjoutEtu.html';"> Ajouter un étudiant </button>
    -->

    <form name="consult" method="get" action="detailFormation.jsp">
        <h3>Consulter une formation:</h3>
        <label>Groupe: </label>
        <select name="selectFormation"> <%--utiliser rqt--%>
            <option value="g1">Groupe 1</option>
            <option value="g2">Groupe 2</option>
        </select>
        <input type="submit" name="submit" value="Consulter" class="bouton" />
    </form>
    <HR size="10">

    <form name="annulerCours" method="get" action="/GestionMachine/ServletAnnulerCours">
        <h3>Annuler un cours:</h3>
        <label>TP: </label>
        <select name="selectCours" id="selectCours"> <%--utiliser rqt--%>
            <option value="1">TP groupe 1</option>
            <option value="2">TP groupe 2</option>
        </select>

        <label>Date: </label>
        <input type="date" id="dateCours" name="dateCours">

        <label>Heure de debut et heure de fin: </label>
        <select name="periodeCours" id="periodeCours">
            <option value="1">8:00 - 9:30</option>
            <option value="2">9:30 - 11:00</option>
            <option value="3">11:00 - 12:30</option>
            <option value="4">12:30 - 14:00</option>
            <option value="5">14:00 - 15:30</option>
            <option value="6">15:30 - 17:00</option>
            <option value="7">17:00 - 18:30</option>
            <option value="8">18:30 - 20:00</option>
        </select>

        <input type="submit" name="submit" value="Annuler" class="bouton" />
<%--        <button class="bouton" type="button" onclick="window.location.href = 'formAnnulerCours.jsp';"> Annuler un cours </button>--%>
    </form>
    <HR size="10">




    <form name="reserverSalle" method="get" action="/GestionMachine/ServletReserverSalle">
        <h3>Reserver une salle pour un TP:</h3>

        <label for="selectFormation">Groupe :</label>
        <select name="selectFormation" id="selectFormation"> <%--utiliser rqt--%>
            <option value="1">Groupe 1</option>
            <option value="2">Groupe 2</option>
        </select>
<%--        <input type="text" name="nomG" id="nomG" value="" readonly="readonly"/><!--Le nom du groupe doit être rempli automatiquement-->--%>

        <!--Champ qui contient la liste des TP du groupe du responsable
				Récuperer les vrais valeurs dans la BD-->
        <label <%--for="etat"--%>>TP :</label>
        <select name="codeTP" id="codeTP">
            <!--Value=codeTP-->
            <option value="1"> Programmation M2 Miage IPM Grp1<!--On affiche ici nomTP--></option>
        </select>

        <!--Champ qui contient la liste des salles libres
            Récuperer les vrais valeurs dans la BD-->
        <label <%--for="etat"--%>>Salles:</label>
        <select name="numS" id="numS">
            <!--Value=codeS-->
            <option value="1"> ME401<!--On affiche ici numS--></option>
        </select>

        <!--Champ de la date de la réservation-->
        <label <%--for="etat"--%>>Date de la réservation :</label>
        <input type="date" id="dateR" name="dateR">

        <!--Champ qui contient l'heure-->
        <label <%--for="etat"--%>>Heure de début :</label>
        <select name="heureDebR" id="heureDebR">
            <!--Value=codeM-->
            <option value="8:00">8:00</option>
            <option value="9:30">9:30</option>
            <option value="11:00">11:00</option>
            <option value="12:30">12:30</option>
            <option value="14:00">14:00</option>
            <option value="15:30">15:30</option>
            <option value="17:00">17:00</option>
            <option value="18:30">18:30</option>
        </select>
        <!--Champ qui contient l'heure-->
        <label <%--for="etat"--%>>Heure de fin :</label>
        <select name="heureDebR" id="heureFinR">
            <!--Value=codeM-->
            <option value="9:30">9:30</option>
            <option value="11:00">11:00</option>
            <option value="12:30">12:30</option>
            <option value="14:00">14:00</option>
            <option value="15:30">15:30</option>
            <option value="17:00">17:00</option>
            <option value="18:30">18:30</option>
            <option value="20:00">20:00</option>
        </select>

        <input type="submit" name="submit" value="Reserver" class="bouton" />
    </form>
    <HR size="10">


    <form name="consultTauxOcc" method="get" action="">
        <h3>Consulter le taux d'occupation d'une salle: </h3>

    </form>




</div>




</body>
</html>
