class PostPolicy < ApplicationPolicy
  def index?
    true
  end
  def destroy?
  end
end