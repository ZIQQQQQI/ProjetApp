package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Salle {
    protected Integer codeS;
    protected String numS;
    protected String etatS;
    protected JdbcTemplate template;
    protected Salle(Integer codeS, String numS, String etatS) {
        this.codeS = codeS;
        this.numS = numS;
        this.etatS = etatS;

    }

    public Salle() {
        this.template=new JdbcTemplate(JDBCUtils.getDataSource());
    }

    public List<Map<String,Object>> trouveSalleLibre(String periode,String date){
        String sql="select distinct s.numS, s.codeS, count(m.codeM) as nbtotal, table2.nbreservee " +
                "from salle as s, machine as m,(select distinct s.numS, s.codeS, ifnull(table1.nbre,0) as nbreservee from salle " +
                "as s left join (select count(r1.identifiantU) as nbre, a1.codeS " +
                "from reserver as r1, allouer as a1, machine as m1 where r1.date = a1.date and " +
                "r1.periode = a1.periode and a1.date =? and a1.periode =? and " +
                "m1.codeM = r1.codeM and m1.codeS = a1.codeS group by a1.codeS) as table1 on s.codeS = table1.codeS " +
                "where s.codeS not in(select a.codeS from allouer as a where a.date = ? and a.periode = ?)) as table2 " +
                "where s.codeS = m.codeS " +
                "and table2.codeS = s.codeS and s.codeS not in(select a.codeS from allouer as a where a.date = ? and a.periode = ?) " +
                "group by s.numS, s.codeS;";
        return  this.template.queryForList(sql,date,periode,date,periode,date,periode);
    }

    //pas fini pour un idu
    public List<Salle> trouveListeDeSalle(String date, String periode,Integer idEtu){



        List<Salle> list;
        String sql=" select s.CodeS,S.NumS from allouer as a, utilisateur as u, salle as s " +
                "where a.codeG = u.codeG and s.codeS = a.codeS and u.identifiantU ="+idEtu +
                " and a.date = '"+date+"' and a.periode = "+periode +
                " union " +
                " select distinct s.CodeS,S.NumS " +
                " from salle as s " +
                "where s.codeS not in(select a.codeS " +
                "     from allouer as a " +
                "                    where a.date ='"+date +
                "' and a.periode= "+periode+")";

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
