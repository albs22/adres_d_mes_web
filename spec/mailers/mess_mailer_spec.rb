require "spec_helper"

describe MessMailer do 
  describe :approval do
    let(:user) { Factory :admin_user }
    let(:mess) { Factory :mess }
    let(:mail) { MessMailer.approval_email(mess) }

    it "renders subject" do
      mail.subject.should eq("New Mess Approval")
    end

    it "renders sender email" do
      mail.from.should eq(["approvals@addressdmess.com"])
    end

  end

end


