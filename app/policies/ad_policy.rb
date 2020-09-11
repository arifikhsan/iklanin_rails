class AdPolicy < ApplicationPolicy
  def update?
    owned?
  end

  def destroy?
    owned?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
