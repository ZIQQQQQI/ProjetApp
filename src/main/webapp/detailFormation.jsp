<%--
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
</head>
<body>
<!-- Création du tableau-->
<div id="conteneurTab">
    <table id="lstEtudiant">
        <tr class="header">
            <th id="identifiantU">Numéro etudiant</th>
            <th id="nomU">Nom </th>
            <th id="prenomU">Prenom </th>
        </tr>
        <!--Exemple de données. Il faut remplacer avec code java qui recupérer les vrais infos dans la bd-->
        <tr>
            <td>20202020</td>
            <td>CUSSAT-BLANC</td>
            <td>SYLVAIN</td>
            <td>
                <button class="bouton" type="button" class="bouton"> supprimer</button>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
