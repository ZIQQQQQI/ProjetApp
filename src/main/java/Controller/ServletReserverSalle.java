package Controller;

import Model.Salle;
import Model.Tp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/ServletReserverSalle")
public class ServletReserverSalle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        String codeG=(String) session.getAttribute("codeG");
        String codeTP =(String) session.getAttribute("codeTP");
        String codeS=request.getParameter("codeS");
        String date=request.getParameter("date");
        String periode=request.getParameter("periode");
        new Salle().reserveSalle(codeTP,codeS,codeG,date,periode);

        response.addHeader("refresh", "0,URL = /GestionMachine/listTp.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
