<%-- 
    Document   : Book_Energy
    Created on : 12 Mar, 2025, 5:19:03 PM
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Connection.Dbconnection"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Energy Trading</title>
        <meta name="description" content="">
        <meta name="keywords" content="">



        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


        <!-- Main CSS File -->
        <link href="css/main.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">

    </head>
    <style>
        /* Main container styling */
.container3 {
    max-width: 500px;
    margin: 50px auto;
    padding: 25px;
    background: linear-gradient(135deg, #ffcc00, #ff6600);
    color: #fff;
    border-radius: 12px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    font-family: 'Arial', sans-serif;
    animation: fadeIn 1s ease-in-out;
}

/* Fade-in animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Title */
.form-title {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 15px;
}

/* Energy details */
.energy-details {
    background: rgba(255, 255, 255, 0.2);
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 15px;
}

/* Input field */
.booking-form input {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
}

/* Total Price Display */
#totalPrice {
    font-size: 20px;
    font-weight: bold;
    color: #fff;
}

/* Submit Button */
.submit-btn {
    display: block;
    width: 100%;
    padding: 12px;
    background: #28a745;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    text-align: center;
    transition: 0.3s ease-in-out;
}

.submit-btn:hover {
    background: #218838;
    transform: scale(1.05);
}

/* Responsive Design */
@media (max-width: 600px) {
    .container3 {
        width: 90%;
    }
}

    </style>
    <body class="index-page">

        <%
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>
        <script> alert("<%=msg%>");</script>
        
        <%
            }
            session.removeAttribute("msg");
        %>
        <header id="header" class="header fixed-top">

            <div class="branding d-flex align-items-center">

                <div class="container position-relative d-flex align-items-center justify-content-between">
                    <a href="index.jsp" class="logo d-flex align-items-center">
                        <!-- Uncomment the line below if you also wish to use an image logo -->
                        <!-- <img src="assets/img/logo.png" alt=""> -->
                        <h1 class="sitename">Energy <SPAN style="color:#0FA4AF">Trading</SPAN></h1>
                    </a>
                    <nav id="navmenu" class="navmenu">
                        <ul>
                            <li><a href="Consumer_Home.jsp" >Home</a></li>                                     
                            <li><a href="Consumer_View_Energy.jsp" class="active">View Energy</a></li>
                            <li><a href="Booked_Energy.jsp">Booked Energy</a></li>
                            <li><a href="Consumer_Account.jsp">Add Account</a></li>
                            <li><a href="View_Account.jsp">Account Details</a></li>
                            <li><a href="index.html">Log Out</a></li>
                        </ul>
                        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                    </nav>
                </div>

            </div>

        </header>

       <!-- Hero Section -->
            <section id="hero" class="hero section dark-background">

                <img src="assets/img/hom.jpg" alt="" data-aos="fade-in">

                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <div class="row justify-content-start">
                        <div class="col-lg-12">
                            <h2>Welcome to Energy Trading</h2>
                            <p>Empowering Energy Trading for Everyone ? Efficient, Transparent, Sustainable!</p>
                            <center><a href="#about" class="btn-get-started">Get Started</a></center>
                        </div>
                    </div>
                </div>

            </section><!-- /Hero Section -->
  
           <%
    Integer id = (Integer) session.getAttribute("CR_Id");
    String name = (String) session.getAttribute("Email");

    if (id != null && name != null) {
        try {
            Dbconnection db = new Dbconnection();
            ResultSet ts = db.Select("SELECT * FROM consumer_register WHERE CR_Id='" + id + "' AND Email='" + name + "'");
            if (ts.next()) {
                String Consumer_Name = ts.getString("Consumer_Name");
                String Consumer_Id = ts.getString("CR_Id");
                String Consumer_Email = ts.getString("Email");

                // Get the energy ID from the query string
                String energyId = request.getParameter("energyId");

                // Establish a connection to the database
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_trading", "root", "admin");

                // Retrieve energy details
                PreparedStatement ps = con.prepareStatement("SELECT Energy_Type, Quantity, Price, Description, PR_Id FROM upload_energy WHERE UE_Id = ?");
                ps.setString(1, energyId);
                ResultSet rs = ps.executeQuery();

                String Energy_Type = "";
                int Available_Quantity = 0;
                double Price_Per_Kwh = 0.0;
                String Description = "";
                String Provider_Id = "";

                if (rs.next()) {
                    Energy_Type = rs.getString("Energy_Type");
                    Available_Quantity = rs.getInt("Quantity");
                    Price_Per_Kwh = rs.getDouble("Price");
                    Description = rs.getString("Description");
                    Provider_Id = rs.getString("PR_Id");
                }
                
               

                // Fetch consumer account details
                PreparedStatement psConsumer = con.prepareStatement("SELECT Card_Number, Card_Type FROM consumer_account WHERE CR_Id = ?");
                psConsumer.setString(1, Consumer_Id);
                ResultSet rsConsumer = psConsumer.executeQuery();

                String Consumer_Account_Number = "", Consumer_Bank_Name = "";
                if (rsConsumer.next()) {
                    Consumer_Account_Number = rsConsumer.getString("Card_Number");
                    Consumer_Bank_Name = rsConsumer.getString("Card_Type");
                 
                }
                rsConsumer.close();
                psConsumer.close();

                // Fetch provider account details
                PreparedStatement psProvider = con.prepareStatement("SELECT Card_Number, Card_Type FROM provider_account WHERE PR_Id = ?");
                psProvider.setString(1, Provider_Id);
                ResultSet rsProvider = psProvider.executeQuery();

                String Provider_Account_Number = "", Provider_Bank_Name = "", Provider_IFSC = "";
                if (rsProvider.next()) {
                    Provider_Account_Number = rsProvider.getString("Card_Number");
                    Provider_Bank_Name = rsProvider.getString("Card_Type");
                   ;
                }
               
%>

<div class="container3">
    <h2 class="form-title"><i class="fas fa-bolt"></i> Book Energy</h2>

    <!-- Display Energy Details -->
    <div class="energy-details">
        <p><strong><i class="fas fa-plug"></i> Energy Type:</strong> <%= Energy_Type %></p>
        <p><strong><i class="fas fa-battery-full"></i> Available Quantity (kWh):</strong> <%= Available_Quantity %></p>
        <p><strong><i class="fas fa-tag"></i> Price (per kWh):</strong> &#8377 <span id="pricePerKwh"><%= Price_Per_Kwh %></span></p>
    </div>

    <!-- Booking Form -->
    <form action="Book_Energy" method="POST" enctype="multipart/form-data" class="booking-form">
        <input type="hidden" name="Energy_Type" value="<%= Energy_Type %>">
        <input type="hidden" name="Energy_Id" value="<%= energyId %>">
        <input type="hidden" name="User_Id" value="<%= Consumer_Id %>">
        <input type="hidden" name="User_Name" value="<%= Consumer_Name %>">
        <input type="hidden" name="Provider_Id" value="<%= Provider_Id %>">

        <!-- Hidden Consumer Account Details -->
        <input type="hidden" name="Consumer_Bank_Name" value="<%= Consumer_Bank_Name %>">
        <input type="hidden" name="Consumer_Account_Number" value="<%= Consumer_Account_Number %>">
        
        <!-- Hidden Provider Account Details -->
        <input type="hidden" name="Provider_Bank_Name" value="<%= Provider_Bank_Name %>">
        <input type="hidden" name="Provider_Account_Number" value="<%= Provider_Account_Number %>">

        <label for="quantity"><i class="fas fa-balance-scale"></i> Select Quantity (kWh):</label>
        <input type="number" id="quantity" name="Quantity" min="1" max="<%= Available_Quantity %>" required>

        <p><strong><i class="fas fa-calculator"></i> Total Price:</strong> &#8377 <span id="totalPrice">0</span></p>
        <input type="hidden" id="totalPriceInput" name="Total_Price" readonly>

        <!-- Submit Button -->
        <button type="submit" class="submit-btn"><i class="fas fa-check-circle"></i> Confirm Booking</button>
    </form>
</div>



<script>
    document.getElementById("quantity").addEventListener("input", function () {
        let pricePerKwh = parseFloat(document.getElementById("pricePerKwh").textContent);
        let quantity = parseInt(this.value) || 0;
        let totalPrice = pricePerKwh * quantity;

        document.getElementById("totalPrice").textContent = totalPrice.toFixed(2);
        document.getElementById("totalPriceInput").value = totalPrice.toFixed(2);
    });
</script>

<%
    
    
     rs.close();
                ps.close();
                
                 rsProvider.close();
                psProvider.close();

                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
            
    <footer id="footer" class="footer position-relative dark-background">
                <div class="container footer-top">
                    <div class="row gy-4">
                        <div class="col-lg-4 col-md-6">
                            <div class="footer-about">
                                <a href="index.html" class="logo sitename">ENERGY TRADING</a>
                                <div class="footer-contact pt-3">
                                    <p>Chennai Central,</p>
                                    <p>Anna Salai, Chennai, 600003.</p>
                                    <p class="mt-3"><strong>Phone:</strong> <span>+91 98765 41230</span></p>
                                    <p><strong>Email:</strong> <span>info@energytrading.com</span></p>
                                </div>
                                <div class="social-links d-flex mt-4">
                                    <a href=""><i class="bi bi-twitter-x"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="bi bi-instagram"></i></a>
                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-3 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="User_Reg.jsp">Register</a></li>
                                <li><a href="User_Log.jsp">Login</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-2 col-md-3 footer-links">
                            <h4>Our Services</h4>
                            <ul>
                                <li><a href="#">Decentralized Trading</a></li>
                                <li><a href="#">Smart Contract</a></li>
                                <li><a href="#">Transaction History</a></li>
                                <li><a href="#">Instant Alerts</a></li>
                            </ul>

                        </div>

                        <div class="col-lg-4 col-md-12 footer-newsletter">
                            <h4>Our Newsletter</h4>
                            <p>Subscribe to our newsletter and receive the latest news about auctions!</p>
                            <form action="forms/newsletter.php" method="post" class="php-email-form">
                                <div class="newsletter-form"><input type="email" name="email"><input type="submit" value="Subscribe"></div>
                                <div class="loading">Loading</div>
                                <div class="error-message"></div>
                                <div class="sent-message">Your subscription request has been sent. Thank you!</div>
                            </form>
                        </div>

                    </div>
                </div>



            </footer>

            <!-- Scroll Top -->
            <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

            <!-- Preloader -->


            <!-- Vendor JS Files -->
            <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="assets/vendor/php-email-form/validate.js"></script>
            <script src="assets/vendor/aos/aos.js"></script>
            <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
            <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
            <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
            <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

            <!-- Main JS File -->
            <script src="js/main.js"></script>

    </body>
</html>
