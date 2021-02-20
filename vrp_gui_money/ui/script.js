$(document).ready(function(){

  window.addEventListener("message", function(event){
    if(event.data.survival == true){
      setProgress(event.data.hunger,'.progress-hunger');
      setProgress(event.data.thirst,'.progress-thirst');
    }
    if(event.data.pmoney){
      $(".pmoney").html("<span class='symbol'></span>"+event.data.pmoney);
    }
    if(event.data.bmoney){
      $(".bmoney").html("<span class='symbol'></span>"+event.data.bmoney);
    }
    if(event.data.aur){
      $(".aurmoney").html("<span class='symbol'></span>"+event.data.aur);
    }
    if(event.data.gifts){
      $(".giftmoney").html("<span class='symbol'></span>"+event.data.gifts);
    }
  });
});

function setProgress(percent, element){
  $(element).css("width",percent+"%");
}
