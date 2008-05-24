// Site Funcitons /////////////////////////////////////////////////////////////

var show_flash = function(message, klass) {
  $('#flash').show('slow');
  $('#flash p.message').addClass(klass).text(message);
}

var hide_flash = function() {
  $('#flash').hide('slow');
}

// Admin Funcitons ////////////////////////////////////////////////////////////

// Filter the posts in the list by titles
var filter_list = function(list, search) {
  search = new RegExp(search, "i");
  $('#'+list+'s .'+list+' .title a').each(function(index, item){
    title = item.text;
    item_id = item.getAttribute('slug');
    if(!search.test(title)) {
      $('#'+list+'s tr#'+item_id+'.'+list).addClass('hidden');
    } else {
      $('#'+list+'s tr#'+item_id+'.'+list).removeClass('hidden');
    }
  });
}

// Get the post, update the fields with its attributes
var show_item = function(item, url, fields) {
  jQuery.getJSON(url, function(data, status){
    if(status == 'success') {
      // Hide non-important segments
      $('#'+item+'-form').hide('slow');
      $('#'+item+'-help').hide('slow');
      $('#'+item+'-contents').show('slow');
      // Set contents
      for(field_index in fields) {
        field = fields[field_index];
        $('#'+item+'-contents_'+field).val(data[field]);
      }
      // fields.each(function(index, field){
      //   $('#'+item+'-contents_'+field).val(data[field]);
      // });
      // Set action
      $('#form_for_update').attr({'action': url});
      $('#form_for_delete').attr({'action': url});
    } else {
      alert('Load failed.');
    }
  });
}

// Update the item with the data in the fields
var edit_item = function(item, url) {
  // to be implemented
}

// Remove the item
var delete_item = function() {
  $('#form_for_delete').submit();
}

// Show the form, set the action accordingly
var new_item = function(item) {
  // Hide non-important segments
  $('#'+item+'-form').show('slow');
  $('#'+item+'-help').hide('slow');
  $('#'+item+'-contents').hide('slow');
}

// Hide everything but the help segment
var close_item = function(item) {
  $('#'+item+'-form').hide('slow');
  $('#'+item+'-contents').hide('slow');
  $('#'+item+'-help').show('slow');
}


// = Posts

// ...


// = Pages

// 
