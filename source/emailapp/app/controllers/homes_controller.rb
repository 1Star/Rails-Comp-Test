class HomesController < ApplicationController

  def index
    @user = User.new
  end

  def invite
    email = params[:user][:email]

    params[:user][:invitation_token] = get_token
    params[:user][:invitation_at] = Time.now

    @user = User.find_by_email email
    @user.destroy unless @user.nil?
    @user = User.new(invite_params)
    
    if @user.save
      UserMailer.invite_mail(@user).deliver
      redirect_to root_path, notice:'Email successfully sent!'
    else
      flash[:alert] = 'Some errors occurred.'
      render 'index'
    end

  end

  def complete
  end

  private

  def invite_params
    params.require(:user).permit(:email, :invitation_token, :invitation_at)
  end

end
