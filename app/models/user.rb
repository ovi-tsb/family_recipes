class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         has_many :friendconnects
         has_many :friends, :through => :friendconnects
         has_many :inverse_friendconnects, :class_name => "Friendconnect", :foreign_key => "friend_id"
         has_many :inverse_friends, :through => :inverse_friendconnects, :source => :user
  # has_friendship


####################
         has_many :invitations
         has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"

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
####################


  def self.search(search)
    
    if search
      # find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
      where('email ILIKE ?', "%#{search}%" )

    else
      # find(:all)
      
      User.all
      # User.where(Invitation.confirmed_record?(current_user.id, user.id))
      
    end

  end
# signed_in? && Invitation.confirmed_record?(current_user.id, user.id) && current_user != user



end
