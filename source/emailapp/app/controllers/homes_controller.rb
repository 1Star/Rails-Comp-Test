class HomesController < ApplicationController

  def index
  end

  def invite
    email = params[:user][:email]

    params[:user][:invitation_token] = get_token
    params[:user][:invitation_at] = Time.now

    user = User.find_by_email email
    user = User.new(invite_params) if user.nil?
    
    if user.save
      UserMailer.invite_mail(user).deliver
      flash[:notice] = 'Email successfully sent!'
      render action: :index
    else
      flash[:alert] = 'Some errors occurred.'
      render action: :index
    end

  end

  def complete
  end

  private

  def invite_params
    params.require(:user).permit(:email, :invitation_token, :invitation_at)
  end

end
