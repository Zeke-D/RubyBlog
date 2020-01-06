class Ability

  include CanCan::Ability

  def initialize(user)
  	can :show, [:Article, :Comment]

	puts user.inspect
	if user
	  if user.standard?
  		can :manage, :all, user_id: user.id
	  elsif user.admin?
	 	can :manage, :all
      end
	end
  end
end
