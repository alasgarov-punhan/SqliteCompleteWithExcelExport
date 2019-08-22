<%-- 
    Document   : Retrieve
    Created on : Aug 19, 2019, 10:42:47 AM
    Author     : PUNHAN
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
             input{
                 border: 0!important;
             }
             table{
                 margin-top: 20px;
             }
        </style>
    </head>
    <body>
    <center>
        <form method="get" action="Download">
        <table border=1>
    
        <tr>
            <th>ID</th>
            <th>First Name</th>  
            <th>Last Name</th>  
            <th>Email</th>  
            <th>Birth-Date</th>  
        </tr>
<%
        Connection  con = null;           
        String query = "SELECT * from register";           
        Class.forName("org.sqlite.JDBC");
        con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
        Statement stm = con.createStatement(); 
        stm.execute(query);
        ResultSet rs = stm.getResultSet();
        while(rs.next()){
    %>
    <tr>
            <td>
                <input type="text" name="id" class="form-control"   value="<%=rs.getString("id")%>">
            </td>
            <td>
                <input type="text" name="fname"  class="form-control" value="<%=rs.getString("first_name")%>">
            </td>  
            <td>
                <input type="text" name="lname" class="form-control" value="<%=rs.getString("last_name")%>">
            </td>  
            <td>
                <input type="text" name="mail" class="form-control"  value="<%=rs.getString("mail")%>">
            </td>  
            <td>
                <input type="text" name="date" class="form-control"  value="<%=rs.getString("birth_date")%>">
            </td>  
    </tr>
        
    <%
    }
    %>
        </table>
    </br>
    <input class="btn btn-success export"   type="submit" value="Export To Excel">
    </form>
    </center>
        
    <script  src="https://code.jquery.com/jquery-3.4.1.js"  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="  crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.15.0/dist/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
    </html>

