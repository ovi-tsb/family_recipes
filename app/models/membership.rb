class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :member, class_name: 'User'
  
  attribute :group_id, :integer, default: "2"

  # before_save :set_group


  # def set_group
  #   current_user = user
  #   if friend.membership_with(current_user).blank? 
  #   	self.friend.membership_with(user) = "friends" 
  #   end
  # end
end
