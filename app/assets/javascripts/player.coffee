# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#add_player_form").on("ajax:beforeSend", (xhr, settings) ->
    $("#add_player_message").innerHTML = ""
    $("#add_player_message").addClass("hidden").removeClass("alert-success alert-danger"))
  $("#add_player_form").on("ajax:error", (e, data, status, xhr) ->
    $("#add_player_message").innerHTML = data.message
    $("#add_player_message").removeClass("hidden").addClass("alert-danger"))
  $("#add_player_form").on("ajax:success", (e, data, status, xhr) ->
    $("#add_player_message").innerHTML = data.message
    $("#add_player_message").remove_class('hidden').addClass("alert-success"))

