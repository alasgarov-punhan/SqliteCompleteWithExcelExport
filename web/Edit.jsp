<%-- 
    Document   : Edit
    Created on : Aug 14, 2019, 10:57:34 AM
    Author     : PUNHAN
--%> 
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head> 
        <!-- Required meta tags-->
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">            
        <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">         
        <!-- Bootstrap CSS-->
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">        
       <style>
           .container{
               width: 600px;
           }
       </style>
    </head>
    <body>
        <div class="container">   
<%       
        request.setCharacterEncoding("UTF-8");
        Connection  con = null;        
        Statement stat =null;
        ResultSet res = null;
        PreparedStatement stmt = null;
        Class.forName("org.sqlite.JDBC").newInstance();   
        con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");                        
%>
        <form action="" method="post">
          
<%  
        stat = con.createStatement(); 
        String u = request.getParameter("u");
        int num = Integer.parseInt(u);
        System.out.println(num);
        String data = "select*from register where id='"+num+"'";
        res = stat.executeQuery(data);
 
        while(res.next()){         
%>
            

<input type="hidden" name="id" value='<%=res.getString("id")%>'>
        <div class="form-group">
            <label>FirstName</label>
            <input type="text" class="form-control" name="first"  value='<%=res.getString("first_name")%>'>
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input type="text" class="form-control" name="last" value='<%=res.getString("last_name")%>'>
        </div>
        <div class="form-group">
            <label>User Name</label>
            <input type="text" class="form-control" name="user" value='<%=res.getString("user_name")%>'>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" name="email" value='<%=res.getString("mail")%>'>
        </div>
        <div class="form-group">
            <label>Birth Date</label>
            <input type="date" class="form-control" name="date" value='<%=res.getString("birth_date")%>'>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" class="form-control" name="password" value='<%=res.getString("password")%>'>
        </div>                    
            <%
            }
            %>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="" class="btn btn-success">Back</a>        
    </form>  
    </div>
<!-- Optional Javascript-->
<script  src="https://code.jquery.com/jquery-3.4.1.js"  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="  crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.15.0/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
<%
    
    try {
            String a = request.getParameter("id");
            String b = request.getParameter("first");
            String c = request.getParameter("last");
            String d = request.getParameter("user");
            String e = request.getParameter("email");
            String f = request.getParameter("date");
            String g = request.getParameter("password");
            System.out.println(g);
   
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null ) { 
                
            System.out.println("4");
            String query = "update register set first_name=?, last_name=?, user_name=?, mail=?, birth_date=?, password=? where id='"+a+"'";
        //  System.out.println("4");
            stmt = con.prepareStatement(query); 
            stmt.setString(1,b);
            stmt.setString(2,c);
            stmt.setString(3,d);
            stmt.setString(4,e);
            stmt.setString(5,f);
            stmt.setString(5,g);
            stmt.executeUpdate();
            response.sendRedirect("UserData.jsp");             
            }
            con.close();                
        }   catch(Exception e){
                System.out.println(e);
            }               
%>