import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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

    try{ 
            request.setCharacterEncoding("UTF-8");
            Connection  con = null;
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");    
            String query = "INSERT INTO register(first_name,last_name,user_name,mail,birth_date,password)VALUES(?,?,?,?,?,?)";
            
            String _firstname = request.getParameter("firstname");
            String _lastname = request.getParameter("lastname");
            String _username = request.getParameter("username");
            String _email = request.getParameter("email");
            String _birthdate = request.getParameter("birt_date");        
            String _password = request.getParameter("password");  
            
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1,_firstname);
            psmt.setString(2,_lastname);
            psmt.setString(3,_username);
            psmt.setString(4,_email);
            psmt.setString(5,_birthdate);
            psmt.setString(6,_password);                     
            psmt.executeUpdate();
            con.close();    
            psmt.close();
            response.sendRedirect("YouAreLogin.html");                
            System.out.println("Inserted Data To Table Succesfully");

    }   catch(Exception e){
        System.out.println(e);         
     
     }    
//         finally{
//            try{
//                con.close();                
//            }catch(Exception e){
//                System.out.println(e);
//            }
//        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
