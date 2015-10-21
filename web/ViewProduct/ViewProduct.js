/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function addProductToShoppingCart(productNumber) {
    
    alert('<%= session.getAttribute("User") %>');
    alert(productNumber);
}

function loadAlternative(productNumber){
    alert();
        var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var data = xhr.responseText;
            document.getElementById('divProduct').innerHTML = data;
        }
    };
    xhr.open('GET', '/HipsterRentalCorp/LoadProductServlet?productNumber='+productNumber, true);
    xhr.send(null);
}
