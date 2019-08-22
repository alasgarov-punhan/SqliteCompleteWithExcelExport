<%-- 
    Document   : UserData
    Created on : Aug 13, 2019, 7:44:42 PM
    Author     : PUNHAN
--%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.PrintWriter"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- Required meta tags-->
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">            
        <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">         
        <!-- Bootstrap CSS-->
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       <style>
           .add-new{
               position: absolute;
               top:20px;
               right: 237px;
           }
           
           .form-control{
               width: 300px;
               margin-top: 20px;
           }
           .export{
              margin-left: 984px;
              margin-bottom: 50px;
           }
           
           </style>
    </head>
    <body>          
        <center>                    
           <form  action="search.jsp" method="post"> <!-- sercah java gedir--> 
                <input class="form-control" type="text" name="search" placeholder="Search">
                <!--<input  type="submit" name="submit" value="Search">-->
           </form>         
        </center>          
        <a class="btn btn-success add-new" href="insert.jsp">Add New Data</a>            
        
          <%
            String query = "SELECT * from register";            
            Connection  con = null;                 
        try{     
                response.setContentType("text/html");//bunsuz da isleyir
                Class.forName("org.sqlite.JDBC");
                con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
                Statement stm = con.createStatement(); 
                stm.execute(query);
                ResultSet results = stm.getResultSet();               
             // PrintWriter out = response.getWriter(); 
             //  out.println("<html><head><meta charset='UTF-8'></head><body><style>table{font-family: arial, sans-serif;border-collapse: collapse;width: 50%;} td,th{border: 1px solid #dddddd;text-align: left;padding: 8px;}</style><center><table class='tables' ><caption>İstifadəçilər</caption><thead><th>ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Birth-Date</th><th>Action</th></thead>");                      
          %>
             <html>
                 <head>
                     <meta charset='UTF-8'>
                 </head>
                 <body>
                     <style>
                         table{
                                font-family: arial, sans-serif;
                                border-collapse: collapse;
                                margin-bottom: 40px;
                                margin-top: 40px;
                                left: 245px;                             
                                width: 65%;
                         } 
                         td,th{
                                border: 1px solid #dddddd;
                                text-align: left;
                                padding: 8px;
                         }                         
                     </style>
                 <center>                     
                     <table>                        
                         <thead>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Birth-Date</th>
                            <th>Action</th>
                        </thead>                      
          <%
          while(results.next()){  
               %>              
               <tr>
                   <td> <%=results.getString(1)%> </td>
                   <td> <%=results.getString(2)%> </td>
                   <td> <%=results.getString(3)%> </td>
                   <td> <%=results.getString(5)%> </td>
                   <td> <%=results.getString(6)%> </td>
                   <td style="text-align:center;"> 
                       <a class='btn btn-warning' href='Edit.jsp?u=<%=results.getString("id")%>'>Edit</a> 
                       <a class='btn btn-danger' href='Delete.jsp?d=<%=results.getString("id")%>'>Delete</a> 
                   </td>                   
               </tr>               
               <%                               
            }  
           out.println("</table></center></body></html>");                      
           System.out.println("8");                           
        }   catch(Exception e){
            System.out.println(e);         
        }  finally{
            try{
                con.close();                
            }   catch(Exception e){
                System.out.println(e);
            }
        } 
        %>
        <form >    
            <a class="btn btn-success export" href="Retrieve.jsp">Export To Excel</a> 
        </form>
    
<script  src="https://code.jquery.com/jquery-3.4.1.js"  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="  crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.15.0/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        </body>
    </html>













    <%
//            String query = "SELECT * from register";            
//            Connection  con = null;                 
//        try{     
//           response.setContentType("text/html");//bunsuz da isleyir
//           Class.forName("org.sqlite.JDBC");
//           con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
//           Statement stm = con.createStatement(); 
//           stm.execute(query);
//           ResultSet results = stm.getResultSet();
//          // PrintWriter out = response.getWriter(); 
//         
//           out.println("<html><head><meta charset='UTF-8'></head><body><style>table{font-family: arial, sans-serif;border-collapse: collapse;width: 50%;} td,th{border: 1px solid #dddddd;text-align: left;padding: 8px;}</style><center><table class='tables' ><caption>İstifadəçilər</caption><thead><th>ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Birth-Date</th><th>Action</th></thead>");                      
//           while(results.next()){   
//              
//                                     
//                out.println("<tbody><tr><td>"+results.getString(1)+"</td><td>"+results.getString(2)+"</td><td>"+results.getString(3)+"</td><td>"+results.getString(5)+"</td><td>"+results.getString(6)+"</td><td> <a class='btn btn-success' href='insert.jsp '>Edit</a> <a class='btn btn-success' href='insert.jsp'>Delete</a></td></tr> </tbody>"); 
//            }  
//            out.println("</table></center></body></html>");            
//           ////////////////////////////////////////// 
//           
//           /////////////////////////////////////////
//           System.out.println("8");                           
//        }catch(Exception e){
//            System.out.println(e);         
//        }  finally{
//            try{
//                con.close();                
//            }catch(Exception e){
//                System.out.println(e);
//            }
//        } 
        %>
