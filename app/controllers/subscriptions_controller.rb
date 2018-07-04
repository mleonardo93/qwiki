class SubscriptionsController < ApplicationController
  def upgrade
    redirect_to new_charge_path
  end

  def downgrade
    @user = current_user
    @user.user! 
    @user_wikis = Wiki.where(user_id: @user.id)
    @user_wikis.each do |wiki|
      wiki.private = false
      wiki.save!
    end
  end
end
