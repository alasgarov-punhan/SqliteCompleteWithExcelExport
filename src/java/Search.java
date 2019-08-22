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

@WebServlet(urlPatterns = {"/Search"})
public class Search extends HttpServlet {

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
                 
            Connection  con = null;                 
        try{     
         
           Class.forName("org.sqlite.JDBC");
           con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
           Statement stm = con.createStatement();        
           ResultSet rs = null;
           String get_search_box_data =request.getParameter("search");
           String data;
           if(get_search_box_data!=null){
               data = "select*from register where first_name like '%"+get_search_box_data+"%' or last_name like '%"+get_search_box_data+"%' or user_name like '%"+get_search_box_data+"%' or mail like '%"+get_search_box_data+"%' or birth_date like '%"+get_search_box_data+"%' ";
           }
           else{
               data = "select*from register order by first desc";
           }
           rs = stm.executeQuery(data);                                 
           PrintWriter out = response.getWriter(); 
           out.println("<html><head><meta charset='UTF-8'></head><body><style>table{font-family: arial, sans-serif;border-collapse: collapse;width: 50%;} td,th{border: 1px solid #dddddd;text-align: left;padding: 8px;}</style><center><form><input type=\"text\" name=\"search\" placeholder=\"Search\"> <input type=\"submit\" name=\"submit\" value=\"Search\"></form><table><caption>İstifadəçilər</caption><thead><th>First Name</th><th>Last Name</th><th>Email</th><th>Birth-Date</th></thead>");                      
           while(rs.next()){                         
                  
                out.println("<tbody><tr><td>"+rs.getString("first_name")+"</td><td>"+rs.getString("last_name")+"</td><td>"+rs.getString("mail")+"</td><td>"+rs.getString("birth_date")+"</td></tr></tbody>"); 
            }  
            out.println("</table></center></body></html>");
 
           System.out.println("8");                       
           con.close(); 
        }catch(Exception e){
            System.out.println(e);         
        }       
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
//<!DOCTYPE html>
//<html>
//    <head>
//        <title>TODO supply a title</title>
//        <meta charset="UTF-8">
//        <meta name="viewport" content="width=device-width, initial-scale=1.0">
//    </head>
//    <body>
//        <style>
//            table{font-family: arial, sans-serif;
//                  border-collapse: collapse;
//                  width: 50%;
//            } 
//            td,th{
//                border: 1px solid #dddddd;
//                text-align: left;
//                padding: 8px;
//            }
//        </style>
//        <form action="Search" method="post">
//        <table>
//        <thead>
//              <th>First</th>
//              <th>Last Name</th>
//              <th>Email</th>
//              <th>Birth-Date</th> 
//              <input type="text" name="search" placeholder="Search"> 
//              <input type="submit" name="submit" value="Search">
//        </thead>
//            <tbody>
//               
//                
//            </tbody>
//        </table>
//            </form>
//    </body>
//</html>
//
