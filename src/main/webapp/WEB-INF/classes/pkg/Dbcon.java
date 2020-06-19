package pkg;
import java.sql.*;
public class Dbcon {
     String driver = "com.mysql.jdbc.Driver";
     String dburl = "jdbc:mysql://localhost:3306/hillerinventory";
     String dbusername = "root";
     String dbpassword = "8017";
     Connection con = null;
    public Connection getCon() {
        try{
            Class.forName(driver).newInstance();
            this.con = DriverManager.getConnection(dburl, dbusername, dbpassword);
        }catch(Exception e){
            return this.con;
        }
        return this.con;
    }
    public void destroyCon(Connection con) {
        try {
            this.con = con;
            con.close();
        } catch (SQLException e) {
            
        }
    }
}