# frozen_string_literal: true

class FriendconnectsController < ApplicationController
  before_action :set_friendconnect, only: %i[show edit update destroy]

  # GET /friendconnects or /friendconnects.json
  def index
    @friendconnects = Friendconnect.all
  end

  # GET /friendconnects/1 or /friendconnects/1.json
  def show; end

  # GET /friendconnects/new
  def new
    @friendconnect = Friendconnect.new
  end

  # GET /friendconnects/1/edit
  def edit; end

  # POST /friendconnects or /friendconnects.json
  def create
    @friendconnect = current_user.friendconnects.build(friend_id: params[:friend_id])
    # @friendconnect = Friendconnect.new(friendconnect_params)

    respond_to do |format|
      if @friendconnect.save
        format.html { redirect_to root_url, notice: 'Added friend' }
        format.json { render :show, status: :created, location: @friendconnect }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendconnect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendconnects/1 or /friendconnects/1.json
  def update
    respond_to do |format|
      if @friendconnect.update(friendconnect_params)
        format.html { redirect_to friendconnect_url(@friendconnect), notice: 'Friendconnect was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendconnect }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendconnect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendconnects/1 or /friendconnects/1.json
  def destroy
    @friendconnect = current_user.friendconnects.find(params[:id])
    @friendconnect.destroy

    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friendconnect
    @friendconnect = Friendconnect.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friendconnect_params
    params.require(:friendconnect).permit(:user_id, :friend_id, :create, :destroy)
  end
end
