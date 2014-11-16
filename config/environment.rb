# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CodeViolations::Application.initialize!

Time::DATE_FORMATS[:default] = "%B %d, %Y %l:%M %p"
