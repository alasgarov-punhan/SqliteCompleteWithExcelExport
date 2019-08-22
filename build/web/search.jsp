<%-- 
    Document   : search
    Created on : Aug 9, 2019, 11:44:20 AM
    Author     : PUNHAN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">      
    </head>
    <body>
        <form action="" method="post">
        </form>
        
        <%
           Connection  con = null;                 
        try{     
           request.setCharacterEncoding("UTF-8");
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
                           width: 50%;
                           margin-top: 40px;
                       } 
                       td,th{
                           border: 1px solid #dddddd;
                           text-align: left;
                           padding: 8px;
                       }
                       .export{                          
                             margin-bottom: 50px;
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
           while(rs.next()){                         
             %>                  
                <tbody>
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("first_name")%></td>
                        <td><%=rs.getString("last_name")%></td>
                        <td><%=rs.getString("mail")%></td>
                        <td><%=rs.getString("birth_date")%></td>
                        <td style="text-align:center;"> 
                            <a class='btn btn-warning' href='Edit.jsp?u=<%=rs.getString("id")%>'>Edit</a> 
                            <a class='btn btn-danger' href='Delete.jsp?d=<%=rs.getString("id")%>'>Delete</a> 
                        </td>                        
                    </tr>
                </tbody> 
          <%
                }  
           %>
            </table>            
            </center>
            </body>
            </html>
        <%
           System.out.println("8");                       
           con.close(); 
        }catch(Exception e){
            System.out.println(e);         
        } 
        %>        
    </body>
</html>
