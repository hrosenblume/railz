var content;
var i;
var modals = [];

for (i = 0; i < modals.length; i++) {
	$.get('modals/' + modals[i] + '.html', function(data){
    	content = data;
    	$('#models').prepend(content);
	});
}