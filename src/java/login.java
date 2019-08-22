import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class login extends HttpServlet {

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
        
        String query = "SELECT user_name, password FROM register where user_name = ? and password = ?";
        Connection  con = null; 
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {                 
            
            String userName = request.getParameter("username");
            String userPassword = request.getParameter("password");
            
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, userPassword);
            
            rs = ps.executeQuery();
            
            if (rs != null && !isMyResultSetEmpty(rs) /* rs-de user varsa */) {
                //rs.next();
                if (!rs.getString("password").isEmpty() ) {

                    System.out.println("resultset have data");
                    response.sendRedirect("UserData.jsp");

                } else
                    response.sendRedirect("login.html");
            } else {
                out.println("resultset have no data");
                response.sendRedirect("login.html");
            }
                
            out.println("chek user finished");
           
        } catch(Exception e) {
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        
        
        
//           try(PrintWriter out = response.getWriter()){				
//                    String _name = request.getParameter("name");
//                    String _password = request.getParameter("pass");
//                           if(_name.equals("Punhan") && _password.equals("12345")) {  
//                                // System.out.println("3");
//                                response.sendRedirect("welcome.html");	
//                               // System.out.println("4");                               
//                                }
//                            else if(_name.trim().isEmpty() && _password.trim().isEmpty()) {                             
//                                   // System.out.println("5"); 
//                                    out.println("Empty username or password");                                   
//                                    // System.out.println("6");
//                                     }	
//                                 		
//	}    
    }

    public static boolean isMyResultSetEmpty(ResultSet rs) throws SQLException {
        /*System.out.println("rs.isBeforeFirst() - " + rs.isBeforeFirst() + "    data line - " + rs.getRow());
        rs.next();
        System.out.println("    data line - " + rs.getRow());*/
        return (!rs.isBeforeFirst() && rs.getRow() == 0);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
