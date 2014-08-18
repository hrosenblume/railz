var content;
var i;
var modals = [""];

for (i = 0; i < modals.length-1; i++) {
	$.get('modals/' + modals[i] + '.html', function(data) {
    	content = data;
    	$('#modals').prepend(content);
	});
}