// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require angular
//= require_tree .
//= require_bootstrap
angular.module('eventApp',[])
	.controller('eventController',function($scope)
	{
		var dirlist="this"
		$scope.list=[
			{name:'Sujina'},
			{name:'Supreetha'},
			{name:'Harshitha'},
			{name:'Elvina'}
		]
	

		$( function() {
             $( "#datepicker" ).datepicker();
             minDate: 0;

             $('#timepicker').timepicker();
           } );
		
		$scope.capture = function(){
			alert("Are you sure?")
		}
		debugger;
		$scope.list = gon.event
			// body...
		// $scope.result= $scope.password != $scope.confrim ? true : false
	
	});