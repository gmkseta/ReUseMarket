/**
  * responsiveMenu
  * searchButton
  * menuCanvas
  * Filterbox
  * tabAbout
  * counterAbout
  * progressBar
  * countdown_1
  * CountDown
  * CountDown_S2
  * videoPopup
  * accordionToggle
  * portfolioIsotope
  * parallax
  * heights
  * flexProduct
  * tabProduct
  * tabDetailProduct
  * gridPhotography
  * shopMetroIpsotope
  * ajaxSubscribe.eventLoad
  * ajaxContactForm
  * swClick
  * goTop
  * scroll
  * removePreloader
*/

;(function($) {

   'use strict'
        var isMobile = {
            Android: function() {
                return navigator.userAgent.match(/Android/i);
            },
            BlackBerry: function() {
                return navigator.userAgent.match(/BlackBerry/i);
            },
            iOS: function() {
                return navigator.userAgent.match(/iPhone|iPad|iPod/i);
            },
            Opera: function() {
                return navigator.userAgent.match(/Opera Mini/i);
            },
            Windows: function() {
                return navigator.userAgent.match(/IEMobile/i);
            },
            any: function() {
                return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
            }
        }; // is Mobile

        var responsiveMenu = function() {
            var menuType = 'desktop';

            $(window).on('load resize', function() {
                var currMenuType = 'desktop';

                if ( matchMedia( 'only screen and (max-width: 991px)' ).matches ) {
                    currMenuType = 'mobile';
                }

                if ( currMenuType !== menuType ) {
                    menuType = currMenuType;

                    if ( currMenuType === 'mobile' ) {
                        var $mobileMenu = $('#mainnav').attr('id', 'mainnav-mobi').hide();
                        var hasChildMenu = $('#mainnav-mobi').find('ul.menu').children('li');
                        var hasSubmenuChild = $('.submenu').find('li.has-submenu-child');

                        $('#header').after($mobileMenu);
                        hasChildMenu.children('div.submenu').hide();
                        $(".menu-mega").hide();
                        hasChildMenu.children('a').after('<span class="btn-submenu"></span>');
                        $('.btn-menu').removeClass('active');
                        $('.submenu-child').hide();
                        hasSubmenuChild.children('a').after('<span class="btn-submenu-child"></span>');

                    } else {
                        var $desktopMenu = $('#mainnav-mobi').attr('id', 'mainnav').removeAttr('style');
                        $('div.submenu').show();
                        $desktopMenu.find('.menu-mega').removeAttr('style');
                        $('#header').find('.nav-wrap').append($desktopMenu);
                        $('.btn-submenu').remove();
                        $('.submenu-child').show();
                    }

                    if ($('#header').hasClass('style1') || $('#header').hasClass('style2 v1')) {
                        $('#mainnav-mobi').css({
                            // top: '100px'
                        });
                    }
                }
            });

            $('.btn-menu').on('click', function() {
                $('#mainnav-mobi').slideToggle(300);
                $(this).toggleClass('active');
                return false;
            });

            $(document).on('click', '#mainnav-mobi li .btn-submenu', function(e) {
                $(this).toggleClass('active').next('.submenu').slideToggle(500);
                $(this).next('.menu-mega').slideToggle(500);
                e.stopImmediatePropagation();
                return false;
            });

            $(document).on('click', '#mainnav-mobi li .submenu .btn-submenu-child', function(e) {
                $(this).toggleClass('active').next('ul.submenu-child').slideToggle(500);
                // $(this).next('.menu-mega').slideToggle(500);
                e.stopImmediatePropagation();
                return false;
            });
        }; // Responsive Menu


        var searchButton = function() {
            var showsearch = $('.box-search .icon_search');
            var closesearch = $('.box-search form .input-search .delete');
            showsearch.on('click',function() {
                $(this).parent('.box-search').children('form').css({
                    opacity: '1',
                    visibility: 'visible',
                    width: '100%'
                });
            });
            closesearch.on('click', function() {
                $(this).closest('.box-search').children('form').css({
                    opacity: '0',
                    visibility: 'visible',
                    width: '0%'
                });
            });
        }; // Search button

        var menuCanvas = function() {
            var buttonCavas = $('.box-canvas span.ti-align-right');
            var closeCanvas = $('.menu-canvas .close');
            buttonCavas.on('click', function() {
                $(this).closest('section').children('.menu-canvas').css({
                    opacity: '1',
                    visibility: 'visible',
                    right: '0'
                });
            });

            closeCanvas.on('click', function() {
                $(this).parent('.menu-canvas').css({
                    opacity: '0',
                    visibility: 'hidden',
                    right: '-520px',
                });
            });
        }; // Menu Canvas

        var Filterbox = function(){
            var buttonFilter = $('.filter');
            var buttonHideFilter = $('.box-filter .hide');
            $('.box-filter').hide();
            buttonFilter.on('click',function(){
                $('.box-filter').slideDown();
            });

            buttonHideFilter.on('click',function(){
                $('.box-filter').slideUp();
            });
        };  // Filterbox

        var tabAbout = function() {
            $('.tab-about').each(function() {
            $(this).children('.content-tab').children().hide();
            $(this).children('.content-tab').children().first().show()
            $(this).find('.tab-list-about').children('li').on('click', function(){
                var liActive = $(this).index(),
                contentActive = $(this).siblings().removeClass('active').parents('.tab-about').children('.content-tab').children().eq(liActive);
                contentActive.addClass('active').fadeIn("slow");
                contentActive.siblings().removeClass('active');
                $(this).addClass('active').parents('.tab-about').children('.content-tab').children().eq(liActive).siblings().hide();
            });
            });
        }; // Tab About

        var counterAbout = function() {
            if ( $().countTo ) {
                $('.wrap-counter').on('on-appear', function() {
                    $(this).find('.numb-count').each(function() {
                        var to = parseInt( $(this).data('to'), 10 ),
                            speed = parseInt( $(this).data('speed'), 10 );

                        $(this).countTo({
                            to: to,
                            speen: speed
                        });
                    });
                }); // wrap counter
            };
        }; // Counter About

        var progressBar = function() {
            $('.progress-bar').on('on-appear', function() {
                $(this).each(function() {
                    $(this).css("overflow", "inherit");
                    var percent = $(this).data('percent');
                    $(this).find('.progress-animate').animate({
                        "overflow":"inherit",
                        "width": percent + '%'
                    }, $(this).find('.progress-animate').data('duration') );

                    $(this).parent('.progress-item').find('.perc').addClass('show').animate({
                        "overflow":"inherit",
                        "width": percent + '%'
                    }, $(this).find('.progress-animate').data('duration') );
                });
            });
        }; // Progress Bar

        var videoPopup =  function() {
            $(".fancybox").on("click", function(){
                $.fancybox({
                  href: this.href,
                  type: $(this).data("type")
                }); // fancybox
                return false
            }); // on
        }; // Video Popup

        var accordionToggle = function() {
            var speed = {duration: 400};
            $('.toggle-content').hide();
            $('.accordion-toggle .toggle-title.active').siblings('.toggle-content').show();
            $('.accordion').find('.toggle-title').on('click', function() {
                $(this).toggleClass('active');
                $(this).next().slideToggle(speed);
                $(".toggle-content").not($(this).next()).slideUp(speed);
                if ($(this).is('.active')) {
                    $(this).closest('.accordion').find('.toggle-title.active').toggleClass('active')
                    $(this).toggleClass('active');
                };
            });
        }; // Accordion Toggle

        var portfolioIsotope = function() {
            if ( $().isotope ) {
                var $container = $('.wrap-portfolio');
                $container.imagesLoaded(function(){
                    $container.isotope({
                        itemSelector: '.ipsotope',
                        transitionDuration: '1s'
                    });
                });

                $('.tab-product-list li').on('click',function() {
                    var selector = $(this).attr('data-filter');
                    $('.tab-product-list li').removeClass('active');
                    $(this).addClass('active');
                    $container.isotope({ filter: selector });
                    return false;
                });
            };
        }; // Portfolio Isotope

        var parallax = function() {
            if ( $().parallax && isMobile.any() === null ) {
                $('.parallax1').parallax("50%", 0.3);
                $('.parallax2').parallax("30%", 0.5);
                $('.parallax3').parallax("50%", 0.5);
                $('.parallax4').parallax("50%", 0.5);
                $('.parallax5').parallax("50%", 0.7);
                $('.parallax6').parallax("50%", 0.5);
                $('.parallax7').parallax("50%", 0.5);
                $('.parallax8').parallax("50%", 0.5);
                $('.parallax9').parallax("50%", 0.5);
                $('.parallax10').parallax("50%", 0.4);
                $('.parallax11').parallax("50%", 0.4);
                $('.parallax12').parallax("100%", 0.5);
                $('.parallax13').parallax("50%", 0.5);
                $('.parallax15').parallax("50%", 0.6);
            }
        }; // Parallax

        var heights = function() {
            $(window).on('load', function() {
                $('.row-box').each(function() {
                    var h = $(".info-image").height();
                    $(".info-text").css({
                        height: h,
                    });
                    var h1 = $(".info-image.v1").height();
                    $(".info-text.v1").css({
                        height: h1,
                    });
                });
            });
        }; // Heights

        var tabProduct = function() {
            $('#main-shop .wrap-product').each(function() {
            $(this).find('.tab-product-content').children().hide();
            $(this).find('.tab-product-content').children().first().show().addClass('active');
            $(this).find('.tab-product-list').children('li').on('click', function(){
                    var liActive = $(this).index(),
                    contentActive = $(this).siblings().removeClass('active').parents('.wrap-product').find('.tab-product-content').children().eq(liActive);
                    contentActive.addClass('active').fadeIn("slow");
                    contentActive.siblings().removeClass('active');
                    $(this).addClass('active').parents('.wrap-product').find('.tab-product-content').children().eq(liActive).siblings().hide();
                });
            })
        }; // Tab Product

        var tabDetailProduct = function() {
            $('.product-content').each(function() {
            $(this).find('.tab-content').children().hide();
            $(this).find('.tab-content').children().first().show().addClass('active');
            $(this).find('.tab-detail-list').children('li').on('click', function(){
                var liActive = $(this).index(),
                contentActive = $(this).siblings().removeClass('active').parents('.product-content').find('.tab-content').children().eq(liActive);
                contentActive.addClass('active').fadeIn("slow");
                contentActive.siblings().removeClass('active');
                $(this).addClass('active').parents('.product-content').find('.tab-content').children().eq(liActive).siblings().hide();
            });
            });
        }; // Tab Detail Product

        var flexProduct = function() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        }; // Flex Product

        var gridPhotography = function() {
            if ( $().isotope ) {
                var $grid = $('.wrap-portfolio.padding-5');
                $grid.imagesLoaded(function(){
                    $grid.isotope({
                        itemSelector: '.ipsotope',
                        layoutMode: 'fitRows',
                        transitionDuration: '1s',
                        masonry: {
                            columnWidth: '.wrap-portfolio.padding-5'
                        }
                    });
                });
            }; // Portfolio Isotope
        }; // Grid Photography

        var shopMetroIpsotope = function() {
            if ( $().isotope ) {
                var $container = $('.wrap-portfolio.style5.v1');
                $container.imagesLoaded(function(){
                    $container.isotope({
                        itemSelector: '.ipsotope',
                        layoutMode: 'masonry',
                        transitionDuration: '1s',
                        masonry: {
                            columnWidth: '.wrap-portfolio.style5.v1 .portfolio-item.one-four'
                        }
                    });
                }); // Portfolio Isotope
            };
        }; // Grid Photography

        var ajaxSubscribe = {
            obj: {
                subscribeEmail    : $('#subscribe-email'),
                subscribeButton   : $('#subscribe-button'),
                subscribeMsg      : $('#subscribe-msg'),
                subscribeContent  : $("#subscribe-content"),
                dataMailchimp     : $('#subscribe-form').attr('data-mailchimp'),
                success_message   : '<div class="notification_ok">Thank you for joining our mailing list! Please check your email for a confirmation link.</div>',
                failure_message   : '<div class="notification_error">Error! <strong>There was a problem processing your submission.</strong></div>',
                noticeError       : '<div class="notification_error">{msg}</div>',
                noticeInfo        : '<div class="notification_error">{msg}</div>',
                basicAction       : 'mail/subscribe.php',
                mailChimpAction   : 'mail/subscribe-mailchimp.php'
            },

            eventLoad: function() {
                var objUse = ajaxSubscribe.obj;

                $(objUse.subscribeButton).on('click', function() {
                    if ( window.ajaxCalling ) return;
                    var isMailchimp = objUse.dataMailchimp === 'true';

                    if ( isMailchimp ) {
                        ajaxSubscribe.ajaxCall(objUse.mailChimpAction);
                    } else {
                        ajaxSubscribe.ajaxCall(objUse.basicAction);
                    }
                });
            },// event Load

            ajaxCall: function (action) {
                window.ajaxCalling = true;
                var objUse = ajaxSubscribe.obj;
                var messageDiv = objUse.subscribeMsg.html('').hide();
                $.ajax({
                    url: action,
                    type: 'POST',
                    dataType: 'json',
                    data: {
                       subscribeEmail: objUse.subscribeEmail.val()
                    },
                    success: function (responseData, textStatus, jqXHR) {
                        if ( responseData.status ) {
                            objUse.subscribeContent.fadeOut(500, function () {
                                messageDiv.html(objUse.success_message).fadeIn(500);
                            });
                        } else {
                            switch (responseData.msg) {
                                case "email-required":
                                    messageDiv.html(objUse.noticeError.replace('{msg}','Error! <strong>Email is required.</strong>'));
                                    break;
                                case "email-err":
                                    messageDiv.html(objUse.noticeError.replace('{msg}','Error! <strong>Email invalid.</strong>'));
                                    break;
                                case "duplicate":
                                    messageDiv.html(objUse.noticeError.replace('{msg}','Error! <strong>Email is duplicate.</strong>'));
                                    break;
                                case "filewrite":
                                    messageDiv.html(objUse.noticeInfo.replace('{msg}','Error! <strong>Mail list file is open.</strong>'));
                                    break;
                                case "undefined":
                                    messageDiv.html(objUse.noticeInfo.replace('{msg}','Error! <strong>undefined error.</strong>'));
                                    break;
                                case "api-error":
                                    objUse.subscribeContent.fadeOut(500, function () {
                                        messageDiv.html(objUse.failure_message);
                                    });
                            }
                            messageDiv.fadeIn(500);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert('Connection error');
                    },
                    complete: function (data) {
                        window.ajaxCalling = false;
                    }
                });
            } // ajaxCall
        }; // ajax Subscribe

        var swClick = function () {
            function activeLayout () {
                $(".switcher-container" ).on( "click", "a.sw-light", function() {
                    $(this).toggleClass( "active" );
                    $('body').addClass('home-boxed');
                    $('body').css({'background': '#f6f6f6' });
                    $('.sw-pattern.pattern').css ({ "top": "100%", "opacity": 1, "z-index": "10"});
                }).on( "click", "a.sw-dark", function() {
                    $('.sw-pattern.pattern').css ({ "top": "98%", "opacity": 0, "z-index": "-1"});
                    $(this).removeClass('active').addClass('active');
                    $('body').removeClass('home-boxed');
                    $('body').css({'background': '#fff' });
                    return false;
                })
            }

            function activePattern () {
                $('.sw-pattern').on('click', function () {
                    $('.sw-pattern.pattern a').removeClass('current');
                    $(this).addClass('current');
                    $('body').css({'background': 'url("' + $(this).data('image') + '")', 'background-size' : '30px 30px', 'background-repeat': 'repeat' });
                    return false;
                })
            }
            activeLayout();
            activePattern();
        } // Swicher Click

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
        responsiveMenu();
        searchButton();
        menuCanvas();
        Filterbox();
        tabAbout();
        counterAbout();
        progressBar();
        videoPopup();
        accordionToggle();
        portfolioIsotope();
        parallax();
        heights();
        flexProduct();
        tabProduct();
        tabDetailProduct();
        gridPhotography();
        shopMetroIpsotope();
        ajaxSubscribe.eventLoad();
        swClick();
        goTop();
        scroll();
        removePreloader();
    });

})(jQuery);
