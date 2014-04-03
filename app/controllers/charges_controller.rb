class ChargesController < ApplicationController
def new
 
end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path 
  else 

  current_user.stripe_id = customer.id
  current_user.save
  
  flash[:notice] = "THANKS FOR YOUR MONEY!!!!!!"
  redirect_to dashboard_path
  end
end
