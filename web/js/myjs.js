function doLike(pid,uid){
    console.log(pid+","+uid);
    
    const d = {
        uid:uid,
        pid:pid,
        operation:'like'
    };
    
    $.ajax({
       url: "LikeServlet",
       data: d,
       success: function(data, textStatus, jqXHR){
           console.log(data);
           //console.log(data)
           if(data.trim()=='true_insert'){
               let c = $(".like-counter").html();
               c++;
               $(".like-counter").html(c);
           }else if(data.trim()=='true_delete'){
               let c = $(".like-counter").html();
               c--;
               $(".like-counter").html(c);
           }
       },
       error: function(jqXHR,textStatus,errorThrown){
           console.log(data);
       }
    });
}

//managing the like logo getBlue or getWhite
//$(document).ready(function(){
//    //alert("loded");
//    
//});
