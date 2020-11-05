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

//        String sql="SELECT S.codeS , S.numS ,(select count(M1.codeM) " +
//                "from machine M1 WHERE M1.codeS = S.codeS group by S.codeS) as nbtotal,(SELECT COUNT(M.codeM) FROM machine M wHERE S.codeS = M.codeS AND M.codeM not in " +
//                "( select R.codeM FROM reserver R , calenperiode C WHERE R.periode=C.periode and R.date=? and C.periode =? ))" +
//                "as nbreservee FROM salle S;";
        String sql="SELECT S.codeS , S.numS ,(select count(M1.codeM) " +
                "                from machine M1 WHERE M1.codeS = S.codeS group by S.codeS) as nbtotal,(SELECT COUNT(M.codeM) FROM machine M " +
                "                wHERE S.codeS = M.codeS AND M.codeM not in " +
                "                ( select R.codeM FROM reserver R , calenperiode C WHERE R.periode=C.periode and R.date=? and C.periode =? ))" +
                "                as nbreservee FROM salle S " +
                "                wHERE s.codeS not in(" +
                "                 select a.codeS FROM allouer a  WHERE  a.date=? and a.periode =? );";

        return  this.template.queryForList(sql,date,periode,date,periode);
    }

    public void reserveSalle(String codeTp,String codeS,String codeG,String date,String periode){
        String sql="insert into allouer values(?,?,?,?,?)";
        System.out.println(sql+" "+codeTp+" "+codeS+" "+codeG+" "+date+" "+periode);
        this.template.update(sql,codeTp,codeS,codeG,date,periode);
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
