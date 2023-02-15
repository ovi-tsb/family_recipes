class InvitationsController < ApplicationController
  	# before_action :set_invitation, only: [:show, :edit, :update, :destroy]
    before_action :find_invitation, only: [:show, :edit, :update, :destroy]

    def index
    end
    def edit
      @invitation = Invitation.find(params[:invitation_id])  
    end
    def new

    end

    def create
      id1 = params[:ids][:id1]
      id2 = params[:ids][:id2]
      @invitation = Invitation.new(user_id: id1, friend_id: id2, status: 0)
      @invitation.save
      redirect_to users_path(current_user.id)
    end

    def destroy
      invitation = Invitation.find(params[:invitation_id])

      invitation.destroy

     
      redirect_to users_path(current_user.id)
    end

    def update
      ### no error to accept invitation
      invitation = Invitation.find(params[:invitation_id])

      ### error to accept invitation
      # invitation = Invitation.find(params[:id])
      
      p current_user
      invitation.update(confirmed: true)
      redirect_to invitations_path(current_user.id)
      # redirect_to users_path(current_user.id)
    end

    # def update 
    #    invitation = Invitation.find(params[:id])
    #     # invitation = Invitation.find(params[:invitation_id])
    #     if @invitation.update(invitation_params)
          
    #       redirect_to invitations_path(current_user.id), notice: 'Your job was created successfully'
    #     else
    #       render :edit
    #     end
    #   end

    # def set_invitation
    #   @invitation = Invitation.find(params[:id])
    # end
  private
    def invitation_params
      params.require(:invitation).permit(:status, :date )
    end
    def find_invitation
      ### no error to delete friend
      
        @invitation = Invitation.find(params[:invitation_id])



        # @invitation = Invitation.find(params[:id])
    end
end
