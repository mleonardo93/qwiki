class ChargesController < ApplicationController

  @amount = 1000

  def create
    # Creates a Stripe Customer object for associating with charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Qwiki Premium - #{current_user.email}",
      currency: "usd"
    )

    current_user.premium!
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
      amount: @amount
    }
  end

end
