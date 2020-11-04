package Controller;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletSupprimerEtudiant")
public class ServletSupprimerEtudiant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String idU=request.getParameter("idU");

        String sqlReser = "delete from reserver where identifiantU = ?;";
        String sqlEtu = "delete from utilisateur where identifiantU = ?;";

        JdbcTemplate jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());
        jdbcTem.update(sqlReser,idU);
        jdbcTem.update(sqlEtu,idU);
        response.addHeader("refresh", "0,URL = /GestionMachine/detailFormation.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
