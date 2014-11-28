class HolidaysController < ApplicationController
  def new
	@holiday = Holiday.new
  end
  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save	
		flash[:success] = "New holiday added successfully"
		
		#redirect user to add another holiday
		redirect_to action:('new')
    #  redirect_to @holiday
    else
      render 'new'
    end
  end

  def show
    @holiday = Holiday.find(params[:id])
  end

private
  
  def holiday_params
	params.require(:holiday).permit(:name, :date)
  end

end
