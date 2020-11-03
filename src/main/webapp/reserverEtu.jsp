<%--
  Created by IntelliJ IDEA.
  User: woshi
  Date: 2020/11/3
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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

    <a class="navbar-brand" href="accueil.html"><img src="Images/logo_grid.gif" alt="Logo ut1"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!--
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
           <ul class="navbar-nav mr-auto">
               <li class="nav-item">
                   <a class="nav-link disabled" href="accueil.html" style="color:#FFFFFF;">Mes reservations</a>
               </              <li class="nav-item">
                 --  <a class="nav-link disabled" href="reclamation.html" style="color:#FFFFFF;">Réclamation</a>
                 </li> -->

    </ul>
    <a class="nav-link disabled" href="" style="color:#FFFFFF;">Déconnexion</a>
    </div> -->
</nav>

<div id="global">
    <!-- Création du bouton Ajouter PA -->
    <div id="creer">
        <!-- <button class="bouton" type="button" onclick="window.location.href = 'reserver.html';"> Réserver une machine </button>
         -->
    </div>
    <br/>
    <div id="titrePage">
        <!-- Titre du tableau-->
        <h2>Liste des salles libre pour vous :</h2>
    </div>
    <h3>Date que vous avez choisi:2020-10-31 8:00-9:30</h3>
    <select>
        <option value ="Me401">ME401</option>
        <option value ="Me402">ME402</option>
        <option value="Me403">Me403</option>
        <option value="Me301">Me301</option>
    </select>

    <h3>
        Attention!Votre salle est : ME401  Etat:Pas complet
    </h3>

    <h2>Liste des ordinateurs de cette salle  :</h2>
    <!-- Création du tableau-->
    <div id="conteneurTab">
        <table id="myTable">
            <tr class="header">
                <th id="numM">Numéro machine</th>
                <th id="numS">Numéro salle</th>
                <th id="DateR">Nom_Etudiant </th>
                <th id="HeureDebR">Promotion </th><!--On a pas besoin? -->
                <th id="HeureFinR">Disponibilite </th><!--On a pas besoin? -->
                <th id="">Heure limite </th>
                <th class="annuler"></th>
                <th class="annuler"></th>
            </tr>
            <!--Exemple de données. Il faut remplacer avec code java qui recupérer les vrais infos dans la bd-->
            <tr>
                <td>A16763</td>
                <td>ME401</td>
                <td>TANG</td>
                <td>IPM-G1</td>
                <td>Occupe</td>
                <td>null</td>
                <td>
                    <button class="bouton" type="button"> Utiliser</button>
                </td>

            </tr>
            <tr>
                <td>A17671</td>
                <td>ME401</td>
                <td>null</td>
                <td>IPM-G2</td>
                <td>Dispo</td>
                <td>17:00</td>
                <td >
                    <button class="bouton" type="button"> Utiliser</button>
                </td>
            </tr>
        </table>
    </div>

</body>
</html>
