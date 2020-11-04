<%--
  Created by IntelliJ IDEA.
  User: woshi
  Date: 2020/11/3
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Machine</title>
    <!-- Accepter les caractères spécieaux -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--Logo icon ut1 capitole-->
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <!-- Style de la barre de navigation de bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <!-- Le fichier est associé à styleAccueil.css qui est chargé de la mise en forme-->
    <link rel="stylesheet" href="CSS/styleForm.css">

    <!-- Javascript qui renvoie un message quand on veut quitter une page-->
    <script type="text/javascript" name="confirm_quit">
        window.onbeforeunload = function(){
            return confirm("");
        }
    </script>
    <!--Javascript qui permet d'enveler le message de confirmation pour quitter la page lorsqu'on click sur le bouton Enregistrer-->
    <script type="text/javascript" name="no_confirm_quit">
        function noconfirm() {window.onbeforeunload = function(){}}
    </script>
</head>
<body>
<!-- Création de la barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #B22222;">

    <a class="navbar-brand" href="accueil.html"><img src="Images/logo_grid.gif" alt="Logo ut1"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link disabled" href="accueil.html" style="color:#FFFFFF;">Mes reservations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="reclamation.html" style="color:#FFFFFF;">Réclamation</a>
            </li>

        </ul>
        <a class="nav-link disabled" href="" style="color:#FFFFFF;">Déconnexion</a>
    </div>
</nav>
<div id="global">
    <form method="get" action="/GestionMachine/ServletChercheSalle">

        <h2>Veuillez choisir une periode: </h2>
        <!--Champ pour la date-->
        <label for="date">Date:</label>
        <input id="date" type="date" name="date" value="2020-10-20">
        <!--Champ pour le créneau horaire-->
        <label for="etat">Créneau horaire :</label>
        <select name="periode">
            <option value ="1">8:00-9:30</option>
            <option value ="2">9:30-11:00</option>
            <option value="3">11:00-12:30</option>
            <option value="4">12:30-14:00</option>
            <option value="5">14:00-15:30</option>
            <option value="6">15:30-17:00</option>
            <option value="7">17:00-18:30</option>

        </select>

        </br>
        <!--Conteneur des boutons Enregistrer et Supprimer-->
        <div id='conteneurBouton'>
            <!-- Création du bouton Enregistrer de type Submit-->
            <input type="submit" id="enregistrer" value="Enregistrer" name="Enregistrer" onclick="return noconfirm()" class="bouton"/>
            <!-- Création du bouton Supprimer de type Reset-->
            <input type="reset" value="Vider" name="Vider" onclick="return confirm('Voulez vous vraiment vider tous les champs?')" class="bouton" />
        </div>
    </form>
</div>

</body>
</html>