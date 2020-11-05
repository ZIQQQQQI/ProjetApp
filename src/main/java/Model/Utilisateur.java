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

        String sqlIdent = "select count(*) as nb from utilisateur where identifiantU = "+id/*+" and motdepasseU ="+mdp*/;
        Long nbLigne = (Long) this.jdbcTem.queryForList(sqlIdent).get(0).get("nb");

        if (nbLigne != 0){
            String sql = "select * from utilisateur where identifiantU = "+id/*+" and motdepasseU ="+mdp*/;
            Utilisateur utilisateur = this.jdbcTem.query(sql,new BeanPropertyRowMapper<Utilisateur>(Utilisateur.class)).get(0);

            if (utilisateur.getModepasseU().equals(mdp)){
                user = utilisateur;
            }
        }
        return user;
    }

    public List<Map<String,Object>> reserEtu(String id){
        String sql="select m.numM, m.codeM,s.numS, r.date, r.periode, cp.description from reserver as r, machine as m, salle as s, " +
                "calenperiode as cp where r.identifiantU =? " +
                "and r.codeM = m.codeM and s.codeS = m.codeS and cp.periode = r.periode";
        return  this.jdbcTem.queryForList(sql,id);

    }

    public void supprimerEtu(String idU){
        String sql = "delete from reserver where identifiantU =" + idU;
        String sqlEtu = "delete from utilisateur where identifiantU =" + idU;
        jdbcTem.update(sql);
        jdbcTem.update(sqlEtu);
    }

    public boolean siRer(String idU,String date,String periode){
        String sql="select count(*) as res from reserver  where identifiantU = ?  and date =? and periode = ?";
        Long res=(Long) this.jdbcTem.queryForList(sql,idU,date,periode).get(0).get("res");
        return res == 1;

    }

    public boolean addEtu(String idu,String nom,String prenom,String codeG){
        String sql=" select count(*) as res from utilisateur where identifiantU = ?";
        Long res=(Long) this.jdbcTem.queryForList(sql,idu).get(0).get("res");
        if(res!=0){
            return  false;
        }else{
            String sql1="insert into utilisateur(identifiantU, motdepasseU, nomU, prenomU,typeU,codeG) " +
                    "values(?,123,?,?,'etudiant',?)";
            System.out.println(sql+codeG);
            this.jdbcTem.update(sql1,idu,nom,prenom,codeG);
            return  true;
        }

    }

    //
    public List<Utilisateur> lstEtu(String id){

     

        String sql = "select identifiantU, nomU, prenomU from utilisateur where codeG =" + id ;

        return jdbcTem.query(sql,new BeanPropertyRowMapper<>(Utilisateur.class));
    }

    public List<Groupe> getLstGroupe(String id){
        String sql = "select g.codeG, g.nomG from groupe g, diriger d where g.codeG = d. codeG and d.identifiantU =" + id;
        return jdbcTem.query(sql,new BeanPropertyRowMapper<>(Groupe.class));
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
