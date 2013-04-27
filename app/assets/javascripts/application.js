// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function show_and_hide_element(element_id) {
	if($('#' + element_id).css("display") == "none") {
		$('#' + element_id).show();
	} else {
		$('#' + element_id).hide();
	}
}