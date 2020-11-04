<%@ page import="java.util.List" %>
<%@ page import="Model.Utilisateur" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="Outil.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 03/11/2020
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail de formation</title>
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
        <a class="nav-link disabled" href="accueilResp.jsp" style="color:#FFFFFF;">Page d'accueil</a>
        <a class="nav-link disabled" href="" style="color:#ffffff;">Déconnexion</a>
    </div>
</nav>

<!-- Création du tableau-->
<div id="conteneurTab">
    <%--<form name="supprimerEtu" method="get" action="/GestionMachine/ServletSupprimerEtudiant">--%>
        <h3>Liste des etudiants: </h3>

        <table id="lstEtudiant">
            <tr class="header">
                <th id="identifiantU">Numéro etudiant</th>
                <th id="nomU">Nom </th>
                <th id="prenomU">Prenom </th>
                <th id="supprimer">Supprimer</th>
            </tr>
            <!--Exemple de données. Il faut remplacer avec code java qui recupérer les vrais infos dans la bd-->

            <%
//                JdbcTemplate jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());
//                String codeG = (String)session.getAttribute("codeG"); //enregistrer un codeG dans session
//                String sql = "select identifiantU, nomU, prenomU from utilisateur where codeG =" + codeG + ";"; // trouver tous les étudiants d'un groupe
//
//                List<Utilisateur> lstU = jdbcTem.query(sql,new BeanPropertyRowMapper<>(Utilisateur.class));

                List<Utilisateur> lstU = (List<Utilisateur>) request.getAttribute("lstU");

                for (Utilisateur utilisateur : lstU) {
                    out.print("<tr><td>"+utilisateur.getIdentifiantU()+"</td>");
                    out.print("<td>"+utilisateur.getNomU()+"</td>");
                    out.print("<td>"+utilisateur.getPrenomU()+"</td>");
                    out.print("<td><a class='bouton' href=ServletSupprimerEtudiant?idU="+utilisateur.getIdentifiantU()
                            +"> Supprimer</a></td></tr>");
                }
            %>

<%--            <tr>--%>
<%--                <td>20202020</td>--%>
<%--                <td>CUSSAT-BLANC</td>--%>
<%--                <td>SYLVAIN</td>--%>
<%--                <td>--%>
<%--                    <input type="submit" name="submit" value="Supprimer" class="bouton">--%>
<%--&lt;%&ndash;                    <button class="bouton" type="button" class="bouton">Supprimer</button>&ndash;%&gt;--%>
<%--                </td>--%>
<%--            </tr>--%>
        </table>
<%--    </form>--%>


</div>
<hr>

<div id="ajouterEtu">
    <form name="ajoutEtudiant" method="get" action="/GestionMachine/ServletAjouterEtudiant">
        <h3>Ajouter un etudiant: </h3>

        <label>Numero etudiant :</label>
        <input type="text" name="txtNumEtu" size="15">

        <label>Mot de passe :</label>
        <input type="text" name="txtMdP" size="15">

        <label>Nom :</label>
        <input type="text" name="txtNom" size="15">

        <label>Prenom :</label>
        <input type="text" name="txtPrenom" size="15">

        <label>Type utilisateur :</label>
        <input type="text" name="txtTypeU" value="etudiant" size="10" disabled>

        <input type="submit" name="submit" value="Ajouter" class="bouton">
    </form>
</div>


</body>
</html>
