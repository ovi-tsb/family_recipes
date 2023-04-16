# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: {  friend: 0,
                  family: 1 }

  ####################
  def self.reacted?(id1, id2)
    case1 = Invitation.where(user_id: id1, friend_id: id2).present?
    case2 = Invitation.where(user_id: id2, friend_id: id1).present?
    case1 || case2
  end

  def self.confirmed_record?(id1, id2)
    case1 = Invitation.where(user_id: id1, friend_id: id2, confirmed: true).present?
    case2 = Invitation.where(user_id: id2, friend_id: id1, confirmed: true).present?
    case1 || case2
  end

  def self.find_invitation(id1, id2)
    if Invitation.where(user_id: id1, friend_id: id2, confirmed: true).empty?
      Invitation.where(user_id: id2, friend_id: id1, confirmed: true).first
    else
      Invitation.where(user_id: id1, friend_id: id2, confirmed: true).first
    end
  end

  def group(current_user)
    if current_user == user
      friend.membership_with(user)
    else
      user.membership_with(friend)
    end
  end
  ######################
end
