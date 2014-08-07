class UsersController < ApplicationController
  before_filter :check_invited, only: [:sign_up]
  before_filter :check_confirmed, only: [:tour_start]

  def sign_up
  end

  def tour_start
        
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permit_for_update)
      redirect_to new_user_tour_path(@user)
    else
      render :sign_up
    end
  end

  private

  def check_invited
    @email, @invitation_token = params[:email], params[:invitation_token]

    if @invitation_token.blank?
      @invited = false
    else
      @user = User.where(email: @email, invitation_token: @invitation_token).where('invitation_at > ?', 2.weeks.ago).first
      @invited = @user.nil? ? false : true
    end

    redirect_to(root_path) unless @invited # Redirects home page if user has not been invited by system.
  end

  def check_confirmed
    @email, @confirmation_token = params[:email], params[:confirmation_token]

    if @confirmation_token.blank?
      @confirmed = false
    else
      @user = User.where(email: @email, confirmation_token: @confirmation_token).first
      @confirmed = @user.nil? ? false : true
    end

    redirect_to(root_path) unless @confirmed # Redirects home page if user has not been invited by system.
  end

  private

  def permit_for_update
    params.require(:user).permit(:first_name, :last_name, :phone)
  end

end
