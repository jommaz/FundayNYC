class FundayController < ApplicationController
  
  Chiketto.api_key = CWPKSWECLGL2WOLAJT
  
 
  def new
    @event = Chiketto::Event.find(123456)
  end

  def show
    
  end
end
