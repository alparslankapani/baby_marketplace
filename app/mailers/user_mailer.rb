class UserMailer < ActionMailer::Base
  default from: "Karlı Bebek <alparslankapani@webiesel.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_message.subject
  #
  def welcome_message(user)
    @user = user

    mail to: user.email, subject: "İkinciel Bebek sitesine hoş geldiniz."
  end
end
