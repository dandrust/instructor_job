// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var extractTargetId = function(event){
  return jobId = event.target.id.split("-")[2];
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

$(document).ready(function(){

  addEventToApplyButton();
  openPreviousListingOnError();

});
