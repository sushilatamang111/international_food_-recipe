<%@page import="aiwa.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to International's Traditional Food Recipe</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<%
    Item item = (Item) request.getAttribute("item");
%>
</head>

<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Arial', sans-serif;
        font-size: 1.1rem;
    }

    /* Top Section */
    .top-section {
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .order-section {
        background-color: #ffffff;
        border: 2px solid #ddd;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    .order-section h4 {
        color: #007bff;
    }

    img {
        width: 100%;
        height: 600px;
        max-width: 800px;
        object-fit: cover;
        margin: 10px auto;
        display: block;
    }

    .btn-order {
        width: 150px;
    }

    .highlight {
        font-weight: bold;
        color: #28a745;
    }

    table {
        font-size: 1.1rem;
    }
</style>

<body>
<div class="container col-md-8 mt-4">

    <!-- Back Button -->
    <div class="mb-3">
        <button class="btn btn-outline-success" onclick="history.back()">
            <i class="bi bi-arrow-left"></i> Back
        </button>
    </div>

    <!-- Item Details Table -->
    <table class="table table-striped">
        <tr>
            <th>Item ID</th>
            <td><%=item.getItemId() %></td>
        </tr>
        <tr>
            <th>Country Name</th>
            <td><%=item.getCountryName() %></td>
        </tr>
        <tr>
            <th>Capital City</th>
            <td><%=item.getCapitalCity() %></td>
        </tr>
        <tr>
            <th>National Language</th>
            <td><%=item.getNationalLanguage() %></td>
        </tr>
        <tr>
            <th>Traditional Food</th>
            <td><%=item.getTraditionalFood() %></td>
        </tr>
        <tr>
            <th colspan="2" class="text-center">
                <img src="<%=item.getImage() %>" alt="Traditional Food Image">
            </th>
        </tr>
        <tr>
            <th>Price</th>
            <td>¥ <%=item.getPrice() %></td>
        </tr>
        <tr>
            <th>Recipe</th>
            <td><%=item.getRecipe() %></td>
        </tr>
    </table>

    <!-- Order Section (Bottom of Page) -->
    <div class="order-section text-center mt-4">
        <h4>Place Your Order</h4>
        <div class="mb-3">
            <label for="quantity" class="form-label fw-bold">Quantity:</label>
            <select id="quantity" class="form-select">
                <option value="0">-- Select Quantity --</option>
                <% for (int i = 1; i <= 10; i++) { %>
                    <option value="<%=i%>"><%=i%></option>
                <% } %>
            </select>
        </div>
        <div id="selection-message" class="mb-2 text-danger"></div>
        <button class="btn btn-outline-primary btn-order" onclick="showOrderModal()">Order</button>
    </div>
</div>

<!-- Modal for Confirmation -->
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderModalLabel">Order Confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <p>Do you want to confirm your order?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-success">Confirm</button>
            </div>
        </div>
    </div>
</div>

<script>
    // Update selection message dynamically
    document.getElementById("quantity").addEventListener("change", function () {
        const quantity = this.value;
        const selectionMessage = document.getElementById("selection-message");

        if (quantity == 0) {
            selectionMessage.innerHTML = "You did not select any quantity.";
            selectionMessage.classList.add("text-danger");
        } else {
            selectionMessage.innerHTML = `You selected <span class="highlight">${quantity}</span>.`;
            selectionMessage.classList.remove("text-danger");
        }
    });

    // Show confirmation modal
    function showOrderModal() {
        const quantity = document.getElementById("quantity").value;
        const selectionMessage = document.getElementById("selection-message");

        if (quantity == 0) {
            selectionMessage.innerHTML = "You did not select any quantity.";
            return;
        }

        const orderModal = new bootstrap.Modal(document.getElementById("orderModal"));
        orderModal.show();
    }
</script>

</body>
</html>
