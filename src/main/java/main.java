import Model.Machine;
import Model.Salle;
import Model.Utilisateur;
import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;
import java.util.Map;

public class main {
    public static void main(String[] args) {

//        JdbcTemplate db=new JdbcTemplate(JDBCUtils.getDataSource());
//        String sql="select* from allouer";
//        List<Map<String,Object>> list=db.queryForList(sql);
//        for (Map<String,Object> m:list
//             ) {
//            for (String s:m.keySet()
//                 ) {
//                System.out.println(m.get(s));
//            }
//        }


        // utilisateur
        JdbcTemplate db=new JdbcTemplate(JDBCUtils.getDataSource());
        String sql="select* from utilisateur";
        List<Utilisateur> list=db.query(sql,new BeanPropertyRowMapper<>(Utilisateur.class));

        //afficher resultat utilisateur
        for (Utilisateur u:list
             ) {
            System.out.println(u);
        }


        // salle
        String sqlSalle="select* from salle";
        List<Salle> listSalle=db.query(sqlSalle,new BeanPropertyRowMapper<>(Salle.class));

        //afficher resultat salle
        for (Salle salle : listSalle) {
            System.out.println(salle);
        }


        // machine
        String sqlMachine="select* from machine";
        List<Machine> listMachine=db.query(sqlMachine,new BeanPropertyRowMapper<>(Machine.class));

        //afficher resultat machine
        for (Machine machine : listMachine) {
            System.out.println(machine);
        }


    }
}
