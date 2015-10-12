/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function checkEnter (keyCode) {
    if(keyCode === 13){
        login();
    }
}

function login(){
    alert(document.getElementById('inputUsername').value+" "+document.getElementById('inputPassword').value);
    
    
}

function loadRegistrationForm(){
    alert("Linus :)")
}