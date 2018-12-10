
jQuery('.twitter-block').delegate('#twitter-widget-0','DOMSubtreeModified propertychange', function() {
  //function call to override the base twitter styles
  customizeTweetMedia();
});

var customizeTweetMedia = function() {

  //overrides font styles and removes the profile picture and media from twitter feed
  jQuery('.twittIAer-block').find('.twitter-timeline').contents().find('img.NaturalImage-image').remove();
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-author').remove();
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-brand').remove();
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-media').remove();
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-actions').remove();
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-retweetCredit').remove();
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-inReplyTo').remove();
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet').css('position', 'relative');
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-text').css({
    'font-size': '16px',
    'line-height': '2',
    'margin': '30px 0 12px',
    'font-family': 'AzoSansRegular',
    'color': '#ffffff'
  });
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-metadata').css({
    'position': 'absolute',
    'top': '0px',
    'font-family': 'AzoSansRegular',
    'color': '#ffffff'
  });
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-metadata a').css('color', '#ffffff');
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-text a').css({
    'color': '#ffffff',
    'border-bottom': '1px solid #fff200'
  });
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-metadata a').css('text-transform', 'uppercase');
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet-metadata abbr, .timeline-Tweet-metadata abbr[title]').css('text-decoration', 'none');
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-Tweet').hover(function () {
    $(this).css('background', 'none');
  });

  //also call the function on dynamic updates in addition to page load
  jQuery('.twitter-block').find('.twitter-timeline').contents().find('.timeline-TweetList').bind('DOMSubtreeModified propertychange', function () {
    customizeTweetMedia(this);
  });
};


$(document).ready(function () {
 
  var frame = $('#twitter-widget-0').find('head');
    $('<link/>', {
        rel: "stylesheet",
        type: "text/css",
        href: "<?php echo get_stylesheet_directory_uri() ?>home-page.css"
    }).appendTo(frame);
    frame.contents().find('body').css('font-family', 'AzoSansRegular');

});