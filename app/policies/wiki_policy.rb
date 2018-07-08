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
    @wiki.private != true || (@user.id == @wiki.user_id)
  end

  def create?
    !@user.nil?
  end

  def new?
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

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if !user || user.role == "user"
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          collaborators_ids = []
          wiki.collaborators.each do |collaborator|
            collaborators_ids << collaborator.user_id
          end
          if !wiki.private? || collaborators_ids.include?(user.id)
            wikis << wiki
          end
        end
      elsif user.role == "admin"
        wikis = scope.all 
      elsif user.role == "premium"
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user_id == user.id || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end