import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Cancel_Booking")
public class Cancel_Booking extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String energyId = request.getParameter("energyId");
Connection con = null;
  HttpSession session = request.getSession(true);
        try {
            // Database Connection
           Class.forName("com.mysql.jdbc.Driver");

            // Establish Database Connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_trading", "root", "admin");

            // Delete query
            String query = "DELETE FROM book_energy WHERE Energy_Id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, energyId);

            int rowsAffected = ps.executeUpdate();

            ps.close();
            con.close();

            // Redirect back to the booked energy page
            if (rowsAffected > 0) {
                session.setAttribute("msg","Energy Cancelled Successfully");
                response.sendRedirect("Booked_Energy.jsp");
            } else {
                session.setAttribute("msg","Error! Energy Did not Cancelled");
                response.sendRedirect("Booked_Energy.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg","Error! Energy Did not Cancelled");
            response.sendRedirect("Booked_Energy.jsp");
        }
    }
}
