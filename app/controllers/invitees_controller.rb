class InviteesController < ApplicationController

  def create
    @invitee = Invitee.create!(invitee_params)
  end

  private

  def invitee_params
    params.require(:email) #.permit not working
  end

end
