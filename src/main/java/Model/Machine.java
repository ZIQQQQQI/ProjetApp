package Model;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.Date;

public class Machine {
    protected Integer codeM;
    protected String numM;
    protected Integer codeS;

    public Machine(Integer codeM, String numM,Integer codeS) {
        this.codeM = codeM;
        this.numM = numM;
        this.codeS = codeS;
    }

    public Machine() {
    }


    //trouver list des machine de une salle
    public ArrayList<Machine> trouerMachineLibre(Integer codeSalle){
        ArrayList<Machine> list=new ArrayList<>();



        return list;
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
