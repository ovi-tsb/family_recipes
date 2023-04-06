class Membership < ApplicationRecord
	belongs_to :group
  	# belongs_to :user
  	belongs_to :friend, class_name: 'User'

  	enum status: {  friend: 0,
  	                family: 1 }

end
