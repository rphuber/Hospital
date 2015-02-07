# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  menuToggle = $("#js-centered-navigation-mobile-menu").unbind()
  $("#js-centered-navigation-menu").removeClass "show"
  menuToggle.on "click", (e) ->
    e.preventDefault()
    $("#js-centered-navigation-menu").slideToggle ->
      $("#js-centered-navigation-menu").removeAttr "style"  if $("#js-centered-navigation-menu").is(":hidden")
      return

    return

  return

