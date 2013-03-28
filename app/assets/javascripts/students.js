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
  
  var regForm = $('#registration-form').hide();

  $('#student-list-new a').on('click', function ( e ) {
    if (regForm.children().length == 0) {
      $.ajax({
        url: '/students/new/',
        type: 'GET'
      }).done( function ( resp ) {
        regForm.html(resp);
        regForm.slideToggle();
        $('#new_student').submit( function ( e ) {
          e.preventDefault();
          var newStudent = $(this).serializeObject();

          $.ajax({
            url: '/students',
            type: 'POST',
            data: newStudent
          }).done( function ( responce ) {
            console.log( responce );
            $('#student-list').append( responce );
            $('#new_student').find('input[type="text"]').val("");
          });
        }); 
      });
    } else {
      regForm.slideToggle();
    }

    e.preventDefault();
  });

  $('#sign-in').on('click', function ( e ) {
    $.ajax({
      url: '/students/sign_up',
      method: 'GET'
    }).done( function ( resp ) {
      console.log ( resp );
      $('#user_nav').append(resp);
    });
    e.preventDefault();
  });

})(jQuery);
