# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#session_code').inputmask "9{3,4}-99-99"

$(document).on('page:load', ready)
$(document).ready(ready)
