package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Salle {
    public Integer codeS;
    public String numS;
    public String etatS;
    public JdbcTemplate template;
    public Salle(Integer codeS, String numS, String etatS) {
        this.codeS = codeS;
        this.numS = numS;
        this.etatS = etatS;

    }

    public Salle() {
        this.template=new JdbcTemplate(JDBCUtils.getDataSource());;
    }



    //pas fini
    public List<Salle> trouveListeDeSalle(String date,Integer periode){
        List<Salle> list=new ArrayList<>();
        String sql="select distinct s.numS " +
                "from salle as s " +
                "where s.codeS not in(select a.codeS " +
                "     from allouer as a " +
                "                    where a.dateallouer = "+date +
                "                    and a.periodeallouer = "+periode+")";
        list=this.template.query(sql,new BeanPropertyRowMapper<Salle>(Salle.class));
        return  list;
    }


    public Integer getCodeS() {
        return codeS;
    }

    public void setCodeS(Integer codeS) {
        this.codeS = codeS;
    }

    public String getNumS() {
        return numS;
    }

    public void setNumS(String numS) {
        this.numS = numS;
    }

    public String getEtatS() {
        return etatS;
    }

    public void setEtatS(String etatS) {
        this.etatS = etatS;
    }

    @Override
    public String toString() {
        return "Salle{" +
                "codeS=" + codeS +
                ", numS='" + numS + '\'' +
                ", etatS='" + etatS + '\'' +
                '}';
    }
}
