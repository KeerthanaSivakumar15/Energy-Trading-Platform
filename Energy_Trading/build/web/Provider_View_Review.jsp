<%-- 
    Document   : Provider_View_Review
    Created on : 17 Mar, 2025, 10:54:55 AM
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


    </head>
   <style>

.containers {
    max-width:80%;
    margin: 30px auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

        .course-details-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

        }

        .section-title h5 {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            border-bottom: 3px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
        }

        .edu-comment {
            background: #ffffff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
            transition: transform 0.3s ease-in-out;
        }

        

        .comment-content {
            padding: 10px;
        }

        .comment-top h6 {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 5px;
        }

        .subtitle {
            font-size: 14px;
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        .comment-content p {
            font-size: 14px;
            color: #444;
            line-height: 1.5;
            margin: 5px 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .course-details-card {
                padding: 15px;
            }

            .comment-top h6 {
                font-size: 16px;
            }

            .subtitle, .comment-content p {
                font-size: 13px;
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


            <%
                Integer id = (Integer) session.getAttribute("PR_Id");
                String name = (String) session.getAttribute("Email");

                if (id != null && name != null) {
                    try {
                        Dbconnection db = new Dbconnection();
                        ResultSet rs = db.Select("SELECT * FROM provider_register WHERE PR_Id='" + id + "' AND Email='" + name + "'");
                        if (rs.next()) {
                            String User_Name = rs.getString("Provider_Name");
                            String User_Id = rs.getString("PR_Id");
                            String User_Email = rs.getString("Email");
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
                            <li><a href="Provider_Home.jsp" >Home</a></li>
                            <li><a href="Upload_Energy.jsp">Upload Energy</a></li> 
                            
                            <li class="dropdown"><a href="#" class="active"><span>View</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                <ul>
                                   <li><a href="Provider_Energy.jsp">Uploaded Energy</a></li>
                                  <li><a href="View_Booked_Energy.jsp">Consumer Booked Energy</a></li>                   

                                </ul>
                            </li>
                            
                            
                            <li><a href="Provider_Account.jsp">Add Account</a></li>
                            <li><a href="View_Provider_Account.jsp">Account Details</a></li>
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


            
     

<selection id="service">


        
        
        
         <%
             
             String Energy_Id=request.getParameter("Energy_Id");
                        ResultSet ts = db.Select("SELECT * FROM review WHERE Energy_Id='" + Energy_Id + "'");
                       
                    %>

                   <div class="containers">
        
    
    <h2 style="text-align:center; font-weight: bold; color: #007bff; ">Reviews</h2>

    <% while (ts.next())
    
    {
    
    %>


    <!--  Comment Box start--->
    <div class="edu-comment">
        <div class="comment-content">
            <div class="comment-top">
                <h6 class="title">User Name: <%=ts.getString(1)%></h6>
            </div>
            <span class="subtitle">SCORE: <%=ts.getString(4)%></span>
            <p>MESSAGE: <%=ts.getString(2)%></p>
            <p>Current Location: <%=ts.getString(11)%></p>
        </div>                               
    </div>
<%}
%>
</div>

                    
    </selection> 

          

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
