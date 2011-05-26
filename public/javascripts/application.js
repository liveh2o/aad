var whereAt = -300;
var howFar = 700;

function slideOnOver(whereTo) {
  $(".slides").animate({
    left: "50%",
    marginLeft: whereTo + "px",
  }, 250 );  
}

$(document).ready(function(){
  slideOnOver(whereAt);
  
  $(".next").click(function(){
    whereAt = whereAt - howFar;
    slideOnOver(whereAt);
  });
  
  $(".prev").click(function(){
    whereAt = whereAt + howFar;
    slideOnOver(whereAt);
  });
});