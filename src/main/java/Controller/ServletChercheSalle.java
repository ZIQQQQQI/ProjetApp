package Controller;

import Model.Machine;
import Model.Salle;
import Model.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletChercheSalle")
public class ServletChercheSalle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setHeader("content-type", "text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        Integer id=(Integer) Integer.valueOf((String)session.getAttribute("id"));
        request.setCharacterEncoding("utf-8");
        String periode=request.getParameter("periode");
        String date=request.getParameter("date");
        Salle s=new Salle();
        List<Machine> machine;
        Utilisateur u=new Utilisateur();
        if(u.siRer(String.valueOf(id),date,periode)){
            response.getWriter().print("<h3>Vous avez deja reserver pour ca</h3>");
            response.addHeader("refresh", "3,URL = /GestionMachine/accueil.jsp");
        }else{
            List<Salle> list= s.trouveListeDeSalle(date,periode,id);
            if(!list.isEmpty()){
                request.setAttribute("list", list);
                Integer idS=list.get(0).getCodeS();
                if(request.getParameter("salle")!=null){
                    idS=Integer.parseInt(request.getParameter("salle"))  ;
                }



                machine=new Machine().trouerMachineLibre(idS,periode,date);

                request.setAttribute("machine",machine);
                request.getRequestDispatcher("reserverEtu.jsp").forward(request, response);
        }


        }


}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
