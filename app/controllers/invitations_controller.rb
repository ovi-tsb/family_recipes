# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :find_invitation, only: %i[show edit update destroy]

 

  def index; end

  def show
    render 'edit'
  end

  def edit; end

  def new; end

  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @invitation = Invitation.new(user_id: id1, friend_id: id2, status: params[:status])
    @invitation.save
    # redirect_to users_path(current_user.id)

    redirect_to invitation_path(@invitation)
  end

  def destroy
    @invitation.destroy

    redirect_to users_path(current_user.id)
  end

  def update
    ### no error to accept invitation
    ### error to accept invitation
    
    # @invitation.update!(invitation_params)

    # current user is the invitee, so he can confirm the invitation
    @invitation.update(confirmed: true) if @invitation.friend == current_user

    friend = @invitation.friend
    friend = @invitation.user if friend == current_user
    friend.memberships.where(user: current_user).destroy_all
    friend.memberships.where(user: current_user).create!(group_id: params[:group_id])

    redirect_to users_path(current_user)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:status)
  end

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end

  

end
