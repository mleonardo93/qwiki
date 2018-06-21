require 'rails_helper'
require 'spec_helper'

describe WikiPolicy do
  subject { WikiPolicy(user, wiki) }
  let(:user) { User.create!(email: "testone@example.com", password: "helloworld")}
  let(:other_user) { User.create!(email: "testtwo@example.com", password: "helloworld")}
  let(:admin) { User.create!(email: "admin@example.com", password: "helloworld") }
  let(:visitor) {nil}
  let(:wiki) { Wiki.create!(title: "Example wiki", body: "Example body", private: false, user_id: other_user.id)}

  permissions :index? do
    it "allows visitor to view index" do 
      expect(WikiPolicy).to permit(visitor)
    end

    it "allows user to view index" do
      expect(WikiPolicy).to permit(user)
    end

    it "allows admin to view index" do
      expect(WikiPolicy).to permit(admin)
    end
  end
  
  permissions :show? do
    it "allows visitor to view wiki" do 
      expect(WikiPolicy).to permit(visitor, wiki)
    end

    it "allows user to view wiki" do
      expect(WikiPolicy).to permit(user, wiki)
    end

    it "allows admin to view wiki" do
      expect(WikiPolicy).to permit(admin, wiki)
    end
  end

  permissions :create? do
    it "doesn't allow visitor to create wiki" do 
      expect(WikiPolicy).not_to permit(visitor, wiki)
    end

    it "allows user to create wiki" do 
      expect(WikiPolicy).to permit(user, wiki)
    end

    it "allows admin to create wiki" do
      expect(WikiPolicy).to permit(admin, wiki)
    end
  end

  permissions :update? do 
    it "doesn't allow visitor to update wiki" do
      expect(WikiPolicy).not_to permit(visitor, wiki)
    end

    it "doesn't allow user who didn't make wiki to update wiki" do 
      expect(WikiPolicy).not_to permit(user, wiki)
    end

    it "allows wiki creator to update wiki" do 
      expect(WikiPolicy).to permit(other_user, wiki)
    end

    it "allows admin to update wiki" do 
      expect(WikiPolicy).to permit(admin, wiki)
    end
  end

  permissions :destroy? do
    it "doesn't allow visitor to destroy wiki" do
      expect(WikiPolicy).not_to permit(visitor, wiki)
    end

    it "doesn't allow user who didn't make wiki to destroy wiki" do 
      expect(WikiPolicy).not_to permit(user, wiki)
    end

    it "allows wiki creator to destroy wiki" do 
      expect(WikiPolicy).to permit(other_user, wiki)
    end

    it "allows admin to destroy wiki" do 
      expect(WikiPolicy).to permit(admin, wiki)
    end
  end


end