package Controller;

import Model.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletConsulterFor")
public class ServletConsulterFor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        Utilisateur utilisateur = new Utilisateur();
        String ajouter = request.getParameter("ajouter");

        if(ajouter.equals("0")){
            String codeG = request.getParameter("nomTP");
            session.setAttribute("codeG", codeG);
            List<Utilisateur> lstU = utilisateur.lstEtu(codeG);
            request.setAttribute("lstU", lstU);
            request.setAttribute("add", "pasfait");
            request.getRequestDispatcher("listeEtudiants.jsp").forward(request, response);
        }else if(ajouter.equals("1")){
            String idG=(String) session.getAttribute("codeG");
            String idU=request.getParameter("identifiantU");
            String nom=request.getParameter("nomU");
            String prenom=request.getParameter("prenomU");
            Boolean res=utilisateur.addEtu(idU,nom,prenom,idG);
            if(res==true){
                request.setAttribute("add", "ok");
            }else{
                request.setAttribute("add", "pasok");
            }

            List<Utilisateur> lstU = utilisateur.lstEtu(idG);
            request.setAttribute("lstU", lstU);
            request.getRequestDispatcher("listeEtudiants.jsp").forward(request, response);
        }else if(ajouter.equals("2")){
            request.setAttribute("add", "pasfait");
            String idG=(String) session.getAttribute("codeG");
            List<Utilisateur> lstU = utilisateur.lstEtu(idG);
            request.setAttribute("lstU", lstU);
            request.getRequestDispatcher("listeEtudiants.jsp").forward(request, response);
        }else if(ajouter.equals("3")){
            String idU=request.getParameter("idU");

            utilisateur.supprimerEtu(idU);
            utilisateur.supprimerEtu(idU);
            request.setAttribute("add", "pasfait");

            String codeG = (String) session.getAttribute("codeG");
            request.setAttribute("codeG", codeG);

            List<Utilisateur> lstU = utilisateur.lstEtu(codeG);
            request.setAttribute("lstU", lstU);

            request.getRequestDispatcher("/listeEtudiants.jsp").forward(request, response);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
