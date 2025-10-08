<%-- 
    Document   : Admin_Home
    Created on : 18 Feb, 2025, 12:49:07 PM
  
--%>

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
        #hero img{
            opacity: 2;
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
                <li><a href="Admin_Home.jsp" class="active">Home</a></li>
                <li><a href="Provider_Approve.jsp">Provider Approval</a></li>  
                <li><a href="Energy_Approve.jsp">Energy Approval</a></li>
                <li><a href="Consumer_Approve.jsp">Consumer Approval</a></li>
                <li><a href="index.html">Logout</a></li>


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

                <!-- About Section -->
                <section id="about" class="about section">

                    <!-- Section Title -->
                    <div class="container section-title" data-aos="fade-up">
                        <span>About Us<br></span>
                        <h2>About Us<br></h2>

                    </div><!-- End Section Title -->

                    <div class="container">

                        <div class="row gy-4">


                            <div class="col-lg-6 order-2 order-lg-2 content" data-aos="fade-up" data-aos-delay="200">
                                <h3>Why Trust Us for Energy Trading?</h3>
                                <p class="fst-italic">
                                   Ensuring Transparent Trading and Secure Transactions for a Seamless Energy Trading Experience.
                                </p>
                                <ul>
                                    <li><i class="bi bi-check-circle"></i> <span>Empower yourself with decentralized energy trading, where every participant has equal opportunities and full control over transactions.</span></li>
                                    <li><i class="bi bi-check-circle"></i> <span>Utilizing cutting-edge encryption and blockchain technology, we ensure your trades are fully secure. </span></li>
                                    <li><i class="bi bi-check-circle"></i> <span>Whether you're a large enterprise or an individual, our platform?s intuitive interface makes it easy to buy, sell, or trade energy with just a few clicks.</span></li>

                                </ul>
                                <a href="#" class="read-more"><span>Explore</span><i class="bi bi-arrow-right"></i></a>
                            </div>

                            <div class="col-lg-6 order-1 order-lg-1" data-aos="fade-up" data-aos-delay="100">
                                <img src="assets/img/hom.jpg" class="img-fluid" alt="">
                            </div>


                        </div>

                    </div>

                </section><!-- /About Section -->



          

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
