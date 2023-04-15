class Group < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations

  def to_s
    name
  end
end
