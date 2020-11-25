module ActiveAdmin
	class AdminUserPolicy < ApplicationPolicy

		class Scope < Struct.new(:user, :scope)
		  def resolve
		    scope
		  end
		end

		def home?
			true
		end

		def index?
			true 
		end

		def show?
			true 
		end

		def new?
			true
		end

		def create?
		 true
		end

		def update?
			@user == @record || @user.super? || @user.admin? 
		end

		def destroy?
		    true 
		end
	end
end