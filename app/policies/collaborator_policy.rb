class WikiPolicy
  attr_reader :user, :collaborator

  def initialize(user, collaborator)
    @user = user
    @collaborator = collaborator
  end

  def index?
    @user.premium? || @user.admin?
  end

  def show?
    @user.admin? || (@user.id == @collaborator.user_id)
  end

  def create?
    @user.admin? || @user.premium?
  end

  def new?
    @user.admin? || @user.premium?
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