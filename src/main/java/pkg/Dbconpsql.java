package pkg;
import java.sql.*;
public class Dbconpsql {
    public String driver = "org.postgresql.Driver";
    public String dburl = "jdbc:postgresql://ec2-35-174-127-63.compute-1.amazonaws.com:5432/d57parlkjsguj6?sslmode=require";
    public String dbusername = "alpndjupeyjvrt";
    public String dbpassword = "98727433ed7a5ec3f40745d38eeba15e108b6377bf048d8bdac75d6236b5925a";
    public Connection con = null;
    public Connection getCon() {
        try{
            Class.forName(driver).newInstance();
            this.con = DriverManager.getConnection(dburl, dbusername, dbpassword);
        }catch(Exception e){
            return null;
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