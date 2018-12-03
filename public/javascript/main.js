;
(function($) {

  'use strict'
  var flexProduct = function() {
    $('.flexslider').flexslider({
      animation: "slide",
      controlNav: "thumbnails"
    });
  }; // Flex Product

  var scroll = function() {
    var scrollDown = $('.scroll-down a');
    scrollDown.on('click', function() {
      $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top - 30
      }, 800);
      return false;
    });
  } // Scroll

  var removePreloader = function() {
    $('.preloader').fadeOut('2s', function() {
      $(this).remove();
    });
  }; // Remove Preloader
  var Filterbox = function(){
      var buttonFilter = $('.filter');
      var buttonHideFilter = $('.box-filter .hider');
      $('.box-filter').hide();
      buttonFilter.on('click',function(){
          $('.box-filter').slideDown();
      });

      buttonHideFilter.on('click',function(){
          $('.box-filter').slideUp();
      });
  };  // Filterbox


  // Dom Ready
  $(function() {
    flexProduct();
    scroll();
    removePreloader();
    Filterbox();
  });

})(jQuery);
