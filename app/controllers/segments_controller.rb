class SegmentsController < ApplicationController
    
    def new
    @funday = Funday.find(params[:funday_id])
    @token = "&token=3KR5F4OMCGQ46DC5YK23"
    @start = "&start_date.range_start="
    @startdate = @funday.date + "T01%3A00%3A43Z"
    @end = "&start_date.range_end="
    @enddate = @funday.date + "T23%3A00%3A43Z"
    @specs = "/?popular=on&venue.city=New+York"
    @uri = URI("https://www.eventbriteapi.com/v3/events/search" + @specs + @start + @startdate + @end + @enddate + @token)
    response = Net::HTTP.get(@uri)
    puts @uri
    @parsed = JSON.parse(response)
    end
    


    def create
     @funday = Funday.find(params[:funday_id])
     @segment = Segment.new(params.require(:segment).permit(:name, :desc, :startime, :endtime).merge(funday_id: params[:funday_id], funday_date: params[:funday_date]))
    end
    
end
