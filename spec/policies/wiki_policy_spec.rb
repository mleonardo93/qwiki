describe WikiPolicy do
  subject { WikiPolicy.new(user, article) }
  let user { User.create!(email: "testone@example.com")}
  let other_user { User.create!(email: "testtwo@example.com")}
  let wiki { Wiki.create!(title: "Example wiki", body: "Example body", private: false, user_id: other_user.id)}

  permissions :update?, :edit? do
    it "allows access to wiki creator" do 
      expect(subject).to permit(other_user, wiki)
    end
  end
end