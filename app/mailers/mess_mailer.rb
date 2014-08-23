class MessMailer < ActionMailer::Base
  default from: "approvals@addressdmess.com"

  def approval_email(mess)
    @mess = mess

    users = User.where(:admin => 'true')
    #Send approval email to all admin users
    users.each do |u|
      mail(to: u.email, subject: "New Mess Appproval")
    end

  end

end
