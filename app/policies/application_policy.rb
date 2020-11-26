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
    # puts @user.super?
    true
    # @user.super? || @user.admin? || @record == @user
    #  if @user.admin? || @user.super?
    #   @user == @record
    # else
    #   false
    # end
    # post = current_user.posts.find(params[:id])
    # authorize post
    # if post.update(post_params)
    #   redirect_to post
    # else
    #   render :edit
    # end
  end

  def edit?
    if @user.super? || @user.admin? || @record == @user
      update?
    end
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
