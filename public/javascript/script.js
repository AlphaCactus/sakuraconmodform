// JavaScript Document

jQuery(document).ready(function(){

    // Search button and form
    jQuery(".search-button").click(function () {
        jQuery(".search-overlay").toggleClass("d-none");
        jQuery("#mainNavigation").removeClass("in");
        jQuery(".navbar-toggle").addClass("collapsed");
        jQuery("body").addClass("no-scroll");
    });

    jQuery(".search-overlay").click(function () {
        jQuery(this).addClass("d-none");
        jQuery("body").removeClass("no-scroll");
    });

    jQuery('#SearchForm_SearchForm').addClass('form-inline order-3 order-sm-2').attr('role', 'search');
    jQuery('#SearchForm_SearchForm_Search_Holder').prepend( '<label class="sr-only" for="SearchForm_SearchForm_Search">Search</label>' );
    jQuery("#SearchForm_SearchForm_Search").unwrap().attr("placeholder", "What are you looking for?").addClass('w-100').on('click', function (event) {
        event.stopPropagation();
    });
    jQuery('#SearchForm_SearchForm_action_results').wrap("<div class='search-action'></div>").val("Search");

    // Userforms
    jQuery('.userform .userform-fields').addClass('form-group');
    jQuery('.userform .form-step > div.field').addClass('mb-5');
    jQuery('.userform fieldset').addClass('mb-5');
    jQuery('.userform input.text').unwrap().addClass('form-control');
    jQuery('.userform textarea').unwrap().addClass('form-control');
    jQuery('.userform div.checkbox .middleColumn').addClass('form-check');
    jQuery('.userform fieldset.checkboxset .middleColumn').addClass('form-check');
    jQuery('.userform fieldset.userformsoptionset .middleColumn').addClass('form-check');
    jQuery('.userform input[type="checkbox"]').addClass('form-check-input');
    jQuery('.userform input[type="radio"]').addClass('form-check-input');
    jQuery('.userform .Actions .action').unwrap().addClass('btn btn-primary');

    //style embedded iframes
    jQuery("iframe").removeAttr("width").removeAttr("height").addClass("embed-responsive-item");

    jQuery(".iframe21by9 iframe").wrap(function() {
        return "<div class='embed-responsive embed-responsive-21by9'></div>";
    });

    jQuery(".iframe16by9 iframe").wrap(function() {
        return "<div class='embed-responsive embed-responsive-16by9'></div>";
    });

    jQuery(".iframe4by3 iframe").wrap(function() {
        return "<div class='embed-responsive embed-responsive-4by3'></div>";
    });

    jQuery(".iframe1by1 iframe").wrap(function() {
        return "<div class='embed-responsive embed-responsive-1by1'></div>";
    });

    jQuery(".navbar-toggle").click(function() {
        jQuery(this).toggleClass("open");
    });

    //style tables
    //jQuery('table').addClass('table table-striped table-bordered table-responsive');

    //style misc other stuff
    jQuery(".navbar-toggler").click(function() {
        $(this).toggleClass("open");
    });

    jQuery('.current').addClass('active');
    jQuery('.section').addClass('active');

    jQuery('#Sidebar ul').addClass('list-group');
    jQuery('#Sidebar li').addClass('list-group-item');

    jQuery('.subscribeLink').addClass('btn btn-primary').attr('role', 'button');

    jQuery('a.button').addClass('btn btn-primary').attr('role', 'button');
    jQuery('p.button a').addClass('btn btn-primary').attr('role', 'button');

    jQuery('#ForgotPassword').addClass('ml-4');
    jQuery('#MemberLoginForm_LoginForm_Remember_Holder').addClass('my-4');
});

jQuery('#MemberLoginForm_LoginForm_Remember_Holder').addClass('my-4');
jQuery(window).load(function(){
    jQuery('ul.sf-menu').superfish({
        delay:       1000,                            // one second delay on mouseout
        animation:   {opacity:'show',height:'show'},  // fade-in and slide-down animation
        speed:       'fast',                          // faster animation speed
    });

});

// video modals

// old code that doesn't work with slick sliders that use the responsive setting
// jQuery(".video-trigger").click(function () {
//     let src = jQuery(this).data("src");
//     jQuery("#VideoModal iframe").attr("src", src);
// });

const videomodal = jQuery("#VideoModal");

videomodal.on('show.bs.modal', function ( event ) {
    jQuery(event.relatedTarget.nodeName).click(function (){
        let src = jQuery(this).data("src");
        jQuery("#VideoModal iframe").attr("src", src);
    })
});

videomodal.on('hidden.bs.modal', function () {
    jQuery("#VideoModal iframe").attr("src", "");
});
