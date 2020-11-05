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
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <th>Nom</th>
        <th>Nb</th>
        <th>Nb utlise</th>
        <th>Reserver</th>
    </tr>
    <%
        List<Map<String,Object>> list=(List<Map<String,Object>>) request.getAttribute("lstS");
        for (Map<String,Object> m:list
        ) {
            out.print("<tr><td>"+(String) m.get("numS")+"</td>");
            out.print("<td>"+(Long) m.get("nbtotal")+"</td>");
            out.print("<td>"+(Long)m.get("nbreservee")+"</td>");
            out.print("<td><a href=>Reserver</a></td></tr>");
        }

    %>

</table>


</body>
</html>
