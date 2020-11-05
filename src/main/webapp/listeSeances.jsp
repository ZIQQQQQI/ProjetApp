<%@ page import="java.util.concurrent.ThreadPoolExecutor" %>
<%@ page import="Model.Tp" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 05/11/2020
  Time: 00:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="titrePage">
        <%
            String codeG = (String) request.getAttribute("codeG");
            out.print("<h2>Groupe: " + codeG + "</h2>");
        %>
    </div>

    <div id="titrePage">
        <%
            String codeTP = (String) request.getAttribute("codeTP");
            Tp tp = (Tp) request.getAttribute("tp");
            out.print("<p>Nom de TP: " + tp.getNomTP() + "</p>");
            out.print("<p>Nombre d'etudiant total: " + tp.getNbEtuTotal(codeTP) + "</p>");
//            out.print("<a class='bouton' href=******************?codeTP="+ tp.getCodeTp()
//                    + "&codeG=" + codeG + "> Annuler</a>");
        %>
    </div>


    <div id="conteneurTab">
        <h2>Liste des seances: </h2>
        <table id="myTable">
            <tr class="header">
                <th id="salleC">Salle</th>
                <th id="dateC">Date</th>
                <th id="periodeC">Heure de debut et heure de fin </th>
                <th id="nbReser">Nombre d'etudiants deja reserves </th>
                <th id="nbPasMachine">Nombre d'etudiants pas de machine</th>
                <th id="annuler">Annuler</th>
            </tr>

            <%
                List<Map<String, Object>> lstSeances = tp.lstSeances(codeTP);

                for (Map<String, Object> seance : lstSeances) {
                    for (int i = 0; i < 4; i++) {
                        out.print("<tr><td>"+seance.get("salle")+"</td>");
                        out.print("<td>"+seance.get("date")+"</td>");
                        out.print("<td>"+seance.get("periode")+"</td>");
                        out.print("<td>"+seance.get("nbEtuRes")+"</td>");
                        out.print("<td>"+seance.get("nbPasMachine")+"</td>");
                        out.print("<td><a class='bouton' href=ServletAnnulerCours?codeTP="+ tp.getCodeTp()
                                +"> Annuler</a></td></tr>");
                    }
                }

            %>
        </table>
        </br>
    </div>

</body>
</html>
