import Model.Utilisateur;
import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;
import java.util.Map;

public class main {
    public static void main(String[] args) {

        /*
        JdbcTemplate db=new JdbcTemplate(JDBCUtils.getDataSource());
        String sql="select* from allouer";
        List<Map<String,Object>> list=db.queryForList(sql);
        for (Map<String,Object> m:list
             ) {
            for (String s:m.keySet()
                 ) {
                System.out.println(m.get(s));
            }
        }*/

        JdbcTemplate db=new JdbcTemplate(JDBCUtils.getDataSource());
        String sql="select* from utilisateur";
        List<Utilisateur> list=db.query(sql,new BeanPropertyRowMapper<Utilisateur>(Utilisateur.class));
        for (Utilisateur u:list
             ) {
            System.out.println(u);
        }

    }
}
