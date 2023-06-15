class Direction < ApplicationRecord
  belongs_to :recipe

  has_one_attached :image



  def self.by_position
  	order("position ASC")
  end
end
