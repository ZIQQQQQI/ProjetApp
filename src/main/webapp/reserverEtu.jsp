<%@ page import="java.util.List" %>
<%@ page import="Model.Salle" %>
<%@ page import="Model.Machine" %><%--
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
    <title>R&eacute;servation Machine</title>
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

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link disabled" href="accueil.html" style="color:#FFFFFF;">Mes r&eacute;servations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="reclamation.html" style="color:#FFFFFF;">R&eacute;clamation</a>
            </li>
        </ul>

        <a class="nav-link disabled" href="" style="color:#FFFFFF;">D&eacute;connexion</a>

    </div>
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
        <h2>Liste des salles libres pour vous :</h2>
        <FORM action="/GestionMachine/ServletChercheSalle" method="get">
            <%
                String date=request.getParameter("date");
                String periode=request.getParameter("periode");
                out.print("<input name=date type=hidden value="+date+"></input>");
                out.print("<input name=periode type=hidden value="+periode+"></input>");

            %>
            <select name="salle">
                <%
                    String id=(String)session.getAttribute("id");
                    List<Salle> list = (List<Salle>) request.getAttribute("list");
                    for (Salle salle : list) {
                        out.print("<option value="+salle.getCodeS()+">"+salle.getNumS()+"</option>");
                    }

                %>
            </select>
            <INPUT TYPE="submit" class="bouton">Chercher les ordinateurs disponibles</INPUT>
        </FORM>
    </div>





    <h2>Liste des ordinateurs de cette salle  :</h2>

    <%
        Salle salle = (Salle) request.getAttribute("salle");
    %>
    <!-- Création du tableau-->
    <div id="conteneurTab">
        <table id="myTable">
            <tr class="header">
                <th id="numM">Num&eacute;ro machine</th>


                <th id="HeureFinR">Disponibilit&eacute; </th><!--On a pas besoin? -->

                <th class="annuler"></th>

            </tr>
            <!--Exemple de données. Il faut remplacer avec code java qui recupérer les vrais infos dans la bd-->

            <%
                List<Machine> machine;


                machine = (List<Machine>) request.getAttribute("machine");

                for (Machine m:machine
                     ) {
                    out.print("<tr><td>"+m.getNumM()+"</td>");
                    out.print("<td>Dispo</td>");
                    out.print("<td><a class='bouton' href=ServletResMachine?idM="+m.getCodeM()
                            +"&date="+date+"&periode="+periode+"&idU="+id+"> Utiliser</a></td></tr>");
                }
            %>


        </table>
    </div>

</body>
</html>
