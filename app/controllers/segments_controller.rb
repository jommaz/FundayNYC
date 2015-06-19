class SegmentsController < ApplicationController
    
    def new
    @funday = Funday.find(params[:funday_id])
    response = RestClient.get('http://api.nytimes.com/svc/events/v2/listings.json?&filters=category:(-Movies)&date-range=2015-06-20:2015-06-21&api-key=5faa2f00a53bae3c1eae66d590a71379:15:56215610')
    @parsed = JSON.parse(response)
    end
    


    def create
     @funday = Funday.find(params[:funday_id])
     @segment = Segment.new(params.require(:segment).permit(:name, :desc, :startime, :endtime).merge(funday_id: params[:funday_id], funday_date: params[:funday_date]))
    end
    
end
