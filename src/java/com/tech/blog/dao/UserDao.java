package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

/**
 *
 * @author manik
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base
    public boolean saveUser(User user) {
        boolean f = false;
        try {

            //user --> database
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?);";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //method to getting the user by user-name and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            //query to fatch the user data from the data base
            String query = "select * from user where email=? and password=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery(); //all the data from the database is on the set variable

            if (set.next()) {
                user = new User();

                //getting the name of the user to the databse
                String name = set.getString("name");
                user.setName(name); //setting the name of the user to the user object

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("reg_date"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    //updating the user details with profile page
    public boolean updateUser(User user) {
        boolean f = false;
        try {

            String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?;";
            PreparedStatement ptsmt = con.prepareStatement(query);
            ptsmt.setString(1, user.getName());
            ptsmt.setString(2, user.getEmail());
            ptsmt.setString(3, user.getPassword());
            ptsmt.setString(4, user.getGender());
            ptsmt.setString(5, user.getAbout());
            ptsmt.setString(6, user.getProfile());
            ptsmt.setInt(7, user.getId());

            ptsmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //giving the user's all the information using the post id of the user
    public User getUserByUserId(int postId) {
        User user = null;

        try {
            String query = "select * from user where id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

                //getting the name of the user to the databse
                String name = set.getString("name");
                user.setName(name); //setting the name of the user to the user object

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("reg_date"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
