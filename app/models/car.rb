class Car < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true
end
