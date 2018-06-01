# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a[data-sortable]").click ->
    console.log('sorting by ' + $(this).data("column") + ' ' + $(this).data("direction"))
    $("a[data-sortable]").removeClass("selected")
    $(this).addClass("selected")

    $('#sort').val($(this).data("column"));
    $('#direction').val($(this).data("direction"));
    $('#reservations_search').submit();
