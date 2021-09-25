class ToolPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # TODO: Make this dynamic to test if user is logged in
    true
  end

  def show?
    # TODO: Make this dynamic to test if user is logged in
    true
  end
end
