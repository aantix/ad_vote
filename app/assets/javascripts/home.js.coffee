$(document).ready ->

  $(".section").height($(window).height())

  window.onresize=()->
    $(".section").height($(window).height())

#  deck = new $.scrolldeck

  $('.interested').click ->
    $("#contact_me").trigger "click"

  $('#home_index').pageScroller navigation: '.left-nav', scrollOffset: -50, animationType: 'easeOutExpo'

#  showLoading = ->
#    $(".spinner").show()
#    $("#send").attr("disabled", true);

#  $("form[data-remote]")
#    .bind('ajax:loading', showLoading())
