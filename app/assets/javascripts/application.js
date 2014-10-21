// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .



$(document).ready(function() {
	$('.datepicker').datetimepicker({
					pickTime: false
				});
	$('#table').dataTable()
	sPaginationType: "full_numbers"
});

$(document).ready(function() {
	$("#btn1").click(function(){
		$('#form1').fadeToggle();
		if($('#gbtn1').hasClass('glyphicon glyphicon-chevron-up')){
			$('#gbtn1').removeClass('glyphicon glyphicon-chevron-up');
			$('#gbtn1').addClass('glyphicon glyphicon-chevron-down');
		}else{
			$('#gbtn1').removeClass('glyphicon glyphicon-chevron-down');
			$('#gbtn1').addClass('glyphicon glyphicon-chevron-up');
		}
	});
});