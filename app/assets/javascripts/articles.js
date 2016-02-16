var counter = 1;

function like() {
	if (counter%2 != 0) {
		$('#rating').text(parseInt($('#rating').text()) + 1);
		$('#like-btn').text("Dislike");
		counter++;
	}
	else  {
		$('#rating').text(parseInt($('#rating').text()) - 1);
		$('#like-btn').text("Like");
		counter++;
	}
}