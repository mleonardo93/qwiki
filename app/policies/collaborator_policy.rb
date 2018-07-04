class CollaboratorPolicy
  attr_reader :user, :collaborator

  def initialize(user, collaborator)
    @user = user
    @collaborator = collaborator
  end

  def index?
    @user.premium? || @user.admin?
  end

  def show?
    @user.premium? || @user.admin?
  end

  def create?
    @user.premium? || @user.admin?
  end

  def new?
    @user.premium? || @user.admin?
  end

  def edit?
    @user.premium? || @user.admin?
  end

  def update?
    @user.premium? || @user.admin?
  end

  def destroy?
    @user.premium? || @user.admin?
  end

end