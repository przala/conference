class BookingsController < ApplicationController
  def new
	@booking = Booking.new
  end
  def create
    @booking = Booking.new(booking_params)
	if !logged_in?
		redirect_to :controller => 'session', :action => 'new'
	end
	
	success = check_availability(@booking.check_in_time, @booking.check_out_time, @booking.roomselect)
	if !success
		flash[:success] = "Particular slot not available for booking"
		redirect_to :controller => 'session', :action => 'new'
	end
	
    if @booking.save	
		flash[:success] = "Your booking completed successfully"
		
		#redirect user same screen, new action
		redirect_to action:('new')
    #  redirect_to @booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

private
  
  def booking_params
	params.require(:booking).permit(:check_in_time, :check_out_time, :userselect, :roomselect)
  end

end
