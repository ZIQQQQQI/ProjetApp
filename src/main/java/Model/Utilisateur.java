package Model;

import javax.print.DocFlavor;

public class Utilisateur {
    protected String identifiantU;
    protected  String motdepasseU;
    protected  String nomU;
    protected  String prenomU;
    protected String typeU;
    protected Integer codeG;

    public Utilisateur() {
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
