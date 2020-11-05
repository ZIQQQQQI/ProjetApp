package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


public class Groupe {
    protected  Integer codeG;
    protected  String nomG;
    protected JdbcTemplate jdbcTem;

    public Groupe() {
        this.jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());
    }


    public Groupe getGroupe(String codeG){
        String sql = "select * from groupe where codeG=" + codeG;
        return this.jdbcTem.query(sql, new BeanPropertyRowMapper<Groupe>(Groupe.class)).get(0);
    }

    public Integer getCodeG() {
        return codeG;
    }

    public void setCodeG(Integer codeG) {
        this.codeG = codeG;
    }

    public String getNomG() {
        return nomG;
    }

    public void setNomG(String nomG) {
        this.nomG = nomG;
    }
}
