package Controller;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletAnnulerCours")
public class ServletAnnulerCours extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String coursStr = request.getParameter("selectCours");
        String dateStr = request.getParameter("dateCours");
        String periodeCours = request.getParameter("periodeCours");

        String sql = "delete from allouer where codeTP = ? and date = ? and periode = ?;";
        JdbcTemplate jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());

        int nbLigne = jdbcTem.update(sql, coursStr, dateStr, periodeCours);

        if (nbLigne == 0){
            response.getWriter().write("<h3 align='center'>Echec!</h3>");
        }else {
            response.getWriter().write("<h3 align='center'>Reussie!</h3>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
