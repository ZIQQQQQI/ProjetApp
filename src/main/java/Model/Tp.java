package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class Tp {
    protected JdbcTemplate jdbcTem;
    protected Integer codeTp;
    protected String nomTP;
    protected String codeG;

    public Tp() {
        this.jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());

    }



    public List<Tp> listTP(String codeG){
        String sql="select distinct * from tp where codeG="+codeG;
        return this.jdbcTem.query(sql,new BeanPropertyRowMapper<>(Tp.class));


    }


    public Tp getTP(String codeTP){
        String sql = "select * from tp where codeTP=" + codeTP;
        return this.jdbcTem.query(sql, new BeanPropertyRowMapper<Tp>(Tp.class)).get(0);
    }

    public int getNbEtuTotal(String codeTP){
        return 0;
    }


    public List<Map<String, Object>> lstSeances(String codeTP){
        String sql = "select tp.nomTP, s.numS, a.date, cp.description, count(u.identifiantU) as nb_total, table1.nb_reserve " +
                "from tp, utilisateur as u, allouer as a, salle as s, calenperiode as cp, " +
                "(select count(r.identifiantU) as nb_reserve, a.date, a.periode from allouer as a, reserver as r, utilisateur as u  " +
                "where u.identifiantU = r.identifiantU and a.codeG = u.codeG  and a.codeTP = ? and r.date = a.date and r.periode = a.periode " +
                "and r.periode = a.periode group by u.codeG,a.date, a.periode) as table1 where tp.codeG = u.codeG  and tp.codeTP=a.codeTP " +
                "and a.codeS = s.codeS and cp.periode = a.periode and tp.codetp = ?  and table1.date = a.date and table1.periode = a.periode " +
                "group by u.codeG, a.date, a.periode, a.codeS, a.codeTP,tp.nomTP, s.numS, a.periode, cp.description, table1.date, table1.periode, table1.nb_reserve ";
        return  this.jdbcTem.queryForList(sql, codeTP, codeTP);
    }











    //get et set
    public Integer getCodeTp() {
        return codeTp;
    }

    public void setCodeTp(Integer codeTp) {
        this.codeTp = codeTp;
    }

    public String getNomTP() {
        return nomTP;
    }

    public void setNomTP(String nomTP) {
        this.nomTP = nomTP;
    }
    public void setCodeG(String codeG) {
        this.codeG = codeG;
    }
    public String getCodeG() {
        return codeG;
    }

}


