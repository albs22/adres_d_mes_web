require 'spec_helper'

describe Event do
  before (:each) do
    @event = FactoryGirl.create(:event)
  end

  subject { @event }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:date) }
  it { should respond_to(:location) }
  it { should respond_to(:user) }
    
end  

