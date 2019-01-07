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