<%-- 
    Document   : Excel_File
    Created on : Aug 19, 2019, 12:31:31 AM
    Author     : PUNHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>  
<%@page import="java.io.*"%>  
<%@page import="java.io.PrintWriter"%>  



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
 
<%     
        String id [] = request.getParameterValues("id");    
        String fname [] = request.getParameterValues("fname");
        String lname [] = request.getParameterValues("lname");
        String mail [] = request.getParameterValues("mail");
        String date [] = request.getParameterValues("date");
        

        try{
            String filepath = "C:/Users/PUNHAN/Desktop/" ;
            String filename = "data.xls";

            HSSFWorkbook hwb = new HSSFWorkbook();
            HSSFSheet sheet =  hwb.createSheet("sheet");

            HSSFRow rowhead = sheet.createRow((short)0);
            rowhead.createCell((short) 0).setCellValue("ID");
            rowhead.createCell((short) 1).setCellValue("First Name");
            rowhead.createCell((short) 2).setCellValue("Last Name");
            rowhead.createCell((short) 3).setCellValue("Email");
            rowhead.createCell((short) 4).setCellValue("Birth-Date");

            for(int i=0;i<id.length;i++) {
                int j=i+1;
                HSSFRow row = sheet.createRow((short)j);
                row.createCell((short) 0).setCellValue(id[i]);
                row.createCell((short) 1).setCellValue(fname[i]);
                row.createCell((short) 2).setCellValue(lname[i]);
                row.createCell((short) 3).setCellValue(mail[i]);
                row.createCell((short) 4).setCellValue(date[i]);
            }

            FileOutputStream fileOut =  new FileOutputStream(filepath + filename);         
            hwb.write(fileOut);
            fileOut.close();                    




            response.setContentType("application/vnd.ms-excel");       
            //response.setHeader("Content-Disposition","attachment; filename = "+filename);
            response.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");
            FileInputStream filetodownload = new FileInputStream(filepath+filename);        
            int c;
            while((c = filetodownload.read())!=-1){
                out.write(c);
            }              
            out.close();
            filetodownload.close();


            System.out.println("Your excel file has been generated!");
        } catch( Exception ex ) {
            System.out.println(ex);
        }
%>
<center><h1>Success</h1></center>
    </body>
</html>
