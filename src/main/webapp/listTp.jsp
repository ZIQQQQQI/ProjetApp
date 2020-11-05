<%@ page import="Model.Tp" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: woshi
  Date: 2020/11/4
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List TP</title>
</head>
<body>
<%
    String codeG=(String) session.getAttribute("codeG");
    Tp tp=new Tp();
    List<Tp> list=tp.listTP("codeG");

%>
<table>
    <tr>
        <th>Nom de Tp</th>
    </tr>

    <%
        for (Tp t:list
        ) {
            out.print("<tr><td><a href=a?idp="+t.getCodeTp()+" >"+t.getNomTP()+"</a></td></tr>");
        }
    %>
</table>

</body>
</html>
