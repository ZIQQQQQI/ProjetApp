package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Date;
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


    public Map<String, Object> getNbEtuTotal(String codeTP){
        String sql = "select tp.nomTP, count(u.identifiantU) as nb_total from tp, utilisateur as u " +
                "where tp.codeG = u.codeG and tp.codetp = ? group by u.codeG";
        return this.jdbcTem.queryForList(sql, codeTP).get(0);
    }

    public List<Tp> listTP(String codeG){
        String sql="select distinct * from tp where codeG="+codeG;
        return this.jdbcTem.query(sql,new BeanPropertyRowMapper<>(Tp.class));
    }


    public Tp getTP(String codeTP){
        String sql = "select * from tp where codeTP=" + codeTP;
        return this.jdbcTem.query(sql, new BeanPropertyRowMapper<Tp>(Tp.class)).get(0);
    }


//    public List<Map<String, Object>> lstSeances(String codeTP){
//        String sql = "select tp.nomTP, s.numS, a.date, cp.description, count(u.identifiantU) as nb_total, table1.nb_reserve " +
//                "from tp, utilisateur as u, allouer as a, salle as s, calenperiode as cp, " +
//                "(select count(r.identifiantU) as nb_reserve, a.date, a.periode from allouer as a, reserver as r, utilisateur as u  " +
//                "where u.identifiantU = r.identifiantU and a.codeG = u.codeG  and a.codeTP = ? and r.date = a.date and r.periode = a.periode " +
//                "and r.periode = a.periode group by u.codeG,a.date, a.periode) as table1 where tp.codeG = u.codeG  and tp.codeTP=a.codeTP " +
//                "and a.codeS = s.codeS and cp.periode = a.periode and tp.codetp = ?  and table1.date = a.date and table1.periode = a.periode " +
//                "group by u.codeG, a.date, a.periode, a.codeS, a.codeTP,tp.nomTP, s.numS, a.periode, cp.description, table1.date, table1.periode, table1.nb_reserve ";
//        return  this.jdbcTem.queryForList(sql, codeTP, codeTP);
//    }


    public List<Map<String, Object>> lstSeancesNouveau(String codeTP){
        String sql = " select distinct tp.nomTP, s.numS, a.date, cp.description, a.periode,a.codetp as idTP " +
                " from allouer a,tp,salle s,calenperiode cp " +
                " where a.codeTP=? " +
                " and a.codetp=tp.codetp " +
                " and a.codeS=S.codeS " +
                " and cp.periode=a.periode ";
        return this.jdbcTem.queryForList(sql, codeTP);
    }

    public Long lstSeancesFinal(Integer codeTP, Date date, Integer periode){
        String sql = "select count(r.identifiantU) as nb from allouer as a, reserver as r, utilisateur as u" +
                " where u.identifiantU = r.identifiantU and a.codeG = u.codeG and a.codeTP = ? and r.date = ? and r.periode =?" +
                " and r.periode = a.periode";
        return (Long) this.jdbcTem.queryForList(sql,codeTP,date,periode).get(0).get("nb");

    }



    public int annulerCours (String codeTP, String numS, String date, String description, String codeG){
        String sql = "delete from allouer where codeTP = ? and codeS = (select codeS from salle where numS = ?) " +
                "and codeG = ? and date = ? and periode = (select periode from calenperiode " +
                "where description=?)";
        return this.jdbcTem.update(sql, codeTP, numS, codeG, date, description);
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


