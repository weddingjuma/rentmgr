ready = ->
  dateFormat = 'YYYY-MM-DD'
  pickerOptions = {
    autoUpdateInput: false
    locale:
      format: dateFormat
    linkedCalendars: false
    ranges:
      'Цього року': [moment().startOf('year'), moment().endOf('year')]
      'Цього тижня': [moment().startOf('week'), moment().endOf('week')],
      'Наступного тижня': [moment().add(1, 'week').startOf('week'), moment().add(1, 'week').endOf('week')]
  }

  signDateGteq = $('#q_sign_date_gteq')
  signDateLteq = $('#q_sign_date_lteq')

  pickerStartDate = if signDateGteq.attr('value') == undefined then moment().format(dateFormat) else signDateGteq.attr('value')
  pickerEndDate = if signDateLteq.attr('value') == undefined then moment().add(2, 'day').format(dateFormat) else signDateLteq.attr('value')

  if signDateGteq.attr('value') != undefined
    $('#q_sign_daterange').val(pickerStartDate + ' - ' + pickerEndDate)


  pickerOptions.startDate = pickerStartDate
  pickerOptions.endDate = pickerEndDate
  $('#q_sign_daterange').daterangepicker pickerOptions
  .on 'apply.daterangepicker', (ev, picker) ->
    $(this).val(picker.startDate.format(dateFormat) + ' - ' + picker.endDate.format(dateFormat))
    signDateGteq.val picker.startDate.format(dateFormat)
    signDateLteq.val picker.endDate.format(dateFormat)
  .on 'cancel.daterangepicker', (ev, picker) ->
    signDateGteq.val ''
    signDateLteq.val ''
    $(this).val ''

  dueDateGteq = $('#q_due_date_gteq')
  dueDateLteq = $('#q_due_date_lteq')

  pickerStartDate = if dueDateGteq.attr('value') == undefined then moment().format(dateFormat) else dueDateGteq.attr('value')
  pickerEndDate = if dueDateLteq.attr('value') == undefined then moment().add(2, 'day').format(dateFormat) else dueDateLteq.attr('value')

  if dueDateGteq.attr('value') != undefined
    $('#q_due_daterange').val(pickerStartDate + ' - ' + pickerEndDate)

  pickerOptions.startDate = pickerStartDate
  pickerOptions.endDate = pickerEndDate
  $('#q_due_daterange').daterangepicker pickerOptions
  .on 'apply.daterangepicker', (ev, picker) ->
    $(this).val(picker.startDate.format(dateFormat) + ' - ' + picker.endDate.format(dateFormat))
    dueDateGteq.val picker.startDate.format(dateFormat)
    dueDateLteq.val picker.endDate.format(dateFormat)
  .on 'cancel.daterangepicker', (ev, picker) ->
    dueDateGteq.val ''
    dueDateLteq.val ''
    $(this).val ''

$(document).on('page:load', ready)
$(document).ready(ready)
