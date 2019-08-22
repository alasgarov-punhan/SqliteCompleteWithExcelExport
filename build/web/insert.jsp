<%-- 
    Document   : insert
    Created on : Aug 9, 2019, 2:43:58 PM
    Author     : PUNHAN
--%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
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
    <form action="" method="post">
        <div class="form-group">
            <label>FirstName</label>
            <input  id="fname"  type="text" class="form-control" name="first" placeholder="First Name">
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input  id="lname" type="text" class="form-control" name="last" placeholder="Last Name">
        </div>
        <div class="form-group">
            <label>User Name</label>
            <input id="uname"  type="text" class="form-control" name="user" placeholder="Your User">
        </div>
        <div class="form-group">
            <label>Email</label>
            <input  id="mail" type="email" class="form-control" name="email" placeholder="Email">
        </div>
        <div class="form-group">
            <label>Birth Date</label>
            <input  id="date" type="date" class="form-control" name="date" placeholder="Birth Date" value="2018-07-22"
       min="2018-01-01" max="2018-12-31">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input  id="password" type="password" class="form-control" name="password" placeholder="Password">
        </div>
        <button id="myBtn"  type="submit" class="btn btn-primary ">Submit</button>
        <a class="btn btn-success" href="UserData.jsp">Bak</a>        
    </form>  
    </div>
<!-- Optional Javascript-->

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 

<script src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js"></script>
<script src="snbutton.js"></script>


 <script>
            $(document).ready(function(){
                SNButton.init("myBtn",{
                    fields:["fname","lname","uname","mail","password"],
                    enabletext: "Submit",
                    disabletext: "Please Enter Data"
                })
            })
               
        </script>        
</body>
</html>

    
<%      request.setCharacterEncoding("UTF-8");
        String a = request.getParameter("first");
        String b = request.getParameter("last");
        String c = request.getParameter("user");
        String d = request.getParameter("email");
        String e = request.getParameter("date");
        String f = request.getParameter("password");
        Connection  con = null;        
        PreparedStatement stat =null;
        Class.forName("org.sqlite.JDBC").newInstance();
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
        
          con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\Students\\qeydiyyat.db");
          String data = "insert into register(first_name,last_name,user_name,mail,birth_date,password) values(?,?,?,?,?,?)";
          stat = con.prepareStatement(data);
          stat.setString(1,a);
          stat.setString(2,b);
          stat.setString(3,c);
          stat.setString(4,d);
          stat.setString(5,e);
          stat.setString(6,f);
          stat.executeUpdate();
          response.sendRedirect("YouAreLogin.html");
     }
  
%>

