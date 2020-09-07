class PaymentsController < ApplicationController

  def pre_payment
    @payment = Payment.find(params[:id])
    @shares = Share.where(user: current_user)
    @house = House.find(params[:house_id])
  end

  def create
    house = House.find(params[:house_id])
    shares = Share.joins(:bill).where(user: current_user, bills: {house: house})
    payment  = Payment.create!(even_amount: shares.sum('shares.amount_cents'), state: 'pending', user: current_user)

    shares.update_all(payment_id: payment.id)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'EVEN UP',
        amount: payment.even_amount_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: house_payment_url(house, payment),
      cancel_url:  house_payment_url(house, payment)
    )

    payment.update(checkout_session_id: session.id)
    redirect_to  house_pre_payment_path(payment)
  end
end
