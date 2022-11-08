class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  def index
  	# @users = User.all
    @users = User.search(params[:search])
  end


  def show
  	@user = User.all
    
    @users = User.search(params[:search])

  end

  def new
  	@user = User.new
  end

  # def create
  # 	@user = User.new(params[:user])
  # 	if @user.save
  # 		session[:user_id] = @user.id
  # 		flash[:notice] = "Thank you for signing up! You are Looged in."
  # 		redirect_to root_url
  # 	else
  # 		render :action => 'new'
  # 	end
  # end
  
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
      params.require(:user).permit(:name, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end


    

###################


  
end
