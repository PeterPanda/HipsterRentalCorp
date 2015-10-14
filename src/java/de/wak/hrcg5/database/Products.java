/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Produkt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author janFk
 */
public class Products {

public static List<Produkt> getProductsByCategory(String categoryNumber){
 
    List<Produkt> productsByCategory;
    productsByCategory = new ArrayList<>();
    try {

            //loading drivers for mysql
            Class.forName("com.mysql.jdbc.Driver");

            //creating connection with the database 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hipsterrentalcorp", "root", "");
            PreparedStatement ps = con.prepareStatement("select * from Produkt p, Kategorie k where p.KATEGORIENR = k.KATEGORIENR AND k.KATEGORIENR=?");
            ps.setString(1, categoryNumber);
            ResultSet rs;
            rs = ps.executeQuery();
            
            while(rs.next()){
                productsByCategory.add(new Produkt(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    
    return productsByCategory;
}
    
}
