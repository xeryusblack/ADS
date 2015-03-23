class UserMailer < ActionMailer::Base
  default from: "projectmasterdebater@gmail.com"

  def confirmation_email(user, debt, officer)
    @user = user
    @debt = debt
    @officer = officer
    mail(to: @user.email_address, subject: 'Payment Confirmation')
  end

# def report_email(admin, pdf)
#   @admin = admin
#   attachments['MyPDF.pdf'] = pdf
#   mail(:to => @admin.email, :subject => "awesome pdf, check it")
#  end

 def report_email(admin, varsity)
  @admin = admin
    @varsity_members = varsity #.where("total_debt > 0")
  mail(:subject => 'Current Balance Report', :to => @admin.email) do |format|
    format.text
    format.pdf do
      attachments['balance_report.pdf'] = WickedPdf.new.pdf_from_string(
        render_to_string(:pdf => "report_email_varsity_members_path",:template => 'varsity_members/report_email.pdf.erb')
      )
    end
  end
 end
end
