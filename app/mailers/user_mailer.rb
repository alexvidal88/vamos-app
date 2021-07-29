class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"
    @user = params[:current_user]
    mail(to: @user, subject: 'Welcome to Vamos !')
  end
end
