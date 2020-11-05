<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Tp" %>
<%@ page import="Model.Groupe" %>
<html>
<head>
    <title>Liste des Seances de TP</title>
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
                <a class="nav-link disabled" href="listeEtudiants.jsp" style="color:#FFFFFF;">Consulter liste des Etudiants</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="consulterTP.jsp" style="color:#FFFFFF;">Consulter les TPs</a>
            </li>
        </ul>
        <a class="nav-link disabled" href="" style="color:#FFFFFF;">Déconnexion</a>
    </div>
</nav>

<div id="global">
    <div id="titrePage">
        <%
            String codeG = (String) session.getAttribute("codeG");

            Groupe groupe = new Groupe();
            out.print("<h2>Groupe: " + groupe.getGroupe(codeG).getNomG() + "</h2>");

        %>
    </div>

    <div id="titrePage">
        <%
            String codeTP = (String) session.getAttribute("codeTP");
            Tp tp = (Tp) request.getAttribute("tp");

            out.print("<p>Nom de TP: " + tp.getNomTP() + "</p>");

            out.print("<p>Nombre d'etudiant total: " + tp.getNbEtuTotal(codeTP).get("nb_total") + "</p>");
            out.print("<a class='bouton' href=choisirDateTp?codeTP="+ tp.getCodeTp()
                    + "&codeG=" + session.getAttribute("codeG") + "> Reserver une salle</a>");

        %>
    </div>


    <div id="conteneurTab">
        <h2>Liste des seances: </h2>
        <table id="myTable">
            <tr class="header">
                <th id="salleC">Salle</th>
                <th id="dateC">Date</th>
                <th id="periodeC">Créneau Horaire </th>
                <th id="nbReser">Nombre machine deja reservees </th>
                <%--                <th id="nbPasMachine">Nombre d'etudiants sans machine</th>--%>
                <th id="annuler"></th>
            </tr>

            <%
                List<Map<String, Object>> lstSeance = (List<Map<String, Object>>) request.getAttribute("lstSeance");

                for (Map<String, Object> seance : lstSeance) {
                    out.print("<tr><td>"+seance.get("numS")+"</td>");
                    out.print("<td>"+seance.get("date")+"</td>");
                    out.print("<td>"+seance.get("description")+"</td>");
                    out.print("<td>"+seance.get("nb_reserve")+"</td>");
//                    out.print("<td>"+seance.get("nbPasMachine")+"</td>");
                    out.print("<td><a class='bouton' href=ServletAnnulerCours?codeTP="+ tp.getCodeTp()
                            + "&numS=" + seance.get("numS") + "&date=" + seance.get("date") + "&description=" +
                            seance.get("description") + "> Annuler</a></td></tr>");


//                    codeTP, numS, date, description, codeG
////                    request.setAttribute("seance", seance);
////                    request.getRequestDispatcher("/GestionMachine/ServletAnnulerCours").forward(request,response);
                }
            %>
        </table>
        </br>
    </div>
</div>
</body>
</html>
