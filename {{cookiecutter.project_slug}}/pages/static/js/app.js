 $(document).ready(function(){

  $('.testimonials').bxSlider({
    auto: true,
    mode: 'vertical',
    pager: false,
    controls: false,
    slideMargin:3,
  });

  $('.adverts').bxSlider({
    minSlides: 3,
    maxSlides: 3,
    slideWidth: 210,
    slideMargin: 15
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
});
