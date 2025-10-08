import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

@WebServlet("/Book_Energy")
public class Book_Energy extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
         String Energy_Type = "", Energy_Id="", User_Id="", User_Name="", Provider_Id="",Quantity="" , Total_Price="",Provider_Account_Number="",Consumer_Account_Number="";


            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(4012);

            ServletFileUpload upload = new ServletFileUpload(factory);

           List<FileItem> items = null;
        try {
            items = upload.parseRequest(new ServletRequestContext(request));
        } catch (FileUploadException ex) {
            Logger.getLogger(Book_Energy.class.getName()).log(Level.SEVERE, null, ex);
        }
            byte[] data = null;
            String fileName = null;
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();

                  if (name.equalsIgnoreCase("Energy_Type")) {
                        Energy_Type = value;
                    } 
                    else if (name.equalsIgnoreCase("Energy_Id")) {
                        Energy_Id = value;
                    }
                    else if (name.equalsIgnoreCase("User_Id")) {
                        User_Id = value;
                    }
                    
                    else if (name.equalsIgnoreCase("User_Name")) {
                        User_Name = value;
                    }
                                                                         
                    
                    else if (name.equalsIgnoreCase("Provider_Id")) {
                        Provider_Id = value;
                    }
                      else if (name.equalsIgnoreCase("Quantity")) {
                        Quantity = value;
                    }
                      else if (name.equalsIgnoreCase("Total_Price")) {
                        Total_Price = value;
                    }
                   else if (name.equalsIgnoreCase("Consumer_Account_Number")) {
                        Consumer_Account_Number = value;
                    }
                   else if (name.equalsIgnoreCase("Provider_Account_Number")) {
                        Provider_Account_Number = value;
                    }
                  
                 
                            
                } else {
                    data = item.get();
                    fileName = item.getName();
                }
            }
        
       
    

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish Database Connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_trading", "root", "admin");

            // Start Transaction
            conn.setAutoCommit(false);

            // Step 1: Insert Data into book_energy Table
            String insertSql = "INSERT INTO book_energy VALUES (?, ?, ?, ?, ?, ?, ?,?)";
            ps = conn.prepareStatement(insertSql);
            ps.setInt(1, 0);
            ps.setString(2, Energy_Type);
            ps.setString(3, Energy_Id);
            ps.setString(4, User_Id);
            ps.setString(5, User_Name);
            ps.setString(6, Provider_Id);
            ps.setString(7, Quantity);
            ps.setString(8, Total_Price);
            ps.executeUpdate();

            // Step 2: Debit Amount from Consumer Account
            String debitSql = "UPDATE Consumer_Account SET Amount = Amount - ? WHERE Card_Number = ?";
            ps = conn.prepareStatement(debitSql);
            ps.setString(1, Total_Price);
            ps.setString(2, Consumer_Account_Number);
            ps.executeUpdate();

            // Step 3: Credit Amount to Provider Account
            String creditSql = "UPDATE Provider_Account SET Amount = Amount + ? WHERE Card_Number = ?";
            ps = conn.prepareStatement(creditSql);
            ps.setString(1, Total_Price);
            ps.setString(2, Provider_Account_Number);
            ps.executeUpdate();

            // Step 4: Update Available Quantity in upload_energy Table
            String updateQuantitySql = "UPDATE upload_energy SET Quantity =Quantity - ? WHERE UE_Id = ?";
            ps = conn.prepareStatement(updateQuantitySql);
            ps.setString(1, Quantity);
            ps.setString(2, Energy_Id);
            ps.executeUpdate();

            // Commit Transaction
            conn.commit();

            // Redirect to success page
            response.sendRedirect("Consumer_View_Energy.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback(); // Rollback in case of error
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            response.sendRedirect("Consumer_View_Energy.jsp");
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
