html lang="en">
<%@page import="aiwa.entity.Item"%>
<%@page import="aiwa.entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<%
ArrayList<Item>items=(ArrayList<Item>)request.getAttribute("items");
String word=(String)request.getAttribute("word");
int CategoryId=(int)request.getAttribute("categoryid");
ArrayList<Category>categories=(ArrayList<Category>)request.getAttribute("categories");
%>

<body>

    <!--navbar-->
    <nav class="navbar navbar-expand-lg bg-white shadow py-3">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img height="100px" width="100px"
                    src="https://dynamic.design.com/preview/logodraft/cdce848c-d11d-4eb0-bb07-eaacfb3ce815/image/large.png">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#menu">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#reservation">Reservation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#blog">Blog</a>
                    </li>

                </ul>
                <a href="#" class="btn btn-brand">Order online</a>
            </div>
        </div>
    </nav>

    <!--hero slider-->
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item text-center bg-dark vh-100 active slide-1">
                <div class="container h-100 d-flex align-items-center justify-content-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <h6 class="text-white">WELCOME TO THE CHINAWOK</h6>
                            <h1 class="display-1 fw-bold text-white">Grilled Chicken</h1>

                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item text-center bg-dark vh-100 slide-2">
                <div class="container h-100 d-flex align-items-center justify-content-center ">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <h6 class="text-white">WELCOME TO THE CHINAWOK</h6>
                            <h1 class="display-1 fw-bold text-white">Fresh and Tasty Food</h1>


                        </div>
                    </div>
                </div>

            </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroSlider" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroSlider" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    

    <!--menu-->
    <section id="menu" class="bg-light">
        <div class="container">
            <div class="row gy-4 align-items-center">
                <div class="col-12 intro-text">
                    <h1>Explore our menu</h1>
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cupiditate laudantium omnis cum veniam,
                        id aspernatur impedit.</p>
                </div>
            </div>
        </div>
        <div class="container">
            <ul class="nav nav-pills justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" href="#">All dishes</a>

                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#">Breakfast</a>

                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Lunch</a>

                </li>
                <li class="nav-item">
                    <a class="nav-link  " href="#">Dinner</a>

                </li>
            </ul>
            <div class="row gy-4">
                <div class="col-lg-3 col-sm-6">
                    <div class="menu-item">
                        <img width="200 px" height="150px"
                            src="https://media.istockphoto.com/id/473582820/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E3%83%8D%E3%83%91%E3%83%BC%E3%83%AB%E3%82%BF%E3%83%BC%E3%83%AA%E3%83%BC%E3%81%AE%E3%81%8A%E6%96%99%E7%90%86%E3%81%AB%E3%81%AF%E3%83%9E%E3%83%88%E3%83%B3%E3%82%AB%E3%83%AC%E3%83%BC%E8%A8%AD%E5%AE%9A.jpg?s=612x612&w=0&k=20&c=pZMEH_-lGMtngSDGM1Kn6wV4vyGmpxV3DtolOSznBik=">
                        <div class="menu-item-content p-4">
                            <div>
                                <span>Rated(5.4)</span>
                                <span>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-half-fill"></i>
                                </span>
                            </div>
                            <h5 class="mt-1 mb-2">Dal Bhat Tarkari</h5>
                            <p class="small">
                                Dal Bhat Tarkari is one of the most delicious food of nepal which is loved by nepalese
                                people.This food is also called as a 24 hour energy giving food.
                                This food is made in each and every house of nepalese people.In each and every festival
                                or any things nepalese used to make this food.
                            </p>
                        </div>
                    </div>
                </div>
                

    

    <!--reservation-->
    <section id="Reservation">
        <div class="container">
            <div class="row">
                <div class="col-12 intro-text">
                    <h1>Reservation</h1>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam recusandae ullam distinctio
                        soluta deserunt a accusantium.</p>

                </div>
            </div>
            <form action="#" class="row ">
                <div class="col-lg-8">
                    <div class="row g-3">
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" placeholder="Full Name">

                        </div>
                        <div class="form-group col-md-6">
                            <input type="email" class="form-control" placeholder="Email Address">

                        </div>
                        <div class="form-group col-md-6">
                            <input type="date" class="form-control" placeholder="Date">

                        </div>
                        <div class="form-group col-md-6">
                            <input type="time" class="form-control" placeholder="Time">

                        </div>
                        <div class="form-group col-md-12">
                            <textarea name="" id="" cols="30" rows="4" class="form-control"
                                placeholder="Message"></textarea>
                        </div>
                        <div class="form-group text-center">
                            <a href="#" class="btn btn-brand">Send Message</a>
                        </div>
                    </div>
                </div>

            </form>
        </div>

    </section>

   
    <!--footer-->
    <footer>
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                       
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae, quam temporibus. Eos molestiae quam asperiores repellat.</p>
                        <div class="social-links">
                            <a href="#"><i class="ri-facebook-circle-fill"></i></a>
                            <a href="#"><i class="ri-instagram-fill"></i></a>
                            <a href="#"><i class="ri-youtube-fill"></i></a>
                            <a href="#"><i class="ri-twitter-fill"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h6 >CONTACT</h6>
                        <p><i class="ri-phone-fill"></i>:090-5206-4720</p>
                        <p><i class="ri-mail-line"></i>:thechinawok@gmail.com</p>
                        <p class="mb-0"><i class="ri-home-4-line"></i>:Fukuoka shi Higashi ku Hakomatsu 2-12-45</p>
                    </div>
                    <div class="col-lg-3">
                        <h6 >OPENING HOURS</h6>
                        <p>Mon-Fri: 08:00~22:00</p>
                        <p>Sat-Sun:11:00~22:00</p>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                   
                    <div class="col-auto">
                        <p>Copyrights all rights reserved</p>
                    </div>
                    <div class="col-auto">
                        <p>Designed by <a href="#">Dhwani</a>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </footer>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
</body>

</html>