package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
//import java.security.Timestamp;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author manik
 */
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            
            String query = "Select * from categories;";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(query);
            while(set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                
                Category cat = new Category(cid,name,description);
                list.add(cat);  //adding the category object in the array list which is category data-type
            }
  
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    //this function will getting the post information like which fild is required to fill the db and hit the query to insert in db and returning true after successfully inserted the items
    public boolean savePost(Post p){
        boolean f = false;
        try{
            String query = "insert into posts(ptitle,pcontent,pcod,ppic,catid,userId) values(?,?,?,?,?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,p.getPtitle());
            pstmt.setString(2,p.getPcontent());
            pstmt.setString(3,p.getPcode());
            pstmt.setString(4,p.getPpick());
            pstmt.setInt(5,p.getCatid());
            pstmt.setInt(6,p.getUserId());
            
            pstmt.executeUpdate();
            
            f= true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    //grtting all the posts
    public List<Post> getAllPosts(){
        List<Post> list = new ArrayList<>();
        
        //fatch all the post
        try{
            
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc;");
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCode = set.getString("pcod");
                String pPic = set.getString("ppic");
                Timestamp pDate =  set.getTimestamp("pdate");
                int catId = set.getInt("catid");
                int userId = set.getInt("userId");
                
                Post post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
                
                list.add(post);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> getPostByCatId(int catId){
        List<Post> list = new ArrayList<>();
        
        //fatch all the post of any specific user in the orm of the arraylist
         try{
            
            PreparedStatement p = con.prepareStatement("select * from posts where catid = ?;");
            p.setInt(1, catId);
            
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCode = set.getString("pcod");
                String pPic = set.getString("ppic");
                Timestamp pDate =  set.getTimestamp("pdate");
                
                int userId = set.getInt("userId");
                
                Post post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
                
                list.add(post);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int postId){
        Post post = null;
        
        try{
            
            String query = "select * from posts where pid=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
              
                int pid = set.getInt("pid");
                int catId = set.getInt("catid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCode = set.getString("pcod");
                String pPic = set.getString("ppic");
                Timestamp pDate =  set.getTimestamp("pdate");
                int userId = set.getInt("userId");
                
                post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return post;
    }
}
