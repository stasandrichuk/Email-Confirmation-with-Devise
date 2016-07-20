class Users::InvitationsController < Devise::InvitationsController

  private

  # this is called when creating invitation
  # should return an instance of resource class
  def invite_resource(&block)
    invited_by_who = User.find_by(email: params[:invited_by])
    resource_class.invite!({:email => params[:email], :user_type => params[:user_type]}, invited_by_who, &block)
  end

  # this is called when accepting invitation
  # should return an instance of resource class
  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    resource
  end
end