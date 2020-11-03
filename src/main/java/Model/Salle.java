package Model;

public class Salle {
    public Integer codeS;
    public String numS;
    public String etatS;

    public Salle(Integer codeS, String numS, String etatS) {
        this.codeS = codeS;
        this.numS = numS;
        this.etatS = etatS;
    }

    public Salle() {
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
