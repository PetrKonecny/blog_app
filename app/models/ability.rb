class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :access, :rails_admin
      can :dashboard
      can :manage , :all
    else
      can :manage, Post, :user_id => user.id
    end

  end
end
