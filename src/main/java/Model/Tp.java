package Model;

import Outil.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
=======
import java.util.List;


public class Tp {
    protected JdbcTemplate jdbcTem;
    protected Integer codeTp;
    protected String nomTP;


    public Tp() {
        this.jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());

    protected String codeG;
    protected JdbcTemplate jdbcTem;
    }
    public Tp() {
        this.jdbcTem = new JdbcTemplate(JDBCUtils.getDataSource());
    }


    public List<Tp> listTP(String codeG){
        String sql="select distinct * from tp where codeG="+codeG;
        return this.jdbcTem.query(sql,new BeanPropertyRowMapper<>(Tp.class));


    }


    public Tp getTP(String codeTP){
        String sql = "select * from tp where codeTP=" + codeTP;
        return this.jdbcTem.query(sql, new BeanPropertyRowMapper<Tp>(Tp.class)).get(0);
    }

    // to do
    public int getNbEtuTotal(String codeTP){
        return 0;
    }

    // to do
    public List<Map<String, Object>> lstSeances(String codeTP){
//        ArrayList<ArrayList<String>> lstRes = new ArrayList<>();
//        String[] str = new String[]{"a", "b"};
//        ArrayList<String> lst = new ArrayList<>(Arrays.asList(str));
//        lstRes.add(lst);
        return null;
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


