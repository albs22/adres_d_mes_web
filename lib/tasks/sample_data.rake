#require 'csv'
namespace :db do
	
	desc "Add Sample User"
	task addUser: :environment do
		User.create!(name: "Example User",
								 email: "example2@adresdmes.org",
								 password: "foobar",
								 password_confirmation: "foobar")
	end
  
  desc "Add events"
  task addEvents: :environment do
    event = Event.create!(lat: 32.228,
                  lng: -110.947,
                  title: "The first event",
                  description: "Welcome to the first event",
                  #date: DateTime.new('2014, 11, 10'),
                  location: "Some street"
                  )
    event.violations.create!(
                      lat: 32.2460,
                      lng: -110.9595,
                      violation_address: '123 Seed St',
                      description: 'Event link test mess')
    event2 = Event.create!(lat: 32.328,
                  lng: -110.747,
                  title: "The Second Event",
                  description: "The new and improved event",
                  #date: DateTime.new('2015, 11, 3'),
                  location: "Rillito Wash"
                  )
    event2.violations.create!(
                      lat: 32.2460,
                      lng: -110.9595,
                      violation_address: '123 Seed St',
                      description: 'Some in the wash')



  end
						


  desc "Fill DB with sample code violations"
  task populate: :environment do
    Violation.create!(lat: 32.2263,
                      long: -110.9469,
                      date_entered: DateTime.new(2013, 7, 15),
                      description: "Discarded Couch Out By Sidewalk - Has Been There A Couple Weeks.",
                      status: "Field",
                      violation_type: "Refuse",
                      violation_address: "1663 E 9th St",
                      photo_name: "v_001_sm.jpg"
                      )
                      
    Violation.create!(lat: 32.25558,
                      long: -110.96658,
                      date_entered: DateTime.new(2013, 7, 18),
                      description: "Trash In Bags On Property, Has Been There For Several Weeks.",
                      status: "Pending",
                      violation_type: "Refuse",
                      violation_address: "322 E Kelso St",
                      photo_name: "v_002_sm.jpg"
                      )
                      
   # 1.times do |n|
   end
   
   
  # desc "Parse CSV To DB"
   #task csv_parse :environment do
    #file_name = violation_data.txt
    #CSV.foreach(file_name, :headers => true, :col_sep => ?;) do |row|
      #Violation.create!(row.to_hash)
      # GPS cordinates need to be converted
      # DB column names do not match
    #end
   
   #end
end
