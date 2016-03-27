# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#rent_object_code').inputmask "3210600000:99:999:9999"

$(document).on('page:load', ready)
$(document).ready(ready)
