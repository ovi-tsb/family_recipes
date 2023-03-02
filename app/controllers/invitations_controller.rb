# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :find_invitation, only: %i[show edit update destroy]

  def index; end

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
    invitation.destroy

    redirect_to users_path(current_user.id)
  end

  def update
    ### no error to accept invitation
    ### error to accept invitation
    @invitation.update(status: invitation_params[:status])
    redirect_to invitations_path(current_user.id)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:status, :date)
  end

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end
end
