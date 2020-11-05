package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class Tp {
    protected Integer codeTp;
    protected String nomTP;
    protected String codeG;
    protected JdbcTemplate jdbcTem;
    public Tp() {
        this.jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());
    }


    public List<Tp> listTP(String codeG){
        String sql="select distinct * from tp where codeG="+codeG;
        return this.jdbcTem.query(sql,new BeanPropertyRowMapper<>(Tp.class));

    }














    //get et set
    public Integer getCodeTp() {
        return codeTp;
    }

    public void setCodeTp(Integer codeTp) {
        this.codeTp = codeTp;
    }

    public String getNomTP() {
        return nomTP;
    }

    public void setNomTP(String nomTP) {
        this.nomTP = nomTP;
    }
    public void setCodeG(String codeG) {
        this.codeG = codeG;
    }
    public String getCodeG() {
        return codeG;
    }

}


