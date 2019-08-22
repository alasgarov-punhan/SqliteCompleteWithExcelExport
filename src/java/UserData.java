 import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/UserData"})
public class UserData extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");    
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setCharacterEncoding("UTF-8");//
          String query = "SELECT * from register";            
            Connection  con = null;                 
        try{     
           response.setContentType("text/html");//bunsuz da isleyir
           Class.forName("org.sqlite.JDBC");
           con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
           Statement stm = con.createStatement(); 
           stm.execute(query);
           ResultSet results = stm.getResultSet();
           PrintWriter out = response.getWriter(); 
           out.println("<html><head><meta charset='UTF-8'></head><body><style>table{font-family: arial, sans-serif;border-collapse: collapse;width: 50%;} td,th{border: 1px solid #dddddd;text-align: left;padding: 8px;}</style><center><form action=\"Search\" method=\"post\"><input type=\"text\" name=\"search\" placeholder=\"Search\"><input type=\"submit\" name=\"submit\" value=\"Search\"></form><table><caption>İstifadəçilər</caption><thead><th>First Name</th><th>Last Name</th><th>Email</th><th>Birth-Date</th></thead>");                      
           while(results.next()){                         
                  
                out.println("<tbody><tr><td>"+results.getString(1)+"</td><td>"+results.getString(2)+"</td><td>"+results.getString(4)+"</td><td>"+results.getString(5)+"</td></tr></tbody>"); 
            }  
            out.println("</table></center></body></html>");            
           ////////////////////////////////////////// 
           
           /////////////////////////////////////////
           System.out.println("8");                           
        }catch(Exception e){
            System.out.println(e);         
        }  
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
 