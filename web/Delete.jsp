<%-- 
    Document   : Delete
    Created on : Aug 14, 2019, 12:40:37 PM
    Author     : PUNHAN
--%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  try {
            Connection con = null;
            String id = request.getParameter("d");
            int no = Integer.parseInt(id);
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
            Statement stat = con.createStatement();
            stat.executeUpdate("delete from register where id='"+no+"' ");
            response.sendRedirect("UserData.jsp");                
                con.close();                
         }  catch(Exception e){
                System.out.println(e);
            }              
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>      
    </body>
</html>
