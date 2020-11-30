class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    true 
  end

  def show?
    @user == @record || @user.super? || @user.admin?
  end

  def create?
    @user.super? || @user.admin?
  end

  def new? 
    create?
  end

  def update?
    true
  end

  def edit?
    if @user.super? || @user.admin? || @record == @user
      update?
    end
  end

  def destroy?
    @user.super?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def dashboard?
     false
    end

    def resolve
      scope.all
    end
  end
end
