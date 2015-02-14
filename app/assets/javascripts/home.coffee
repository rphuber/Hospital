# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  parallax()  if $("#js-parallax-window").length
  return

  return

$(window).scroll (e) ->
  parallax()  if $("#js-parallax-window").length
  return

parallax = ->
  if $("#js-parallax-window").length > 0
    plxBackground = $("#js-parallax-background")
    plxWindow = $("#js-parallax-window")
    plxWindowTopToPageTop = $(plxWindow).offset().top
    windowTopToPageTop = $(window).scrollTop()
    plxWindowTopToWindowTop = plxWindowTopToPageTop - windowTopToPageTop
    plxBackgroundTopToPageTop = $(plxBackground).offset().top
    windowInnerHeight = window.innerHeight
    plxBackgroundTopToWindowTop = plxBackgroundTopToPageTop - windowTopToPageTop
    plxBackgroundTopToWindowBottom = windowInnerHeight - plxBackgroundTopToWindowTop
    plxSpeed = 0.35
    plxBackground.css "top", -(plxWindowTopToWindowTop * plxSpeed) + "px"
  return




