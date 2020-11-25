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
    # if user.role == "super"
    #   true 
    # else
    #   false
    # end
  end

  def new? 
    create?
  end

  def update?
    # puts @user.super?
    @user.super? || @user.admin? || @record == @user
    #  if @user.admin? || @user.super?
    #   @user == @record
    # else
    #   false
    # end
  end

  def edit?
    update?
  end

  def destroy?
    @user.super?
    # if user.role == "super"
    #   true 
    # else
    #   false
    # end
    # false
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
