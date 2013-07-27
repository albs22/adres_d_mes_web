namespace :db do
  desc "Fill DB with sample code violations"
  task populate: :environment do
    Violation.create!(lat: 32.225,
                      long: -110.968,
                      date_entered: DateTime.new(2013, 7, 27),
                      description: "Detached Ramada Built Without Permits And Not Meeting Setback Requirements. Work Completed About 2 Weeks Ago.",
                      status: "Pending",
                      violation_type: "Work Without Permits-Resident")
   # 1.times do |n|
   end
        









end
