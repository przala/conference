module BookingsHelper

  def check_availability(check_in, check_out, roomselect)
	#get room id
	@room = Room.find(param[:name])
	if room.nil?
		return (false)
	end
	
	if (check_in.date.sunday? || check_in.date.saturday?)
		return (false)
	
	if (check_out.date.sunday? || check_out.date.saturday?)
		return (false)
	
	Holiday.all.each do |holiday|
	  if (check_in.date === holiday.date || check_out.date ===holiday.date)
		return (false)
	  end
	end
	
	Bookings.all.each do |bookings|
		if (!((check_in < bookings.check_in_time && check_out < bookings.check_in_time) || (check_in > bookings.check_out_time && check_out > bookings.check_out_time)))
			return false
		end
	end
	
	return true
end
