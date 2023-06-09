<%-- 
    Document   : userProfile
    Created on : May 26, 2023, 5:18:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User profile</title>
    <link rel="stylesheet" href="./css/user.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

</head>
<body>
    <div class="main-content">
      <!-- Top navbar -->
      <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
        <div class="container-fluid">
          <!-- Brand -->
          <a style="font-size: 26px; font-weight: 700; font-family: monospace;" class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="HomePage.jsp" target="_blank">Pet Hello</a>
          <!-- Form -->
          <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
            <div class="form-group mb-0">
              <div class="input-group input-group-alternative">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-search"></i></span>
                </div>
                <input class="form-control" placeholder="Search" type="text">
              </div>
            </div>
          </form>
          <!-- User -->
          <ul class="navbar-nav align-items-center d-none d-md-flex">
            <li class="nav-item dropdown">
              <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <div class="media align-items-center">
                  <span class="avatar avatar-sm rounded-circle">
                    <img alt="Image placeholder" src="https://i.pinimg.com/564x/8d/76/69/8d7669a1e8bbf95581ce3e1b18352319.jpg">
                  </span>
                  <div class="media-body ml-2 d-none d-lg-block">
                    <span class="mb-0 text-sm  font-weight-bold">Suong Mai</span>
                  </div>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                <div class=" dropdown-header noti-title">
                  <h6 class="text-overflow m-0">Welcome!</h6>
                </div>
                <a href="../examples/profile.html" class="dropdown-item">
                  <i class="ni ni-single-02"></i>
                  <span>My profile</span>
                </a>
                <a href="../examples/profile.html" class="dropdown-item">
                  <i class="ni ni-settings-gear-65"></i>
                  <span>Settings</span>
                </a>
                <a href="../examples/profile.html" class="dropdown-item">
                  <i class="ni ni-calendar-grid-58"></i>
                  <span>Activity</span>
                </a>
                <a href="../examples/profile.html" class="dropdown-item">
                  <i class="ni ni-support-16"></i>
                  <span>Support</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#!" class="dropdown-item">
                  <i class="ni ni-user-run"></i>
                  <span>Logout</span>
                </a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      <!-- Header -->
      <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 600px;
       background-image: url(https://i.pinimg.com/564x/b7/77/00/b7770014caa3eaf3db1a12a50a7fce1f.jpg);
        background-size: cover; background-position: center top;
        
       ">
        <!-- Mask -->
        <span class="mask bg-gradient-default opacity-8"></span>
        <!-- Header container -->
        <div class="container-fluid d-flex align-items-center">
          <div class="row">
            <div class="col-lg-7 col-md-10">
              <h1 class="display-2 text-white">Hello Suong Mai</h1>
              <p class="text-white mt-0 mb-5">This is your profile page. You can see the information you've save with your profile and manage your profile </p>
               </div>
          </div>
        </div>
      </div>
      <!-- Page content -->
      <div class="container-fluid mt--7">
        <div class="row">
          <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
            <div class="card card-profile shadow">
              <div class="row justify-content-center">
                <div class="col-lg-3 order-lg-2">
                  <div class="card-profile-image">
                    <a href="#">
                      <img src="https://i.pinimg.com/564x/8d/76/69/8d7669a1e8bbf95581ce3e1b18352319.jpg" class="rounded-circle">
                    </a>
                  </div>
                </div>
              </div>
              <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                <div class="d-flex justify-content-between">
                </div>
              </div>
              <div class="card-body pt-0 pt-md-4">
                <div class="row">
                  <div class="col">
                    <div class="card-profile-stats d-flex justify-content-center mt-md-5">
                      <form action="">

                          <div class="avatar-form-change">
                            <button>Choose avatar</button>
                            <input type="Submit" name="MAIN" value="Save" />
                          </div>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="text-center">
                  <h3>
                    Suong Mai
                  </h3>
                  
                  <hr class="my-4">
                  <p>Usually update your profile so we can get your newest information</p>
                  <a href="#">Help</a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-8 order-xl-1">
            <div class="card bg-secondary shadow">
              <div class="card-header bg-white border-0">
                <div class="row align-items-center">
                  <div class="col-8">
                    <h3 class="mb-0">My account</h3>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <form>
                  <h6 class="heading-small text-muted mb-4">User information</h6>
                  <div class="pl-lg-4">
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="form-group focused">
                          <label class="form-control-label" for="input-username">Username</label>
                          <input type="text" id="input-username" class="form-control form-control-alternative" placeholder="Username" value="Suong Mai Cute">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label class="form-control-label" for="input-email">Email address</label>
                          <input type="email" id="input-email" class="form-control form-control-alternative" placeholder="suongmai07072003@gmail.com">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="form-group focused">
                          <label class="form-control-label" for="input-first-name">First name</label>
                          <input type="text" id="input-first-name" class="form-control form-control-alternative" placeholder="First name" value="Mai">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group focused">
                          <label class="form-control-label" for="input-last-name">Last name</label>
                          <input type="text" id="input-last-name" class="form-control form-control-alternative" placeholder="Last name" value="suongmai07072003">
                        </div>
                      </div>
                    </div>
                  </div>
                  <hr class="my-4">
                  <!-- Address -->
                  <h6 class="heading-small text-muted mb-4">Contact information</h6>
                  <div class="pl-lg-4">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group focused">
                          <label class="form-control-label" for="input-address">Address</label>
                          <input id="input-address" class="form-control form-control-alternative" placeholder="Home Address" value="Nguyen Van Tang street, 9 District " type="text">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group focused">
                          <label class="form-control-label" for="input-city">City</label>
                          <input type="text" id="input-city" class="form-control form-control-alternative" placeholder="City" value="Ho Chi Minh">
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group focused">
                          <label class="form-control-label" for="input-country">Country</label>
                          <input type="text" id="input-country" class="form-control form-control-alternative" placeholder="Country" value="Viet Nam">
                        </div>
                      </div>
                    </div>
                  </div>
                  
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- footer section start  -->
    <section class="footer">
        <div class="box-container ">

            <div class="block">
                <h3>Quick links</h3>
                <a href="./Homepage.html"> <i class="ri-arrow-right-line"></i> Home </a> <br>
                <a href="./shop.html"> <i class="ri-arrow-right-line"></i> Shop </a><br>
                <a href="./about.html"> <i class="ri-arrow-right-line"></i> About </a><br>
                <a href="./team.html"> <i class="ri-arrow-right-line"></i> Team </a><br>
                <a href="./blog.html"> <i class="ri-arrow-right-line"></i> Blog </a><br>
                <a href="./contact.html"> <i class="ri-arrow-right-line"></i> Contact </a>
            </div>

            <div class="block">
                <h3>Extra links</h3>
                <a href="#"> <i class="ri-arrow-right-line"></i> My Order </a> <br>
                <a href="#"> <i class="ri-arrow-right-line"></i> My Wishlist </a><br>
                <a href="#"> <i class="ri-arrow-right-line"></i> My Account </a><br>
                <a href="#"> <i class="ri-arrow-right-line"></i> My Favorite </a><br>
                <a href="#"> <i class="ri-arrow-right-line"></i> Terms of user </a>
            </div>

            <div class="block">
                <h3>Extra links</h3>
                <a href="#"> <i class="ri-facebook-fill"></i> Facebook </a><br>
                <a href="#"> <i class="ri-twitter-fill"></i> Twitter </a><br>
                <a href="#"> <i class="ri-instagram-fill"></i> Instagram </a><br>
                <a href="#"> <i class="ri-linkedin-box-fill"></i> Linkedin </a><br>
                <a href="#"> <i class="ri-pinterest-fill"></i> Pinterest </a>
            </div>

            <div  class="block">
                <h3>Newsletter</h3>
                <p>Subscribe for latest updates</p>
                <form class="letter" action="#">
                    <input type="email" name="" placeholder="enter your email" id="">
                    <input name="MAIN" type="submit" value="subscribe" class="btn">
                </form>
            </div>

        </div>
    </section>
    <!-- footer section end  -->
  </body>
</html>