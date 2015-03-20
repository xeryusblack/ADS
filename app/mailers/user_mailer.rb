class UserMailer < ActionMailer::Base
  default from: "projectmasterdebater@gmail.com"

    def confirmation_email(user, debt, officer)
    @user = user
    @debt = debt
    @officer = officer
    mail(to: @user.email_address, subject: 'Payment Confirmation')
  end
end
