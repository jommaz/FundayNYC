class FundaysController < ApplicationController
  
  def new
  @funday = Funday.new
   end
  
  def create
    @funday = Funday.new(params.require(:funday).permit(:date))
    if @funday.save
      redirect_to @funday, notice: "Here is what you can do this weekend!"
    else
      render :new, alert: "There was a problem with curating this weekend"
  end

  def show
    @funday = Funday.find(params[:funday_id])
  end
  
end
