// JavaScript Document
(function($){
	  "use strict";
	$(document).ready(function(){
		$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
			event.preventDefault(); 
			event.stopPropagation(); 
			$(this).parent().siblings().removeClass('open');
			$(this).parent().toggleClass('open');
		});

	    //$('.flexnav .item-with-ul').on('click', function (event) {
		//    event.preventDefault();
		//    event.stopPropagation();
        //    debugger;
		//    $(this).parent().siblings().removeClass('open');
		//    $(this).parent().toggleClass('open');
		//});

	});
})(jQuery);