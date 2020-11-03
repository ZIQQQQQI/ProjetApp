package Model;

import javax.persistence.criteria.CriteriaBuilder;

public class Machine {
    public Integer codeM;
    public String numM;
    public String etatM;
    public Integer codeS;

    public Machine(Integer codeM, String numM, String etatM, Integer codeS) {
        this.codeM = codeM;
        this.numM = numM;
        this.etatM = etatM;
        this.codeS = codeS;
    }

    public Machine() {
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

    public String getEtatM() {
        return etatM;
    }

    public void setEtatM(String etatM) {
        this.etatM = etatM;
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
                ", etatM='" + etatM + '\'' +
                ", codeS=" + codeS +
                '}';
    }
}
