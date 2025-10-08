<%-- 
    Document   : Cosumer_Account
    Created on : 12 Mar, 2025, 3:32:23 PM
--%>

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

        <!-- Main CSS File -->
        <link href="css/main.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">

    </head>

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



            <%
                Integer id = (Integer) session.getAttribute("CR_Id");
                String name = (String) session.getAttribute("Email");

                if (id != null && name != null) {
                    try {
                        Dbconnection db = new Dbconnection();
                        ResultSet rs = db.Select("SELECT * FROM consumer_register WHERE CR_Id='" + id + "' AND Email='" + name + "'");
                        if (rs.next()) {
                            String Consumer_Name = rs.getString("Consumer_Name");
                            String Consumer_Id = rs.getString("CR_Id");
                            String Consumer_Email = rs.getString("Email");
            %>

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
                            <li><a href="Consumer_View_Energy.jsp" >View Energy</a></li>
                            <li><a href="Booked_Energy.jsp">Booked Energy</a></li>
                            <li><a href="Consumer_Account.jsp" class="active">Add Account</a></li>
                            <li><a href="View_Account.jsp">Account Details</a></li>
                            <li><a href="index.html">Log Out</a></li>
                        </ul>
                        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                    </nav>
                </div>

            </div>

        </header>

        <main class="main">

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

            <h2 class="header-title">Add Your Account</h2>
            <div class="formbold-main-wrapper">
                <div class="formbold-form-wrapper">
                    <form id="addAccountForm" action="Consumer_Account" method="POST" enctype="multipart/form-data" onsubmit="return Validate_Data(true)">
                        <!-- Card Type -->
                        <div class="formbold-mb-3">
                            <label for="cardType" class="formbold-form-label">Card Type:</label>
                            <select class="formbold-form-input" name="Card_Type" id="cardType" required>
                                <option value="Credit">Credit</option>
                                <option value="Debit">Debit</option>
                            </select>
                        </div>

                        <!-- Card Brand -->
                        <div class="formbold-mb-3">
                            <label for="cards" class="formbold-form-label">Card Brand:</label>
                            <select class="formbold-form-input" name="cards" id="cards" required>
                                <option value="">Select Card Type</option>
                                <option value="American Exp">American Express</option>
                                <option value="discover">Discover</option>
                                <option value="visa">Visa</option>
                                <option value="diners">Diners</option>
                                <option value="mastercard">MasterCard</option>
                                <option value="Rupay">Rupay</option>
                                <option value="maestro">Maestro</option>
                            </select>
                        </div>

                        <!-- Cardholder Name -->
                        <div class="formbold-mb-3">
                            <label for="name" class="formbold-form-label">Cardholder Name:</label>
                            <input type="text" id="name" name="Cardholder_Name" value="" placeholder="Enter Cardholder Name" class="formbold-form-input" maxlength="20" required>
                        </div>

                        <!-- Card Number -->
                        <div class="formbold-mb-3">
                            <label for="cardnumber" class="formbold-form-label">Card Number:</label>
                            <input type="text" id="cardnumber" name="Card_Number" value="" placeholder="**** **** **** ****" class="formbold-form-input" required>
                        </div>

                        <!-- Expiration Date -->
                        <div class="formbold-mb-3">
                            <label for="expirationdate" class="formbold-form-label">Expiration Date (mm/yy):</label>
                            <input type="text" id="expirationdate" name="Expire_Date" placeholder="MM/YY" class="formbold-form-input" required>
                        </div>

                        <!-- Security Code (CVV) -->
                        <div class="formbold-mb-3">
                            <label for="securitycode" class="formbold-form-label">Security Code (CVV):</label>
                            <input type="text" id="securitycode" name="Cvv" pattern="[0-9]*" inputmode="numeric" class="formbold-form-input" required>
                        </div>

                        <!-- Set PIN Number -->
                        <div class="formbold-mb-3">
                            <label for="Pin" class="formbold-form-label">Set PIN Number:</label>
                            <input type="password" id="Pin" name="Pin" class="formbold-form-input" required>
                        </div>

                        <!-- Hidden Fields -->
                        <input type="hidden" name="CR_Id" value="<%=Consumer_Id%>">
                        <input type="hidden" name="Consumer_Email" value="<%=Consumer_Email%>">
                        <input type="hidden" name="Consumer_Name" value="<%=Consumer_Name%>">

                        <!-- Submit Button -->
                        <button type="submit" class="formbold-btn">Add Account</button>
                    </form>
                </div>
            </div>

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


                <%
                            }
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                    } else {
                        session.setAttribute("msg", "Session Out Please Login");
                        response.sendRedirect("error.jsp");
                    }
                %>


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
