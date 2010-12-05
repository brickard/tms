function hide_search_link() { 
  $("#show_search_link").show();
  $("#hide_search_link").hide();
  $("#search_div").hide();
  return true
};
function show_search_link() { 
  $("#show_search_link").hide();
  $("#hide_search_link").show();
  $("#search_div").show();
  return true
};
$().ready(function() {
  $("#hide_search_link").click(function() {
    hide_search_link();
    return true
  });
  $("#show_search_link").click(function() {
    show_search_link();
    return true
  });
});
