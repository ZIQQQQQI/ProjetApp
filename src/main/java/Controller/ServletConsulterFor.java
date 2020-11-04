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
        request.setCharacterEncoding("utf-8");
        String codeG = request.getParameter("selectFormation");
        HttpSession session = request.getSession(true);
        session.setAttribute("codeG", codeG);
        Utilisateur utilisateur = new Utilisateur();

        List<Utilisateur> lstU = utilisateur.lstEtu(codeG);
        request.setAttribute("lstU", lstU);

        request.getRequestDispatcher("listeEtudiants.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
