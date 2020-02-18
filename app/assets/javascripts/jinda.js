$(function() {
  $('body').show();
  $.extend(  $.mobile , {
    loadingMessage: 'please wait',
    pageLoadErrorMessage: "Error"
  });

  // TODO loop all $('.ui-header .ui-btn-text')
  if ($('.ui-header .ui-btn-text').first().text()=="") {
    $('.ui-crumbs').hide();
  };
});

function validate() { return true; }

function logTurbolinkFunction() {
	console.log("Turbolinks :load");
}
function logPageLoadFunction() {
	console.log("Page: Loads :load");
}

$(document).on('turbolinks:load', logTurbolinkFunction);

$(document).on('page:load', logPageLoadFunction);

