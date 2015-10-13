/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Kategorie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Jan
 */
public class Categories { 
    public static List<Kategorie> getCategories() {
        List<Kategorie> cat;
        cat = new ArrayList<>();
        try {

            //loading drivers for mysql
            Class.forName("com.mysql.jdbc.Driver");

            //creating connection with the database 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hipsterrentalcorp", "root", "");
            PreparedStatement ps = con.prepareStatement("select * from KATEGORIE");
            ResultSet rs;
            rs = ps.executeQuery();
            while(rs.next()){
                cat.add(new Kategorie(rs.getString(1),rs.getString(2)));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
