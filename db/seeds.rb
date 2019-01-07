require "populator"


Package.populate 64 do |package|
  package.name = Populator.words(1..5).titleize
  package.days = 3..8
  package.nights = 2..7
  package.itinerary = Populator.paragraphs(3..6)
  package.price = 600..2500
  package.agent_id = 1..2
  package.includes = Populator.sentences(1)
  package.approved = 0
end