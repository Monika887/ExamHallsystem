<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <!-- <link href="css/firstcss.css" type="text/css" rel="stylesheet"/>-->
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
<style type="text/css">
body
{
 background: url(image/background-90.jpg);
 background-size: cover;

 /*background: #4568DC;  /* fallback for old browsers */
/*background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
/*background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


}

#box
{
  background: #4568DC;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

    width:1325px;
    height:80px;
    border:0px solid lightblue;
}
.container{
    position: relative;
}

.container .wrapper
{
    
   width:70vw;
   height:73vh;
   border:3px solid whitesmoke;
   margin:3rem auto;
   overflow-y: hidden;
   box-shadow:1px 2px 30px rgba(0,0,0.56);
   border-radius: 0.5rem;
}






.container .slider-holder
{
 display: grid;
 grid-template-columns:repeat(3,100%);
 height:100%;
 animation:slide 12s ease infinite;

 }
 
 


.container #slider-image-1
{
 
  background: url(image/1.jpg);
  background-size:cover;
  margin:0px;
}
.container #slider-image-2
{

  background:url(image/pexels-photo-158834.jpeg);
  background-size:cover; 

}

.container #slider-image-3
{
  
  background: url(image/gettyimages-1171004759-612x612.jpg);
  background-size:cover;
}

 
  

.container .button-holder
{
    position: absolute;
    bottom:10%;
    left:45%;
}

.container .button-holder .dots
{
    display:inline-block;
    height:15px;
    width:15px;
    border-radius:3rem;
    background-color:whitesmoke;
    margin:4rem,3rem;
} 
@keyframes slide{
   
 0%{transform:translateX(0%)}
 10%{transform:translateX(-100%)}
 20%{transform: translateX(-100%)}
 30%{transform:translateX(-100%)}
 40%{transform:translateX(-200%)}
 50%{transform: translateX(-200%)}
 60%{transform:translateX(-200%)}
 70%{transform:translateX(0%)}
 80%{transform: translateX(0%)}
 90%{transform:translateX(0%)}
 100%{transform: translateX(0%)}

}

.text
{
 font-family: 'Abril Fatface', cursive;
  font-size:58px;
  color: rgb(255, 255, 255);
  padding: 3.2px;
  text-shadow: 4px 2px 3px rgb(87, 9, 35);
  
  
}

.textlogo
{
    background:url(image/avatar.png);
    padding-left:10px;
    background-size:contain;
   font-family: 'Abril Fatface', cursive;
   font-size:15px;
   color:white; 

}
h6
{
 color:white;
 padding:5px;
 font-size:05px;
 color:white;"
}


</style>
</head>
<body>

</div>
 <div id="box">
 <div align="center">
        <span class="text">EXAM  HALL SEATING ARRANGEMENT SYSTEM</span>
        
  </div>
      <ul>
       <div align="justify"><a href="login.jsp"><h4><img src="image/avatar.png"></h4></a></div>
        </ul>
</div>  
         <div class="container">
          
            <div class="wrapper">
                
                <div class="slider-holder">
                     <div id="slider-image-1"><h1 align="center" style="font-size:90px;color:#FFF">EXAM</h1></div>
                     <div id="slider-image-2"><h1 align="center" style="font-size:90px;color:#041490;">HALL</h1></div>   
                     <div id="slider-image-3"><h1 align="center" style="font-size:90px;color:#303">SEATING ARRENGMENT</h1></div>
                     </div>
                    
                </div>
             
                <div class="button-holder">
                   <a href="#slider-image-1" class="dots"></a>
                   <a href="#slider-image-2" class="dots"></a>
                   <a href="#slider-image-3" class="dots"></a>
            </div>
         </div>

</body>
</html>