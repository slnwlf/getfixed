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

    function additional_photo_zoom() {
        $('body').on('click', '.additional-photo-holder', function() {
            // get value on clicked image
            var this_addtional_photo = $(this).children();
            var this_addtional_photo_thumb_url = this_addtional_photo.attr("src");
            // change to large size, add data zoom and swap class
            this_addtional_photo_large_url = this_addtional_photo_thumb_url.replace(/thumb/, "large");
            this_addtional_photo_xl_url = this_addtional_photo_thumb_url.replace(/thumb/, "xl");
            this_addtional_photo = this_addtional_photo.attr({
                src: this_addtional_photo_large_url,
                "data-zoom-image": this_addtional_photo_xl_url
            }).removeClass("individual-additional-photo").addClass('bike-pic-show')[0];
            // get value on main-photo
            var main_photo = $('.main-photo-holder').children();
            var main_photo_url = main_photo.attr("src");
            // change to thumb size and swap class
            main_photo_url = main_photo_url.replace(/large/, "thumb");
            main_photo = main_photo.attr("src", main_photo_url).removeClass("bike-pic-show").addClass("individual-additional-photo")[0];
            // swap photo 
            $('.main-photo-holder').html(this_addtional_photo);
            $(this).html(main_photo);
            $('#zoomed img').removeData('elevateZoom');
            $('.zoomWrapper img.zoomed').unwrap();
            $('.zoomContainer').remove();
            $(".bike-pic-show").elevateZoom({
                constrainType:"height",
                constrainSize:274,
                zoomType: "lens",
                containLensZoom: true,
                gallery:'gallery_01',
                cursor: 'pointer',
                galleryActiveClass: "active"
            });
        });
    }

    // set zoom for main photo
    $(".bike-pic-show").elevateZoom({
        constrainType:"height",
        constrainSize:274,
        zoomType: "lens",
        containLensZoom: true,
        gallery:'gallery_01',
        cursor: 'pointer',
        galleryActiveClass: "active"
    });
    // set zoom for additional photo when user click on it
    additional_photo_zoom();

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