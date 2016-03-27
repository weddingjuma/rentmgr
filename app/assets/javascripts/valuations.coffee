# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#valuation_code').inputmask "(99-9/99-9/9{1,4})|(999-99-9/9)|(99-9999-9.9-9{1,4}/9-99)"

$(document).on('page:load', ready)
$(document).ready(ready)
