class Recipe < ApplicationRecord
	has_many :ingredients, dependent: :destroy
	has_many :directions, dependent: :destroy
	has_one_attached :image

	belongs_to :user
	belongs_to :category

	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

	validates :title, :description, presence: true

	enum status: {  only_me: 0,
	                family: 1,
	                friends: 2 
	            }




	def self.search(search)
	  results = Recipe.joins(:user, :ingredients).where(   'title ILIKE ? 
	  												OR first_name ILIKE ? 
	  												OR last_name ILIKE ? 
	  												OR ingredients.name ILIKE ?', 
	  												"%#{search}%", "%#{search}%", 
	  												"%#{search}%", "%#{search}%").uniq
	  
	  if search
	    @recipe = results
	  else
	    # find(:all)
	    Recipe.all
	  end
	end

	def self.searchIngredients(search)
	  results = Recipe.joins(:ingredients).where('ingredients.name ILIKE ?', "%#{search}%").uniq
	  # results = Recipe.joins(:ingredients).where('ingredients.name ILIKE ?', "#{search}")
	  if search
	    @recipe = results
	  else
	    # find(:all)
	    Recipe.all
	  end
	end

	def self.searchee(search)
	  results = Recipe.joins(:user).where("CONCAT_WS(' ', first_name, last_name) ILIKE ?", "%#{search}%".downcase)
	  # results1 = Recipe.joins(:user).where("CONCAT_WS(' ', first_name, last_name) ILIKE ?", "%#{search}%".downcase).where(status: 1)
	  if search
	    @recipe = results
	  else
	    # if @user.friend.membership_with(current_user) == 'family'
	    	Recipe.all
	    # end
	  end
	end

	def self.searchxx(search)
	  results = Recipe.joins(:category).where("CONCAT_WS(' ', name) ILIKE ?", "%#{search}%".downcase)
	  if search
	    @recipe = results
	  else
	    # if @user.friend.membership_with(current_user) == 'family'
	    	Recipe.all
	    # end
	  end
	end

	def name
	  [@user.first_name, @user.last_name].select(&:present?).join(' ').titleize
	end



end
