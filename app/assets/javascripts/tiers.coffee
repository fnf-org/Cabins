$ ->
  $("input[name=tier_email_send]").click ->
    console.log('clicked submit');
    number1 = parseFloat($('input[id=number1]').val());
    number2 = parseFloat($('input[id=number2]').val());
    answer = parseFloat($('input[id=answer]').val());
    calculated = number1 + number2

    console.log('calculated: ' + calculated + ', answer: ' + answer)
    if calculated == answer
      console.log('yep!')
      return true
    else
      console.log ('nope')
      alert('Try again! Are you sure you\'re ready to send this?')
      return false
