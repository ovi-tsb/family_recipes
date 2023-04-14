# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ####################
  has_many :invitations, dependent: :destroy
  has_many :pending_invitations, lambda {
                                   where confirmed: false
                                 }, class_name: 'Invitation', foreign_key: 'friend_id', dependent: :destroy
  has_many :friendconnects, dependent: :destroy
  has_many :recipes, dependent: :destroy

  has_many :memberships
  has_many :groups

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def name
    [first_name, last_name].select(&:present?).join(' ').titleize
  end
  ####################

  def self.search(search)
    if search
      # find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
      where('email ILIKE ? OR first_name ILIKE ? OR last_name ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")

    else
      # find(:all)

      User.all
      # User.where(Invitation.confirmed_record?(current_user.id, user.id))

    end
  end
end
