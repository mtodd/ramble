// Admin Funcitons ////////////////////////////////////////////////////////////

// Filter the posts in the list by titles
var filter_posts = function(search) {
  search = new RegExp(search, "i");
  $('#posts .post .title a').each(function(index, post){
    title = post.text;
    post_id = post.getAttribute('slug');
    if(!search.test(title)) {
      $("#posts tr#"+post_id+".post").addClass('hidden');
    } else {
      $("#posts tr#"+post_id+".post").removeClass('hidden');
    }
  });
}

// Get the post, update the fields with its attributes
var show_post = function(url) {
  jQuery.getJSON(url, function(data, status){
    if(status == 'success') {
      // Hide non-important segments
      $('#post-form').hide('slow');
      $('#post-help').hide('slow');
      $('#post-contents').show('slow');
      // Set contents
      $('#post-contents_title').val(data.title);
      $('#post-contents_body').val(data.body);
      // Set action
      $('#form_for_update_post').attr({'action': url});
    } else {
      alert('Load failed.');
    }
  });
}

// Get the post, update form with its attributes
var edit_post = function(url) {
  // jQuery.getJSON(url, function(data){
  //   alert(data.status);
  //   alert(data.body);
  //   alert(data);
  // });
}

// Show the form, set the action accordingly
var new_post = function() {
  // Hide non-important segments
  $('#post-form').show('slow');
  $('#post-help').hide('slow');
  $('#post-contents').hide('slow');
  // Set action
  $('#form_for_post_create').action = $('#post_create_action').value();
}

// Hide everything but the help segment
var close_post = function() {
  $('#post-form').hide('slow');
  $('#post-contents').hide('slow');
  $('#post-help').show('slow');
}
