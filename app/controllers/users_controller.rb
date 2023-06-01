class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!

  def index
  	# @users = User.all
    @users = User.search(params[:search])


  end


  def show
  	# @user = User.all
    
    @users = User.search(params[:search])
    @invitation = Invitation.all

    @recipe = Recipe.all
    
    # @user.recipes.each do
    # recipe.user.first_name
    # recipe.user.id
    ids = current_user.friends.map{|f| f.id} << current_user.id
    # ids = current_user.friends.pluck(:id) << current_user.id
    # ids = @user.friends.ids << current_user.id
    @recipes = Recipe.where(user_id: ids)
    
    # @recipes = Recipe.where(Invitation.confirmed_record?(current_user.id, @recipe.user.id))
    # @recipes = @user.recipes.all
    # @recipes = @user.recipes.where(Invitation.confirmed_record?(current_user.id, @user.id))
    # Invitation.reacted?(current_user.id, user.id)


  end

  def new
  	@user = User.new
  end

  
###################

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end

  
end
