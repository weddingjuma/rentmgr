ready = ->
  dateFormat = 'YYYY-MM-DD'
  ukDateFormat = 'DD.MM.YYYY'
  pickerOptions = {
    autoUpdateInput: false
    locale:
      format: ukDateFormat
      applyLabel: 'Застосувати'
      cancelLabel: 'Відмінити'
      customRangeLabel: 'Свій варіант'
    linkedCalendars: false
    ranges:
      'Цього року': [moment().startOf('year'), moment().endOf('year')]
      'Цього тижня': [moment().startOf('week'), moment().endOf('week')],
      'Наступного тижня': [moment().add(1, 'week').startOf('week'), moment().add(1, 'week').endOf('week')]
  }

  signDateGteq = $('#q_reg_date_gteq')
  signDateLteq = $('#q_reg_date_lteq')

  pickerStartDate = if signDateGteq.attr('value') == undefined then moment().format(ukDateFormat) else moment(signDateGteq.attr('value')).format(ukDateFormat)
  pickerEndDate = if signDateLteq.attr('value') == undefined then moment().add(2, 'day').format(ukDateFormat) else moment(signDateLteq.attr('value')).format(ukDateFormat)

  if signDateGteq.attr('value') != undefined
    $('#q_reg_daterange').val(pickerStartDate + ' - ' + pickerEndDate)


  pickerOptions.startDate = pickerStartDate
  pickerOptions.endDate = pickerEndDate
  $('#q_reg_daterange').daterangepicker pickerOptions
  .on 'apply.daterangepicker', (ev, picker) ->
    $(this).val(picker.startDate.format(ukDateFormat) + ' - ' + picker.endDate.format(ukDateFormat))
    signDateGteq.val picker.startDate.format(dateFormat)
    signDateLteq.val picker.endDate.format(dateFormat)
  .on 'cancel.daterangepicker', (ev, picker) ->
    signDateGteq.val ''
    signDateLteq.val ''
    $(this).val ''

  dueDateGteq = $('#q_due_date_gteq')
  dueDateLteq = $('#q_due_date_lteq')

  pickerStartDate = if dueDateGteq.attr('value') == undefined then moment().format(ukDateFormat) else moment(dueDateGteq.attr('value')).format(ukDateFormat)
  pickerEndDate = if dueDateLteq.attr('value') == undefined then moment().add(2, 'day').format(ukDateFormat) else moment(dueDateLteq.attr('value')).format(ukDateFormat)

  if dueDateGteq.attr('value') != undefined
    $('#q_due_daterange').val(pickerStartDate + ' - ' + pickerEndDate)

  pickerOptions.startDate = pickerStartDate
  pickerOptions.endDate = pickerEndDate
  $('#q_due_daterange').daterangepicker pickerOptions
  .on 'apply.daterangepicker', (ev, picker) ->
    $(this).val(picker.startDate.format(ukDateFormat) + ' - ' + picker.endDate.format(ukDateFormat))
    dueDateGteq.val picker.startDate.format(dateFormat)
    dueDateLteq.val picker.endDate.format(dateFormat)
  .on 'cancel.daterangepicker', (ev, picker) ->
    dueDateGteq.val ''
    dueDateLteq.val ''
    $(this).val ''

$(document).on('page:load', ready)
$(document).ready(ready)
