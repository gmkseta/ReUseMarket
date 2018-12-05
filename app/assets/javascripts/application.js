// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require activestorage
//= require jquery-ui
//= require toastr
//= require_tree .


jQuery(document).ready(function($) {
window.setTimeout(function() {
  $(".alert").addClass("in");
}, 1000);

$(function() {
  $('.lazy').Lazy({
    // your configuration goes here
    scrollDirection: 'vertical',
    effect: 'fadeIn',
    visibleOnly: true,
    onError: function(element) {
      console.log('error loading ' + element.data('src'));
    }
  });
});


// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;

    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');

    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

    return n;
};

// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var string_part = this.replace(String(parseFloat(this)),"");
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";

    return num.format() + string_part;
};

jQuery('.format-money').text(function() {
    jQuery(this).text(
        jQuery(this).text().format()
    );
});
});
