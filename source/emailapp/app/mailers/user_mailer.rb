class UserMailer < ActionMailer::Base
  default from: 'EMAIL APP ADMIN<admin@gmail.com>'

  def invite_mail(user)
    @user = user
    mail(to: user.email, subject: 'Invitation')
  end

  def confirm_mail(user)
    @user = user
    mail(to: user.email, subject: 'Confirmation')
  end

  def send_tour_to_admin(user, remote_ip)
    @user, @remote_ip = user, remote_ip
    mail(to: 'Admin<filipbalas328@gmail.com>', subject: 'New Tour Scheduled')
  end
end
