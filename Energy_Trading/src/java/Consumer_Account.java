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
import java.util.UUID;
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

@WebServlet(urlPatterns = {"/Consumer_Account"})
public class Consumer_Account extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        try {
            String Card_Type="",cards="", Cardholder_Name = "" ,Card_Number = "",Expire_Date = "",Cvv="",CR_Id="",Consumer_Email="",Consumer_Name="",Amount="100000",Pin="";
            

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(4012);

            ServletFileUpload upload = new ServletFileUpload(factory);

            List items = upload.parseRequest(new ServletRequestContext(request));
            byte[] data = null;
            String fileName = null;
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();

                  if (name.equalsIgnoreCase("Card_Type")) {
                        Card_Type = value;
                    } 
                    else if (name.equalsIgnoreCase("cards")) {
                        cards = value;
                    } 
                    else if (name.equalsIgnoreCase("Cardholder_Name")) {
                        Cardholder_Name = value;
                    } 
                    else if (name.equalsIgnoreCase("Card_Number")) {
                        Card_Number = value;
                    }                   
                    else if (name.equalsIgnoreCase("Expire_Date")) {
                        Expire_Date = value;
                    }
                     else if (name.equalsIgnoreCase("Cvv")) {
                        Cvv = value;
                    } 
                     else if (name.equalsIgnoreCase("CR_Id")) {
                        CR_Id = value;
                    }                   
                   else if (name.equalsIgnoreCase("Consumer_Email")) {
                        Consumer_Email = value;
                    } 
                   else if (name.equalsIgnoreCase("Consumer_Name")) {
                        Consumer_Name = value;
                    } 
                  else if (name.equalsIgnoreCase("Amount")) {
                        Amount = value;
                    } 
                  else if (name.equalsIgnoreCase("Pin")) {
                        Pin = value;
                    } 
                 
                } else {
                   
                }
            }

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_trading", "root", "admin");
                                          
                String query = "SELECT * FROM consumer_account WHERE Card_Number=?";
                PreparedStatement st = con.prepareStatement(query);
                st.setString(1, Card_Number);

                ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    session.setAttribute("msg", "Account Number already exists. Please Try Another Account Number.");
                    response.sendRedirect("Consumer_Account.jsp");
                } else {
                
                    String Query= "INSERT INTO consumer_account VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement stInsert = con.prepareStatement(Query);
                    stInsert.setInt(1, 0);
                    stInsert.setString(2, Card_Type);                    
                    stInsert.setString(3, cards);              
                    stInsert.setString(4, Cardholder_Name);
                    stInsert.setString(5, Card_Number ); 
                    stInsert.setString(6, Expire_Date);                    
                    stInsert.setString(7, Cvv);
                    stInsert.setString(8, CR_Id);
                    stInsert.setString(9, Consumer_Email);
                    stInsert.setString(10, Consumer_Name);
                    stInsert.setString(11, Amount);
                    stInsert.setString(12, Pin);  
                                
                    int result = stInsert.executeUpdate();   
                    if (result > 0) {
                        session.setAttribute("msg", "Your Account Successfully Added.");
                        response.sendRedirect("Consumer_Account.jsp"); // Redirect to login page
                    }
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
            Logger.getLogger(Consumer_Account.class.getName()).log(Level.SEVERE, null, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "File upload failed.");
        } catch (ClassNotFoundException e) {
            Logger.getLogger(Consumer_Account.class.getName()).log(Level.SEVERE, null, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database driver not found.");
        } catch (SQLException e) {
            Logger.getLogger(Consumer_Account.class.getName()).log(Level.SEVERE, null, e);
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
