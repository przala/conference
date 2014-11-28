class Bookings < ActiveRecord::Base
  validates :check_in_time, presence: true
  validates :check_out_time, presence: true
end
