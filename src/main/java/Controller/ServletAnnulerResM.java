package Controller;

import Model.Machine;
import Model.Utilisateur;

import javax.print.DocFlavor;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletAnnulerResM")
public class ServletAnnulerResM extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String date=request.getParameter("date");
        String periode=request.getParameter("periode");
        String idU=request.getParameter("idU");
        String idM=request.getParameter("idM");
        Machine machine=new Machine();
        machine.supprimerResM(periode,date,idU,idM);
        response.addHeader("refresh", "0,URL = /GestionMachine/accueil.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
