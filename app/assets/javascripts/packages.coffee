# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#package_province_id')#.parent().hide()
  provinces = $('#package_province_id').html()
  $('#package_country_id').change ->
    country = $('#package_country_id :selected').text()
   # escaped_department = department.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(provinces).filter("optgroup[label='#{country}']").html()
    if options
      $('#package_province_id').html(options)
     # $('#employee_position').parent().show()
    else
      $('#package_province_id').empty()
      #$('#employee_position').parent().hide()
	  


$(document).on 'turbolinks:load', ->
  $('#package_departure').datepicker
   dateFormat: 'yy-mm-dd'
