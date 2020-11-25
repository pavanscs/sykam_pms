class PostPolicy < ApplicationPolicy
	
    class Scope < Scope
	    def resolve
	      if user.admin?
	        scope.all
	      elsif user.premium?
	        scope.where(published: true)
	      else
	        scope.where(published: true, premium: false)
	      end
	    end
  	end

    def update?
      user.super? or not record.published?
    end

    def show?
	    return user.premium? || user.admin? if record.premium?
	    true
	end
end