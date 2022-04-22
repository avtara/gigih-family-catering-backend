class Category < ApplicationRecord
  validates :name, :presence => true
  has_one :menu
end
