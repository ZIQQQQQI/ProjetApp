package Controller;

import Model.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ServletAddEtu")
public class ServletAddEtu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        String idG=(String) session.getAttribute("codeG");
        String idU=request.getParameter("identifiantU");
        String mdp=request.getParameter("motdepasseU");
        String nom=request.getParameter("nomU");
        String prenom=request.getParameter("prenomU");
        Utilisateur utilisateur=new Utilisateur();
        Boolean res=utilisateur.addEtu(idU,nom,prenom,idG);
         if(res){

            // response.addHeader("refresh", "0,URL = /GestionMachine/listeEtudiants.jsp");
         }else{
             response.getWriter().print("<h3>exist</h3>");
             response.addHeader("refresh", "3,URL = /GestionMachine/listeEtudiants.jsp");
         }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
