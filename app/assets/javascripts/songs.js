
$(function() {
	$('#fileupload').fileupload({
	add: function(e, data){
	    $('#upload-status').html("Uploading...");
	    var jqXHR = data.submit()
	        .success(function(result, textStatus, jqXHR){
		    var text = $('#post_content').val();
		    console.log(text);
		    $('#upload-status').html("Complete.");
		    $('#post_content').val(text + '![alt text](' + result + ' "Title")');
		    $('#upload-status').html("");
		})
	        .error(function(jqXHR, textStatus, errorThrown){
		})
	        .complete(function(result, textStatus, jqXHR){
		})
	}
	});
});

