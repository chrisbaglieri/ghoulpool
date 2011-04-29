class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Ghoul
      can [:read, :create], Pool
      can [:update, :destroy], Pool, :user_id => user.id
      can :manage, Entry, :user_id => user.id
      can :manage, Rule do |rule|
        rule.pool.owner = user
      end
    end
  end
end
