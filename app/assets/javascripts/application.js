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
//= require moment/es
//= require bootstrap-datetimepicker
//= require autoNumeric

//= require_tree .


$(document).ready(function() {

	$('.datepicker').datetimepicker({
		autoclose:true,
		language:'es',
		weekStart: '0'
	});
	$('#table').dataTable({
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"language": {
		    "sProcessing":     "Procesando...",
		    "sLengthMenu":     "Mostrar _MENU_ registros",
		    "sZeroRecords":    "No se encontraron resultados",
		    "sEmptyTable":     "Ningún dato disponible en esta tabla",
		    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
		    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
		    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		    "sInfoPostFix":    "",
		    "sSearch":         "Buscar:",
		    "sUrl":            "",
		    "sInfoThousands":  ",",
		    "sLoadingRecords": "Cargando...",

		    "oPaginate": {
		        "sFirst":    "Primero",
		        "sLast":     "Último",
		        "sNext":     "Siguiente",
		        "sPrevious": "Anterior"
		    },
	    "oAria": {
	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
	    }}
	});

	$('input[data-role=money]').autoNumeric('init');
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

$(document).ready(function () {
	$("#new_banco").validate({
		debug: true,
		rules: {
		"banco[nombre_banco]": {required: true}
		},
		message:{
			 "banco[nombre_banco]": "Necesitamos su direccion de email para contactarnos con usted"
			  
		}
	});
});

 function printpage() {
	//Get the HTML of div
	var divElements = document.getElementById("tabla_print").innerHTML;
	//Get the HTML of whole page
	var oldPage = document.body.innerHTML;

	//Reset the page's HTML with div's HTML only
	document.body.innerHTML = 
	  "<html><head><title></title></head><body>" + 
	  divElements + "</body>";

	//Print Page
	window.print();

	//Restore orignal HTML
	document.body.innerHTML = oldPage;

          
}