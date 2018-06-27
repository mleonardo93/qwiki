class ChargesController < ApplicationController
  def create
    # Creates a Stripe Customer object for associating with charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "Qwiki Premium - #{current_user.email}",
      currency: "usd"
    )

    flash[:notice] = "Thank you for your payment, #{current_user.email}!"
    redirect_to wikis_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new 
    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key]}",
      description: "Premium membership - #{current_user.email}",
      amount: Amount.default
    }
  end
end

class Amount 
  def initialize(usd)
    @pennies = (usd * 100)
  end

  def default
    1000
  end
end