package Controler;

import Model.Machine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletResMachine")
public class ServletResMachine extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String periode = request.getParameter("periode");
        String date = request.getParameter("date");
        String idU=request.getParameter("idU");
        String codeM=request.getParameter("idM");
        Machine machine=new Machine();
        machine.resMachine(periode,date,idU,codeM);
        response.addHeader("refresh", "0,URL = /GestionMachine/accueil.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
