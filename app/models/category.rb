class Category < ApplicationRecord
	has_many :recipes

	def translated_name
	  I18n.t(name, :scope => 'category')
	end
end
