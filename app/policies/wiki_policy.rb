class WikiPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    true
  end

  def show?
    (@wiki.private == false) || (@user.id == @wiki.user_id)
  end

  def create?
    !@user.nil?
  end

  def edit?
    !@user.nil? && (@user.admin? || (@user.id == @wiki.user_id))
  end

  def update?
    !@user.nil? && (@user.admin? || (@user.id == @wiki.user_id))
  end

  def destroy?
    !@user.nil? && (@user.admin? || (@user.id == @wiki.user_id))
  end

end