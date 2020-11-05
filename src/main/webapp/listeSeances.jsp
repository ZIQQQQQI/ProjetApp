<%@ page import="java.util.concurrent.ThreadPoolExecutor" %>
<%@ page import="Model.Tp" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Groupe" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 05/11/2020
  Time: 00:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des sceances</title>
</head>
<body>
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
            out.print("<p>Nombre d'etudiant total: " + tp.getNbEtuTotal(codeTP) + "</p>");
            out.print("<a class='bouton' href=choisirDateTp.jsp?codeTP="+ tp.getCodeTp()
                    + "&codeG=" + session.getAttribute("codeG") + "> Reserver</a>");
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
<%--                <th id="nbPasMachine">Nombre d'etudiants pas de machine</th>--%>
                <th id="annuler">Annuler</th>
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
                            +"> Annuler</a></td></tr>");
                }
            %>
        </table>
        </br>
    </div>
</body>
</html>
