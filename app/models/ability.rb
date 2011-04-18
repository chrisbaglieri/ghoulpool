class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, Pool
      can :manage, Pool, :user_id => user.id
    end
  end
end
