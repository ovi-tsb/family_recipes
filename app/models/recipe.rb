class Recipe < ApplicationRecord
	has_many :ingredients, dependent: :destroy
	has_many :directions, dependent: :destroy
	has_one_attached :image

	belongs_to :user

	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

	validates :title, :description, presence: true




	def self.search(search)
	  results = Recipe.joins(:user).where('title ILIKE ?  OR first_name ILIKE ? ',  "%#{search}%", "%#{search}%")
	  
	  if search
	    @recipe = results
	  else
	    # find(:all)
	    Recipe.all
	  end
	end
	def self.searchee(search)
	  results = Recipe.joins(:user).where("CONCAT_WS(' ', first_name, last_name) ILIKE ?", "%#{search}%".downcase)
	  if search
	    @recipe = results
	  else
	    Recipe.all
	  end
	end

	def name
	  [@user.first_name, @user.last_name].select(&:present?).join(' ').titleize
	end



end
