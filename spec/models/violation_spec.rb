require 'spec_helper'

describe Violation do
	before do
		@violation = Violation.new(lat: 88.00, lng: 112.00, description: "Test this violation", status: "open", violation_address: "123 Fake St.", violation_type: "mess")
	end

	subject { @violation }

	it { should respond_to(:lat) }
	it { should respond_to(:lng) }
	it { should respond_to(:status) }
	it { should respond_to(:description) }
	it { should respond_to(:violation_address) }
	it { should respond_to(:violation_type) }

end
