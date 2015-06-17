$(document).foundation();

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
 });