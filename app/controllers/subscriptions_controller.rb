class SubscriptionsController < ApplicationController
  def upgrade
    redirect_to new_charge_path
  end

  def downgrade
    @user = current_user
    @user.user!
  end
end
