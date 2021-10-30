class ReadmePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def export?
    record.user == user
  end
end
