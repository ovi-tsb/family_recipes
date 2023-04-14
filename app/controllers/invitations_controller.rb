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
    redirect_to users_path(current_user.id)
  end

  def destroy
    @invitation.destroy

    redirect_to users_path(current_user.id)
  end

  def update
    ### no error to accept invitation
    ### error to accept invitation
    @invitation.update(status: invitation_params[:status])

    friend = @invitation.friend
    if friend == current_user
      # current user is the invitee, so he can confirm the invitation
      @invitation.update(confirmed: true)
      # set membership for the inviting user instead
      friend = @invitation.user
    end
    friend.memberships.where(group: current_user.groups).destroy_all
    friend.memberships.create(group_id: invitation_params[:group])
    redirect_to users_path(current_user.id)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:status, :date, :group)
  end

  def find_invitation
    @invitation = Invitation.find(params[:id])
    friend = @invitation.friend
    friend = @invitation.user if friend == current_user
    @invitation.group = friend.memberships.where(group: current_user.groups).first&.group_id
  end
end
