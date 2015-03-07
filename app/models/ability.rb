class Ability
  include CanCan::Ability

  def initialize(officer_in_charge)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

        officer_in_charge ||= OfficerInChrage.new # guest user
 
    if officer_in_charge.role? :super_admin
      can :manage, :all
    elsif officer_in_charge.role? :otv
      can :manage, [Contingent, Competition, TrainingActivity, VarsityMember, TryoutIntent]
    elsif officer_in_charge.role? :of
      can :manage, [AcquiredQuotaPoint, DebtSettlement, VarsityMember]
      # manage products, assets he owns
      # can :manage, Product do |product|
      #   product.try(:owner) == user
      # end
      # can :manage, Asset do |asset|
      #   asset.assetable.try(:owner) == user
      # end
    end
  end
  end
end
