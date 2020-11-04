package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class Utilisateur {
    protected String identifiantU;
    protected  String motdepasseU;
    protected  String nomU;
    protected  String prenomU;
    protected String typeU;
    protected Integer codeG;
    protected JdbcTemplate jdbcTem;

    public Utilisateur() {
        this.jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());
    }

    public Utilisateur login(String id,String mdp){
        Utilisateur user = null;
        String sql = "select * from utilisateur where identifiantU = "+id/*+" and motdepasseU ="+mdp*/;
        Utilisateur utilisateur = this.jdbcTem.query(sql,new BeanPropertyRowMapper<Utilisateur>(Utilisateur.class)).get(0);
        if (utilisateur.getModepasseU().equals(mdp)){
            user = utilisateur;
        }
        return user;

//        if (!lstU.isEmpty()){
//            utilisateur = this.jdbcTem.query(sql,new BeanPropertyRowMapper<Utilisateur>(Utilisateur.class)).get(0);
//        }
//        return utilisateur;
//        String sql = "select * from utilisateur where identifiantU = "+id+" and motdepasseU ="+mdp;
//        List<Utilisateur> lstU = this.jdbcTem.query(sql,new BeanPropertyRowMapper<Utilisateur>(Utilisateur.class));
//        Utilisateur utilisateur = null;
//        if(!lstU.isEmpty()){
//            utilisateur = lstU.get(0);
//        }
//        return utilisateur;
    }

    public List<Map<String,Object>> reserEtu(String id){
        String sql="select m.numM, s.numS, r.date, r.periode, cp.description from reserver as r, machine as m, salle as s, " +
                "calenperiode as cp where r.identifiantU =? " +
                "and r.codeM = m.codeM and s.codeS = m.codeS and cp.periode = r.periode";
        return  this.jdbcTem.queryForList(sql,id);

    }


    //set et get

    public String getIdentifiantU() {
        return identifiantU;
    }

    public void setIdentifiantU(String identifiantU) {
        this.identifiantU = identifiantU;
    }

    public String getModepasseU() {
        return motdepasseU;
    }

    public void setMotdepasseU(String modepasseU) {
        this.motdepasseU = modepasseU;
    }

    public String getNomU() {
        return nomU;
    }

    public void setNomU(String nomU) {
        this.nomU = nomU;
    }

    public String getPrenomU() {
        return prenomU;
    }

    public void setPrenomU(String prenomU) {
        this.prenomU = prenomU;
    }

    public String getTypeU() {
        return typeU;
    }

    public void setTypeU(String typeU) {
        this.typeU = typeU;
    }

    public Integer getCodeG() {
        return codeG;
    }

    public void setCodeG(Integer codeG) {
        this.codeG = codeG;
    }

    @Override
    public String toString() {
        return "Utilisateur{" +
                "identifiantU='" + identifiantU + '\'' +
                ", motdepasseU='" + motdepasseU + '\'' +
                ", nomU='" + nomU + '\'' +
                ", prenomU='" + prenomU + '\'' +
                ", typeU='" + typeU + '\'' +
                ", codeG=" + codeG +
                '}';
    }
}
