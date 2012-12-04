$(document).ready ->

  $(".result_link").click( ->
    $(this).parents('form').submit()
    return false
  )