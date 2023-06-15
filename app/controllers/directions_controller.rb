class DirectionsController < ApplicationController
	before_action :find_direction, only: [:show, :edit, :update, :destroy]
  
  


  def sort
  	params[:order].each do |key, value|
  		Direction.find(value[:id]).update(position: value[:position])
  	end

  	render nothing: true
  end


  def find_direction
  	@direction = Direction.find(params[:id])
  end
end
