          
               var em=document.getElementById("em");
    
                       em.onfocus=function(){
                       
                       if(em.value == "please input Email"){
                                em.value="";
                       
                       }
                       
                       };
                     em.onblur=function(){
                       
                       if(em.value==""){
                       
                       em.value="please input Email";
                       }
                       
                       
                       
                       };

            
