class RoomsController < ApplicationController
  def new
	@room = Room.new
  end
  def create
    @room = Room.new(room_params)
    if @room.save	
		flash[:success] = "New room added successfully"
		
		#redirect user to add another room
		redirect_to action:('new')
    #  redirect_to @room
    else
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
  end

private
  
  def room_params
	params.require(:room).permit(:name, :address, :capacity)
  end

end
