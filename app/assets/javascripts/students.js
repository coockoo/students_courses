(function ($) {
  $.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
      if (o[this.name]) {
        if (!o[this.name].push) {
          o[this.name] = [o[this.name]];
        }
        o[this.name].push(this.value || '');
      } else {
        o[this.name] = this.value || '';
      }
    });
    return o;
  };
  /*$('form').on('submit', function ( e ) {
    e.preventDefault();
    var newStudent = $(this).serializeObject();
    console.log(newStudent);
    $.ajax({
      url: '/students',
      type: 'POST',
      data: newStudent,
      success: function ( resp ) {
        $('form').append('<p> Responce is:' + resp + ' </p>');
      }
    });
  });
  */
  /*$('a').on('click', function ( e ) {
    e.preventDefault();
  });*/

  function Paginator ( container, nav, itemsPerPage ) {
      this.container = container;
      this.nav = nav;

      this.itemsPerPage = itemsPerPage;
      this.items = this.container.find('a');
      console.log(this.items[0]);
      console.log(this.itemHeight);
  }

  var paginator = new Paginator ( $('div.student_list_container'), $('#navigation'), 5 );
  $('#navigation button').show().on('click', function () {
    
  });



  
})(jQuery);
