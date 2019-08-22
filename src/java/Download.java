import java.io.*;
import static java.lang.System.out;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

@WebServlet(urlPatterns = {"/Download"})
public class Download extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");    
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id[] = request.getParameterValues("id");    
        String fname[] = request.getParameterValues("fname");
        String lname[] = request.getParameterValues("lname");
        String mail[] = request.getParameterValues("mail");
        String date[] = request.getParameterValues("date");
       
        try { 
            
            Date dates = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy_HH-mm-ss.SSS");
            String f = sdf.format(dates);           
           
            String filepath = "C:/Users/PUNHAN/Desktop/Project/NetBeans/SqliteSon/" ;
            String filename = "users_data_"+f+".xls";
                      
            HSSFWorkbook hwb = new HSSFWorkbook();
            HSSFSheet sheet =  hwb.createSheet("sheet");

            HSSFRow rowhead = sheet.createRow((short)0);
            rowhead.createCell((short) 0).setCellValue("ID");
            rowhead.createCell((short) 1).setCellValue("First Name");
            rowhead.createCell((short) 2).setCellValue("Last Name");
            rowhead.createCell((short) 3).setCellValue("Email");
            rowhead.createCell((short) 4).setCellValue("Birth-Date");

            for (int i=0;i<id.length;i++) {     
                HSSFRow row = sheet.createRow((short) i + 1 );
                row.createCell((short) 0).setCellValue( id[i] );
                row.createCell((short) 1).setCellValue( fname[i] );
                row.createCell((short) 2).setCellValue( lname[i] );
                row.createCell((short) 3).setCellValue( mail[i] );
                row.createCell((short) 4).setCellValue( date[i] );                    
            }

            FileOutputStream fileOut =  new FileOutputStream(filepath + filename);         
            hwb.write(fileOut);
            fileOut.close();     
          

            //response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");		

            FileInputStream fileInputStream = new FileInputStream(filepath + filename);

            int i;
            while ((i = fileInputStream.read()) != -1 ) {
                out.write(i);
            }
            fileInputStream.close();
            out.close();
            
            //File Deleted
            File file = new File("C:/Users/PUNHAN/Desktop/Project/NetBeans/SqliteSon/"+filename);
            if ( file.exists() ) {
                file.delete();             
            }
           
          
        } catch ( Exception ex ) {
            System.out.println(ex);            
        }
        
       
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
   
}

