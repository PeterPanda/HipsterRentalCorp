/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
    Created on : 07.10.2015, 11:46:39 
    Author     : janFk
*/

function init(){
    document.getElementById('buttonLogin').addEventListener("click", initLogin);
} 

/*  */
function initLogin(){
    document.getElementById('divLogin').innerHTML=Date();
}