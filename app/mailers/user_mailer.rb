class UserMailer < ActionMailer::Base
  default from: "from@example.com"

    def confirmation_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email_address, subject: 'Payment Confirmation')
  end
end
