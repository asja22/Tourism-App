class Province < ApplicationRecord
  belongs_to :country
  has_many :package
end
