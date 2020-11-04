package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Machine {

    public Integer codeM;
    public String numM;

    public JdbcTemplate template;
    public Integer codeS;


    public Machine(Integer codeM, String numM,Integer codeS) {
        this.codeM = codeM;
        this.numM = numM;
        this.codeS = codeS;
        this.template=new JdbcTemplate(JDBCUtils.getDataSource());;
    }

    public Machine() {
        this.template=new JdbcTemplate(JDBCUtils.getDataSource());;
    }
    //


    //trouver list des machine de une salle
    public List<Machine> trouerMachineLibre(Integer codeSalle,String periode,String date){

        String sql="select m.codeM,m.numM from machine as m  where m.codeS = "+codeSalle+"  and m.codeM " +
                "not in(select r.codeM from reserver as r " +
                "where r.date = '"+date+"' and r.periode = "+periode+")";
        return this.template.query(sql,new BeanPropertyRowMapper<Machine>(Machine.class));



    }

    //reserver une machine
    public void reserverUneMachine(Integer perriode, Date date, Integer idU,Integer codeM){

    }

    //annuler une reserver de machine
    public void annulerUneMachine(Integer perriode, Date date, Integer idU,Integer codeM){

    }

    public Integer getCodeM() {
        return codeM;
    }

    public void setCodeM(Integer codeM) {
        this.codeM = codeM;
    }

    public String getNumM() {
        return numM;
    }

    public void setNumM(String numM) {
        this.numM = numM;
    }


    public Integer getCodeS() {
        return codeS;
    }

    public void setCodeS(Integer codeS) {
        this.codeS = codeS;
    }

    @Override
    public String toString() {
        return "Machine{" +
                "codeM=" + codeM +
                ", numM='" + numM + '\'' +
                ", codeS=" + codeS +
                '}';
    }
}
