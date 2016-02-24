// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.elevateZoom-3.0.8.min
//= require_tree .
//= require analytics

$(function() {
    var flashCallback;
    flashCallback = function() {
        return $(".alert").fadeOut();
    };
    $(".alert").bind('click', (function(_this) {
        return function(ev) {
            return $(".alert").fadeOut();
        };
    })(this));
    return setTimeout(flashCallback, 2000);
});

$(function() {
    if ($(window).width() < 600) {
        $(".bike-pic-show").elevateZoom({constrainType:"height", constrainSize:274, zoomType: "lens", containLensZoom: true, gallery:'gallery_01', cursor: 'pointer', galleryActiveClass: "active"});
    } else {
        $(".bike-pic-show").elevateZoom({zoomWindowPosition: 1, zoomWindowOffetx: 10});
    }
    function onGeocomplete() {
        var options = {
            types: ['(cities)'],
            componentRestrictions: {
                country: "usa"
            }
        };
        $(".bike_location").geocomplete(options);
    }

    onGeocomplete();
});