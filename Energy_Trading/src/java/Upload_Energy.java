import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

@WebServlet(urlPatterns = {"/Upload_Energy"})
public class Upload_Energy extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        try {
             String Provider_Name = "", Energy_Type="", Quantity="", Price="", Start_Time="",Description="" , PR_Id="", Provider_Email="",Provider_Address="";
            String saveFile = "";

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(4012);

            ServletFileUpload upload = new ServletFileUpload(factory);

           List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
            byte[] data = null;
            String fileName = null;
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();

                  if (name.equalsIgnoreCase("Provider_Name")) {
                        Provider_Name = value;
                    } 
                    else if (name.equalsIgnoreCase("Energy_Type")) {
                        Energy_Type = value;
                    }
                    else if (name.equalsIgnoreCase("Quantity")) {
                        Quantity = value;
                    }
                    
                    else if (name.equalsIgnoreCase("Price")) {
                        Price = value;
                    }
                                                                         
                    
                    else if (name.equalsIgnoreCase("Start_Time")) {
                        Start_Time = value;
                    }
                      else if (name.equalsIgnoreCase("Description")) {
                        Description = value;
                    }
                      else if (name.equalsIgnoreCase("PR_Id")) {
                        PR_Id = value;
                    }
                  
                  else if (name.equalsIgnoreCase("Provider_Email")) {
                        Provider_Email = value;
                    }
                     
                   else if (name.equalsIgnoreCase("Provider_Address")) {
                        Provider_Address = value;
                    }
                            
                } else {
                    data = item.get();
                    fileName = item.getName();
                }
            }

            if (fileName != null && !fileName.isEmpty()) {
                String path1 = request.getSession().getServletContext().getRealPath("/");
                String strPath1 = path1 + File.separator + fileName;
                File file = new File(strPath1);
                FileOutputStream fileOut = new FileOutputStream(file);
                fileOut.write(data, 0, data.length);
                fileOut.flush();
                fileOut.close();

                FileInputStream fis = new FileInputStream(file);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_trading", "root", "admin");
              
                    PreparedStatement stInsert = con.prepareStatement("INSERT INTO upload_energy VALUES (?,?,?,?,?,?,?,?,?,?,'NO',?)");
                   stInsert.setInt(1, 0);
                    stInsert.setString(2, Provider_Name);                   
                    stInsert.setString(3, Energy_Type);  
                    stInsert.setString(4, Quantity);
                    stInsert.setString(5, Price);                                       
                    stInsert.setString(6, Start_Time);
                    stInsert.setString(7, Description);
                    stInsert.setString(8, PR_Id);
                    stInsert.setString(9, Provider_Email);
                    stInsert.setString(11, Provider_Address);
        
                    
                    stInsert.setBinaryStream(10, fis, (int) file.length());
                    int result = stInsert.executeUpdate();

                    fis.close();
                    file.delete(); // Delete the temporary uploaded file
                    if (result > 0) {
                        session.setAttribute("msg", "Energy Successfully Uploaded.");
                        response.sendRedirect("Upload_Energy.jsp"); // Redirect to login page
                    }
              
            } else {
                session.setAttribute("msg", "Please upload a file.");
                response.sendRedirect("Upload_Energy.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException e) {
            Logger.getLogger(Upload_Energy.class.getName()).log(Level.SEVERE, null, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "File upload failed.");
        } catch (ClassNotFoundException e) {
            Logger.getLogger(Upload_Energy.class.getName()).log(Level.SEVERE, null, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database driver not found.");
        } catch (SQLException e) {
            Logger.getLogger(Upload_Energy.class.getName()).log(Level.SEVERE, null, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
