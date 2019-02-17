class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.editor?
      can :manage, Idea
    else
      can :manage, Idea, user_id: user.id
    end

    can :read, Idea

    can :manage, User if user.editor?
  end
end
