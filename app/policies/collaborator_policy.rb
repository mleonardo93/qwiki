class CollaboratorPolicy
  attr_reader :user, :collaborator, :wiki

  def initialize(user, collaborator)
    @user = user
    @collaborator = collaborator
    @wiki = Wiki.where(id: @collaborator.wiki_id)
  end

  def index?
    @user.premium? || @user.admin?
  end

  def show?
    @user.admin? || (@user.id == @collaborator.user_id) || @user.id == @wiki.user_id
  end

  def create?
    @user.id == @wiki.user_id || @user.admin?
  end

  def new?
    @user.id == @wiki.user_id || @user.admin?
  end

  def edit?
    @user.id == @wiki.user_id || @user.admin?
  end

  def update?
    @user.id == @wiki.user_id || @user.admin?
  end

  def destroy?
    @user.id == @wiki.user_id || @user.admin?
  end

end