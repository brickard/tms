$(function() {
  $( ".date_of_birth" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '1900:2010'
  });
  $( ".soon" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '2010:2018'
  });
  $( ".recent" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '1970:2012'
  });
  $( ".today" ).datepicker({
    yearRange: '2010:2018',
    defaultDate: new Date()
  });
});
