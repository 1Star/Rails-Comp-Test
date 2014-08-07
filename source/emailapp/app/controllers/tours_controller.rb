class ToursController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @tour = Tour.new
  end

  def create
    @user = User.find(params[:user_id])
    if @user.tours.create(permit_tour)
      @confirmation_token = get_token
      @confirmation_at = Time.now
      if @user.update(confirmation_token: @confirmation_token, confirmation_at: @confirmation_at)
        UserMailer.confirm_mail(@user).deliver
        UserMailer.send_tour_to_admin(@user, request.remote_ip).deliver
        redirect_to homes_complete_path
      else
        redirect_to new_user_tour_path(@user), alert: 'Some Error Occurred.'  
      end
    else
      redirect_to new_user_tour_path(@user), alert: 'Please enter all information.'
    end
  end

  private

  def permit_tour
    params.require(:tour).permit(:tour_date, :amenity, :note)
  end

end
