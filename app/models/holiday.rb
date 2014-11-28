class Holiday < ActiveRecord::Base
  validates :name, presence: true, length:{minimum: 4,  maximum: 30}
  validates :date, presence: true, uniqueness: true
end
