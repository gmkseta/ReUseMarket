
;(function($) {

   'use strict'

        var goTop = function(){
            var gotop = $('.go-top');
            $(window).on('scroll', function() {
                if ($(this).scrollTop() > 500) {
                    gotop.addClass('show');
                } else {
                    gotop.removeClass('show');
                }
            });
            gotop.on('click', function() {
                $('html, body').animate({ scrollTop: 0}, 800, 'easeInOutExpo');
                return false;
            });
        }; // Go Top

        var scroll = function() {
            var scrollDown = $('.scroll-down a');
            scrollDown.on('click', function() {
                $('html, body').animate({ scrollTop: $( $(this).attr('href') ).offset().top - 30}, 800);
                return false;
            });
        } // Scroll

        var removePreloader = function() {
            $('.preloader').fadeOut('2s',function () {
                $(this).remove();
            });
        }; // Remove Preloader

    // Dom Ready
    $(function() {

        goTop();
        scroll();
        removePreloader();
    });

})(jQuery);
