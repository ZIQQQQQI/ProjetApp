package Controller;

import Model.Tp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/ServletAnnulerCours")
public class ServletAnnulerCours extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String codeTP = request.getParameter("codeTP");
        String numS = request.getParameter("numS");
        String date = request.getParameter("date");
        String description = request.getParameter("description");

        HttpSession session = request.getSession(true);
        String codeG = (String) session.getAttribute("codeG");

        Tp tp = new Tp();
        int nbLigne = tp.annulerCours(codeTP, numS, date, description, codeG);

        if (nbLigne == 0){
            response.getWriter().write("<h3 align='center'>Echec!</h3>");
            response.addHeader("refresh", "2, URL = /listeSeances.jsp");
        }else {
            request.getRequestDispatcher("/listeSeances.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
