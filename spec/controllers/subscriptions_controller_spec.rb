require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do

  describe "GET #upgrade" do
    it "returns http success" do
      get :upgrade
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #downgrade" do
    it "returns http success" do
      get :downgrade
      expect(response).to have_http_status(:success)
    end
  end

end
