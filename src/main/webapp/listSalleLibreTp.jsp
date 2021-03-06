<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: woshi
  Date: 2020/11/5
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Salle libre</title>
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

    <a class="navbar-brand" href="accueil_responsable.jsp"><img src="Images/logo_grid.gif" alt="Logo ut1"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link disabled" href="accueil_responsable.jsp" style="color:#FFFFFF;">Accueil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="ServletConsulterFor?ajouter=2" style="color:#FFFFFF;">Consulter liste des Etudiants</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="listTp.jsp" style="color:#FFFFFF;">Consulter les TPs</a>
            </li>
            </li>
        </ul>
        <a class="nav-link disabled" href="" style="color:#FFFFFF;">D&eacute;connexion</a>
    </div>
</nav>


<div id="global">
    <table border="1">
        <tr>
            <th>Nom</th>
            <th>Nombre total de machine</th>
            <th>Nombre de machines libres</th>
            <th></th>
        </tr>
        <%
            String date=request.getParameter("date");
            String periode=request.getParameter("periode");
            List<Map<String,Object>> list=(List<Map<String,Object>>) request.getAttribute("lstS");
            for (Map<String,Object> m:list
            ) {
                out.print("<tr><td>"+(String) m.get("numS")+"</td>");
                out.print("<td>"+(Long) m.get("nbtotal")+"</td>");
                out.print("<td>"+(Long)m.get("nbreservee")+"</td>");
                out.print("<td><a class='bouton' href=ServletReserverSalle?codeS="+m.get("codeS")+"&date="+date+"&periode="+periode+">Reserver</a></td></tr>");
            }

        %>

    </table>
</div>



</body>
</html>
