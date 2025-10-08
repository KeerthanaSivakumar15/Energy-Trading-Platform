
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

       
        <script src="https://api.tomtom.com/maps-sdk-for-web/cdn/5.x/5.64.0/services/services-web.min.js"></script>
                <script src="js/location.js" ></script>
    

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
                            <li><a href="index.html">Home</a></li>
                            <li class="dropdown"><a  href="#"><span>Provider</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                <ul>
                                    <li><a href="Provider_Reg.jsp">Register</a></li>            
                                    <li><a href="Provider_Log.jsp">Login</a></li>                     

                                </ul>
                            </li>
                            <li class="dropdown"><a class="active" href="#"><span>Consumer</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                <ul>
                                    <li><a href="Consumer_Reg.jsp">Register</a></li>            
                                    <li><a href="Consumer_Log.jsp">Login</a></li>                     

                                </ul>
                            </li>
                            
                            <li><a href="Admin_Log.jsp">Admin Log</a></li>
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
            
            
        <h2 class="header-title">Consumer Register</h2>
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form action="Consumer_Reg" method="POST" enctype="multipart/form-data">
                    <!-- User Name -->
                    <div class="formbold-mb-3">
                        <div>
                            <label for="name" class="formbold-form-label">Consumer Name:</label>
                            <input type="text" id="name" name="Consumer_Name" placeholder="Enter your name" class="formbold-form-input" required>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="formbold-mb-3">
                        <div>
                            <label for="email" class="formbold-form-label">Email:</label>
                            <input type="email" id="email" name="Email" placeholder="Enter your email" class="formbold-form-input" required>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="formbold-mb-3">
                        <div>
                            <label for="password" class="formbold-form-label">Password:</label>
                            <input type="password" id="password" name="Password" placeholder="Enter your password" class="formbold-form-input" required>
                        </div>
                    </div>

                    <!-- Contact Number -->
                    <div class="formbold-mb-3">
                        <div>
                            <label for="contact" class="formbold-form-label">Contact Number:</label>
                            <input type="text" id="contact" name="Contact" placeholder="Enter your contact number" class="formbold-form-input" required>
                        </div>
                    </div>

                    <!-- State -->
                    <div class="formbold-mb-3">
                        <div>
                            <label for="state" class="formbold-form-label">State:</label>
                            <input type="text" id="state" name="State" placeholder="Enter your State" class="formbold-form-input" required>
                        </div>
                    </div>

                    <!-- City -->
                    <div class="formbold-mb-3">
                        <div>
                            <label for="city" class="formbold-form-label">City:</label>
                            <input type="text" id="city" name="City" placeholder="Enter your City" class="formbold-form-input" required>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="formbold-mb-3">
                        <div>
                                <label for="firstname" class="formbold-form-label"> Address</label>
                                <input type="text" value="" name="address" id="loc1"  placeholder="Enter your Address" class="formbold-form-input" required />
                            </div>
                    </div>
                    <input type="hidden" name="lat" id="lat" />
                    <input type="hidden" name="long" id="lan"/>
                    <!-- Profile Picture -->
                    <div class="formbold-mb-3">
                        <div>
                            <label for="profile" class="formbold-form-label">Profile Picture:</label>
                            <input type="file" id="profile" name="image" class="formbold-form-file">
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="formbold-btn">Register</button>
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
     <script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOU-GKNx-YL5o-b8cvlqgyn0rso6iQtUk&callback=showlocation"
        type="text/javascript"></script>      
 

</body>
</html>
