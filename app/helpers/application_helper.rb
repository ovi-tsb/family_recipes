module ApplicationHelper


	def strangers
	   users = []
	   User.all.each do |user|
	      if(self.friends_with?(user) != true && self != user &&       self.friends.include?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
	      users << user
	      end
	   end
	   users
	end


end
