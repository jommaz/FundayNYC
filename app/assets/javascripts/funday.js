  // $(document).ready(function(){
  //   $('.collapsible').collapsible();
  //       $('.datepicker').pickadate({
  //       closeOnSelect: true,
  //       format: 'dddd, dd mmm, yyyy',
  //       formatSubmit: "yyyy-mm-dd",
  //       hiddenName: true,
  //       selectMonths: true, // Creates a dropdown to control month
  //       selectYears: 15 // Creates a dropdown of 15 years to control year
  //   });
  //   });
$(document).ready(function(){
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year
    closeOnSelect: true
  })
});

$(document).ready(function(){
      $('.parallax').parallax();
    });