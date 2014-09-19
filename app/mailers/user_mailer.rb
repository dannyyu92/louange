class UserMailer < ActionMailer::Base
  default from: "contact@louange.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url  = edit_accounts_password_reset_url(user.reset_password_token, host: Rails.configuration.hosts[:forgot_pw])
    mail(:to => user.email,
         :subject => "Your Louange password has been reset")
  end
end
