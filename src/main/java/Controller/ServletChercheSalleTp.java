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

@WebServlet( "/ServletChercheSalleTp")
public class ServletChercheSalleTp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        request.setCharacterEncoding("utf-8");
        String periode=request.getParameter("periode");
        String date=request.getParameter("date");
        String codeTp=request.getParameter("codeTp");
        Salle salle=new Salle();
        List<Map<String,Object>> list=salle.trouveSalleLibre(periode,date);
        request.setAttribute("codeTp", codeTp);

        request.setAttribute("lstS", list);
        request.getRequestDispatcher("/listSalleLibreTp.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
