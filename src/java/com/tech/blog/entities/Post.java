
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author manik
 */
public class Post {
    private int pid;
    private String ptitle;
    private String pcontent;
    private String pcode;
    private String ppick;
    private Timestamp pdate;
    private int catid;
    private int userId;

    //this is default constructore
    public Post() {
    }

    //this is constructore when all private values are available
    public Post(int pid, String ptitle, String pcontent, String pcode, String ppick, Timestamp pdate, int catid,int userId) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppick = ppick;
        this.pdate = pdate;
        this.catid = catid;
        this.userId = userId;
    }

    //this constructore will runs when we miss to send the post id
    public Post(String ptitle, String pcontent, String pcode, String ppick, Timestamp pdate, int catid,int userId) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppick = ppick;
        this.pdate = pdate;
        this.catid = catid;
        this.userId = userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public String getPpick() {
        return ppick;
    }

    public void setPpick(String ppick) {
        this.ppick = ppick;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
}
