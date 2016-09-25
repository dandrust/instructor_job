// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

// Functions to support job application modal
var extractTargetId = function(event){
  return jobId = event.target.id.split("-").pop();
};

var setJobListingIdField = function(event) {
  $("#job_application_job_listing_id").attr("value", extractTargetId(event));
};

var addEventToApplyButton = function(){
  $(".apply-btn").on("click", setJobListingIdField);
};

var openPreviousListingOnError = function(){
  previousId = $("#job_application_job_listing_id").attr("value")
  if (previousId);
    $("#record-collapse" + previousId ).addClass("in");
};

// Functions to change labels to placeholders on small screens
var changeLabelsToPlaceholdersForMobile = function() {
  var mq = matchMedia( "(max-width:768px)");
  if (mq.matches) {
    $("form :input").filter(":not(select)").each(moveLabel);
  }
};

// Credit to github user makeusabrew
var moveLabel = function(index, elem) {
  var eId = $(elem).attr("id");
  var label = null;
  if (eId && (label = $(elem).parents("form").find("label[for="+eId+"]")).length == 1) {
      $(elem).attr("placeholder", $(label).html());
      $(label).remove();
  }
}

$(document).ready(function(){

  changeLabelsToPlaceholdersForMobile();
  addEventToApplyButton();
  openPreviousListingOnError();

});
