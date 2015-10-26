/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 Created on : 07.10.2015, 11:46:39 
 Author     : janFk
 */

function init() {
    document.getElementById('buttonLogin').addEventListener("click", initLogin);
    initCategory();
    document.getElementById("pShoppingCartCount").innerHTML = "0";
}

/* Initialize the Loginfunction/overlay */
function initLogin() {
    var loginForm = "<object type='text/html' data='LoginForm/LoginForm.jsp' ></object>";
    document.getElementById('divLogin').innerHTML = loginForm;
}

function loadShoppingCart() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var data = xhr.responseText;
            document.getElementById('divContent').innerHTML = data;
        }
    };
    xhr.open('GET', '/HipsterRentalCorp/LoadShoppingCartServlet', true);
    xhr.send(null);
}

/* Initializes the product-category-navigation via servlet */
function initCategory() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var data = xhr.responseText;
            document.getElementById('divNavigation').innerHTML = data;
        }
    };
    xhr.open('GET', '/HipsterRentalCorp/CategoryServlet', true);
    xhr.send(null);
}

/* Retrieves the products within the clicked category and places them in the 'divContent'. */
function getProducts(categoryNumber) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var data = xhr.responseText;
            document.getElementById('divContent').innerHTML = data;
        }
    };
    xhr.open('GET', '/HipsterRentalCorp/ProductsByCategoryServlet?categoryNumber=' + categoryNumber, true);
    xhr.send(null);
}

function loadProduct(productNumber) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var data = xhr.responseText;
            document.getElementById('divContent').innerHTML = data;
        }
    };
    xhr.open('GET', '/HipsterRentalCorp/LoadProductServlet?productNumber=' + productNumber, true);
    xhr.send(null);
}

function clearShoppingCartForUnregisteredUser() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/HipsterRentalCorp/ClearShoppingCartForUnregisteredUserServlet', true);
    xhr.send(null);
}