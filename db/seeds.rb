require "populator"
require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.name = row[0]
  end
end

puts "Importing province..."
CSV.foreach(Rails.root.join("province.csv"), headers: true) do |row|
  Province.create! do |province|
    province.name = row[0]
    province.country_id = row[1]
  end
end

puts "Populating Packages..."
Package.populate 64 do |package|
  package.name = Populator.words(1..5).titleize
  package.days = 3..8
  package.nights = 2..7
  package.departure = "2019-03-28"
  package.country_id = 1..6
  package.province_id = 1
  package.itinerary = Populator.paragraphs(3)
  package.agent_id = 1..2
  package.price = 600..2500
  package.includes = Populator.sentences(1)
  package.approved = false
end