var trail = false;

"use strict";

var createGrid = function(numberOfBlocks, size) {
	var rows = numberOfBlocks * size;
	$('#grid').width(rows);
	$('#grid').height(rows);
	
	for (var i = 0; i < numberOfBlocks * numberOfBlocks; i ++) {
		var $newDiv = $('<div class=\'square\'></div>');
		$newDiv.width(size).height(size);
		$('#grid').append($newDiv);
	}
}

var drawNewGrid = function() {
	$('#grid').empty();
	$('body').append('<div class=\'grid\'></div>');

	var numberOfBlocks = prompt("Broj blokova u redu (preporučeno 25):");
	var size = prompt("Veličina jednog bloka (u pikselima) (preporučen odnos 1:1.2, npr 25 i 30):");

	createGrid(parseInt(numberOfBlocks), parseInt(size));
}

$(document).ready(function() {
	createGrid(25, 30);

	$('#buttonClear').click(function() {
		$('.square').css('background', '#616161');
	});

	$('#buttonTrail').click(function() {
		//$('.square').css('background', '#616161');
		trail = !trail;
	});

	$('#buttonNew').click(function() {
		drawNewGrid();
	});

	$('#grid').on('mouseenter', '.square', function() {
		$(this).css('background', '#FF5252').fadeTo(0, 1);
	});

	$('#grid').on('mouseleave', '.square', function() {
		if (trail)
			$(this).fadeTo(600, 0);
	});
});