package Controller;

import Model.Utilisateur;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String login = request.getParameter("login");
        String mdp = request.getParameter("motdepasse");

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setIdentifiantU(login);
        utilisateur.setMotdepasseU(mdp);

        Utilisateur user= utilisateur.login(login, mdp);

        if(user != null){
            HttpSession session = request.getSession(true);
            // String id = (String)session.getAttribute("id");
            session.setAttribute("id", login);
            if(user.getTypeU().equals("etudiant")){
                response.addHeader("refresh", "0,URL = /GestionMachine/accueil.jsp");
            }else if(user.getTypeU().equals("responsable")){
                response.addHeader("refresh", "0,URL = /GestionMachine/accueil_responsable.jsp");
            }
        }else {
            response.getWriter().write("<h3 align=\"center\">Connexion échec!</h3>");
            response.addHeader("refresh", "2,URL = /GestionMachine");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
