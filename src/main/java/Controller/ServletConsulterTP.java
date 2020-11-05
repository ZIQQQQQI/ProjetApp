package Controller;

import Model.Groupe;
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

@WebServlet("/ServletConsulterTP")
public class ServletConsulterTP extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);

      String codeTP = request.getParameter("codeTP");
        session.setAttribute("codeTP", codeTP);
        


        Tp tp = new Tp().getTP(codeTP);

        request.setAttribute("tp", tp);
//        List<Map<String, Object>> lstSeance = tp.lstSeances(codeTP);
//        request.setAttribute("lstSeance", lstSeance);

        List<Map<String, Object>> lstSeance = tp.lstSeancesNouveau(codeTP);
        request.setAttribute("lstSeance", lstSeance);

        session.setAttribute("codeTP", codeTP);
        request.getRequestDispatcher("/listeSeances.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
