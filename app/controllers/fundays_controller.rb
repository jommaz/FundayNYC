class FundaysController < ApplicationController
  
  def new
  @funday = Funday.new
  end
  
  def create
    @funday = Funday.new(params.require(:funday).permit(:date))
    if @funday.save
      redirect_to new_funday_segment_path(@funday), notice: "Here is what you can do this weekend!"
    else
      render :new, alert: "There was a problem with curating this weekend"
    end
  end

  def show
    @funday = Funday.find(params[:id])
  end
  
  def update
    @funday = Funday.find(params[:id])
    if @funday.update(params.require(:funday).permit(:date))
      redirect_to new_funday_segment_path(@funday)
    else
      render new_funday_segment_path(@funday)
    end
  end
  
end
