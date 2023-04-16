class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :member, class_name: 'User'
end
