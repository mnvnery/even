
# Create a service to update the order
class StripeCheckoutSessionService
  def call(event)
    payment = Payment.find_by(checkout_session_id: event.data.object.id)
    payment.update(state: 'paid')
  end
end
