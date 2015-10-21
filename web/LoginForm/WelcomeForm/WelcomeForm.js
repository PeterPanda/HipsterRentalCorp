/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function userLogout(){
    alert('<%= session.getAttribute("User") %>');
    alert('@Request.RequestContext.HttpContext.Session["User"]');
}