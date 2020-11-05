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

@WebServlet("/ServletSupprimerEtudiant")
public class ServletSupprimerEtudiant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String idU=request.getParameter("idU");

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.supprimerEtu(idU);
        HttpSession session = request.getSession(true);

        request.setAttribute("add", "pasfait");

        String codeG = (String) session.getAttribute("codeG");
        request.setAttribute("codeG", codeG);

        List<Utilisateur> lstU = utilisateur.lstEtu(codeG);
        request.setAttribute("lstU", lstU);

        request.getRequestDispatcher("/listeEtudiants.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
