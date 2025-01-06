<%@page import="aiwa.entity.Category"%>
<%@page import="aiwa.entity.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to International Food Recipes</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<%
    ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
    String word = (String) request.getAttribute("word");
    int categoryId = (int) request.getAttribute("categoryid");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    String continentMessage = (String) request.getAttribute("continentMessage"); // Fetch the message if any
%>

<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Arial', sans-serif;
    }
    .header-title {
        font-family: 'Georgia', serif;
        font-weight: bold;
        color: #d63384;
        margin: 20px 0;
        font-size: 3.5rem; 
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }
    .intro-text {
        font-size: 2.5rem;
        font-weight: 700;
        color: #343a40;
        text-align: center;
        line-height: 1.6;
        margin-bottom: 40px;
        letter-spacing: 1px;
        padding: 20px;
        background: linear-gradient(45deg, #f8b5d0, #d63384);
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        transform: translateY(-10px);
    }
    .intro-text:hover {
        transform: translateY(-15px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }
    
    
    .card-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 20px; 
    }

    .card {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border: none;
        border-radius: 10px;
        transition: transform 0.2s ease-in-out;
        height: 100%; 
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card-img-top {
        height: 250px;
        object-fit: cover;
        border-radius: 10px 10px 0 0;
    }

    .card-body {
        background: #ffffff;
        border-radius: 0 0 10px 10px;
        padding: 15px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        flex-grow: 1;
        min-height: 150px; 
    }

    .price {
        font-size: 1.5rem;
        font-weight: 700;
        color: #d63384;
        margin-top: 15px;
    }

    .rating {
        font-size: 1.2rem;
        color: #f39c12;
    }

    .rating i {
        margin-right: 5px;
    }

    .btn-primary {
        background-color: #d63384;
        border: none;
        border-radius: 20px;
        padding: 10px 20px;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .btn-primary:hover {
        background-color: #b02a70;
    }

    .form-select, .form-control {
        border-radius: 20px;
    }

    .footer {
        background-color: #343a40;
        color: #ffffff;
        padding: 20px 0;
        margin-top: 30px;
    }

    .footer a {
        color: #d63384;
        text-decoration: none;
    }

    .footer a:hover {
        text-decoration: underline;
    }

    .carousel-item img {
        max-height: 400px; 
        object-fit: cover; 
    }

    
    .form-select, .form-control {
        font-size: 1.1rem;
        padding: 10px;
    }

    .btn-primary {
        font-size: 1.2rem;
        padding: 12px;
    }

    .footer-card {
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .footer-card .card-body {
        font-size: 1.2rem;
    }
</style>

</head>
<body>
<div class="container">
    <h1 class="header-title text-center">Welcome to International Food Recipes <i class="bi bi-globe2"></i></h1>

    <!-- More visible and stylish intro text -->
    <p class="intro-text">
        We are here to share food recipes from every corner of the world, bringing flavors and cultures together in one place. 
        Order your favorite dishes and taste the world at your table!
    </p>

    <!-- Bootstrap Carousel -->
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://t3.ftcdn.net/jpg/06/18/31/90/240_F_618319077_TdrWi7tuxzpFjXBYRtcQdhv1uDIWBB44.jpg" class="d-block w-100" alt="Food Image 1">
            </div>
            <div class="carousel-item">
                <img src="https://thumbs.dreamstime.com/z/collage-assortment-dishes-different-countries-world-food-snacks-337035575.jpg" class="d-block w-100" alt="Food Image 2">
            </div>
            <div class="carousel-item">
                <img src="https://as1.ftcdn.net/v2/jpg/08/33/95/94/1000_F_833959429_O9Bec8IYJQ9jn0UxZpJEjZildPtZW97F.jpg" class="d-block w-100" alt="Food Image 3">
            </div>
        </div>
    </div>

    <form action="ItemListController" class="mb-5">
        <div class="row">
            <div class="col-md-4 mb-3">
                <select class="form-select" name="categoryid">
                    <option value="0" <%= categoryId == 0 ? "selected" : "" %>>All Categories</option>
                    <% for(Category c : categories) { %>
                        <option value="<%= c.getCategoryId() %>" <%= categoryId == c.getCategoryId() ? "selected" : "" %>>
                            <%= c.getCategoryName() %>
                        </option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <input class="form-control" type="text" name="keyword" value="<%= word %>" placeholder="Search by keyword">
            </div>
            <div class="col-md-2 mb-3 d-grid">
                <button class="btn btn-primary" type="submit">Search <i class="bi bi-search"></i></button>
            </div>
        </div>
    </form>

    <%-- Display message for Antarctica --%>
    <div class="row">
        <% if (continentMessage != null) { %>
            <div class="col-12 text-center">
                <p class="text-muted"><%= continentMessage %></p>
            </div>
        <% } %>
    </div>

    <div class="row">
        <% if (items != null && !items.isEmpty()) { %>
            <% for(Item item : items) { %>
                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                    <div class="card">
                        <img src="<%= item.getImage() %>" class="card-img-top" alt="Food Image">
                        <div class="card-body">
                            <h5 class="card-title text-truncate"><%= item.getCountryName() %></h5>
                            <p class="card-text text-secondary"><%= item.getCategory().getCategoryName() %></p>
                            <p class="text-muted"><%= item.getRecipe() %></p>
                            <div class="rating">
                                <i class="bi bi-star-fill"></i><%= item.getRating() %> (123 reviews)
                            </div>
                            <div class="price"><%= item.getPrice() %>円</div>
                            <a href="ItemDetailController?itemid=<%= item.getItemId() %>" class="btn btn-primary w-100">View Recipe</a>
                        </div>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <div class="col-12 text-center">
                <p class="text-muted">There are no countries in this continent. Would you like to search in another continent?</p>
            </div>
        <% } %>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <div class="container text-center">
        <p>© 2024 International Food Recipes | <a href="#">Privacy Policy</a></p>
        <div class="row">
            <div class="col-md-4">
                <div class="footer-card card bg-light">
                    <div class="card-body">
                        <h5 class="card-title">Contact Us</h5>
                        <p class="card-text">Have any questions? Reach out to us through our contact form or social media.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="footer-card card bg-light">
                    <div class="card-body">
                        <h5 class="card-title">About Us</h5>
                        <p class="card-text">We are a passionate team dedicated to sharing the best food recipes from all over the world.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="footer-card card bg-light">
                    <div class="card-body">
                        <h5 class="card-title">Follow Us</h5>
                        <p class="card-text">Stay updated with our latest recipes by following us on social media.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
            