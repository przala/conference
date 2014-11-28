class Room < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length:{minimum: 4,  maximum: 30}
  validates :address, length:{maximum: 150}
  validates :capacity, length:{maximum: 8}
end
