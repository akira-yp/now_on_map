$(function(){
  $('#post-image').change(function(){
    console.log('change')
    $('.user-image').remove();
    var file = $(this).prop('files')[0];
    if(!file.type.match('image.*')){
      return;
    }
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      $('.current-image').html('<img src="' + fileReader.result + '" style="width:100px; height:100px; border-radius:50px;"/>');
    }
    fileReader.readAsDataURL(file);
  });
});
