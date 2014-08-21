$('document').ready(function(){
  $("#q1").show();
  $("#previous-button").hide();
})

function show_next(){
  selected_question = $(".question-form:visible").attr("id");
  count = $(".question-form:visible").data("order");
  $("#"+selected_question).hide();
  count++;
  $("#q" + count).show();
  if(count > 1){
    $("#previous-button").show();
  }
  if(count == ($(".question-form").length)){
    $("#next-button").hide();
  }
}

function show_previous(){
  selected_question = $(".question-form:visible").attr("id");
  count = $(".question-form:visible").data("order");
  $("#"+selected_question).hide();
  if(count == ($(".question-form").length)){
    $("#next-button").show();
  }
  count--;
  $("#q" + count).show();
  if(count == 1){
    $("#previous-button").hide();
  }
}