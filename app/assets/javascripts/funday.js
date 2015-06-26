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
    min: true,
    onOpen: function () {
      this.clear();
    },
    onSet: function () {
      var x,y,year,date,month;
      x = $('.datepicker').pickadate().val().toString();
      y = x.split(/[ ,]+/);
      date = y[0];
      month = y[1];
      year = y[2];
      console.log(y[0]+" "+ y[1]+ " "+ y[2]);
      if(date && month && year){
        this.close();
      }
    }
  });
});


$(document).ready(function(){
   $('.parallax').parallax();
  });
  
   