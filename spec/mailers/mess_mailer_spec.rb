require "spec_helper"

describe MessMailer do 

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.save
    @user.toggle!(:admin)
  end

  describe :approval do
    let(:mess) { FactoryGirl.create(:violation) }
    let(:mail) { MessMailer.approval_email(mess) }

    it "renders subject" do
      mail.subject.should eq("New Mess Approval")
    end

    it "renders sender email" do
      mail.from.should eq(["approvals@addressdmess.com"])
    end

    it "renders receiver email" do 
      mail.to.should eq([@user.email])
    end
  end
end


