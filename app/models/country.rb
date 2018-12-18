class Country < ApplicationRecord
  has_many :package
  has_many :province
end
