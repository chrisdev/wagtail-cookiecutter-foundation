 $(document).ready(function(){

  $(document).ready(function() {
    $('#faq .block-faq_question').click(function() {
      $(this).next('.block-faq_answer').slideToggle(500);
      $(this).toggleClass('close');
    });
  });

  $('.reveal_modal').click(function(event) {
    event.preventDefault();
    $('#modal-content').empty();
    var link = $(this).attr("href");
    $('#modal-content').load(link + " .modal-content");
  });

  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $('.scrollup').fadeIn();
    } else {
      $('.scrollup').fadeOut();
    }
  });

  $('.scrollup').click(function () {
    $("html, body").animate({
      scrollTop: 0
    }, 600);
    return false;
  });

  $('.card-profile-stats-more-link').click(function(e){
    e.preventDefault();
    if ( $(".card-profile-stats-more-content").is(':hidden') ) {
      $('.card-profile-stats-more-link').find('i').removeClass('fa-angle-down').addClass('fa-angle-up');
    } else {
      $('.card-profile-stats-more-link').find('i').removeClass('fa-angle-up').addClass('fa-angle-down');
    }
    $(this).next('.card-profile-stats-more-content').slideToggle();
  });

});
