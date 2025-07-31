class BoardPolicy < ApplicationPolicy
  def show?
    user_is_owner_or_collaborator?
  end

  def update?
    user_is_owner_or_collaborator?
  end

  def create?
    user_is_owner_or_collaborator?
  end

  def destroy?
    user_is_owner?
  end

  def add_collaborator?
    user_is_owner?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  private

  def user_is_owner?
    record.user==user
  end

  def user_is_owner_or_collaborator?
    record.user==user || record.collaborators.include?(user)
  end
end
