//= require 'pingpp-pc'
Spree.routes.handle_pingpp = Spree.pathFor('checkout/handle_pingpp')

Spree.ready ($) ->
  Spree.onPingppPayment = () ->
    if ($ '#checkout_form_payment').is('*')
      $('.pingpp_channel').click ->
        console.log $(this).data('payment_method_id')
        $.ajax
          type: 'patch'
          url: Spree.routes.handle_pingpp
          data: {
            payment_method_id: $(this).data('payment-method-id')
          }
          success: (charge)->
            pingppPc.createPayment charge, (result, err) ->
              if result == "success"

              else if result == "fail"
                alert(err)
              else if result == "cancel"
                alert(err)
        false

  Spree.onPingppPayment()
