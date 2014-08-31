class MessMailer < ActionMailer::Base
  default from: "approvals@mail.addressdmess.com"

  def approval_email(mess)
    @mess = mess
     users = User.where(:admin => true)
     
    #Send approval email to all admin users
    users.each do |u|
      puts "Sent email to: " + u.email
      mail(to: u.email, subject: "New Mess Approval")
    end

  end

end
