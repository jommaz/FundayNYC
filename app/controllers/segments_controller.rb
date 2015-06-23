class SegmentsController < ApplicationController
   
    
    def new
    @funday = Funday.find(params[:funday_id])
    @timesstartDate = (@funday.date).strftime("%Y-%m-%d")
    @timesendDate = ((@funday.date)+1.day).strftime("%Y-%m-%d")
    @timesuri = URI("http://api.nytimes.com/svc/events/v2/listings.json?&filters=-movies&date_range=" + @timesstartDate + "%3A" + @timesendDate + "&api-key=5faa2f00a53bae3c1eae66d590a71379%3A15%3A56215610")
    @timesresponse = Net::HTTP.get(@timesuri)
    puts @timesuri
    @timesparsed = JSON.parse(@timesresponse)
    
    @ebtoken = "&token=3KR5F4OMCGQ46DC5YK23"
    @start = "&start_date.range_start="
    @ebstartdate = ((@funday.date).strftime("%Y-%m-%d"))
    @end = "&start_date.range_end="
    @eburi = URI("https://www.eventbriteapi.com/v3/events/search/?popular=on&venue.city=New+York" + @start + @ebstartdate + "T00:00:00Z" + @end + @ebstartdate + "T23:59:00Z" + @ebtoken)
    @ebresponse = Net::HTTP.get(@eburi)
    puts @eburi
    @ebparsed = JSON.parse(@ebresponse)
    
    @gostartDate = (@funday.date).strftime("%m%%2F%d%%2F%Y")
    @goenddate = ((@funday.date)+1.day).strftime("%m%%2F%d%%2F%Y")
    @gouri = URI("https://api.cityofnewyork.us/calendar/v1/search.htm?app_id=c6f58431&app_key=3d9f670dc4b0c12b795235414c2fb389"  + "&startDate=" + @gostartDate + "+12%3A00+PM" + "&endDate=" + @goenddate + "+12%3A00+PM" + "&categories=cultural")
    @goresponse = Net::HTTP.get(@gouri)
    puts @gouri
    @goparsed = JSON.parse(@goresponse)
    
    end
 
    def create
     @funday = Funday.find(params[:funday_id])
     @segment = Segment.new(params.require(:segment).permit(:name, :desc, :startime, :endtime).merge(funday_id: params[:funday_id], funday_date: params[:funday_date]))
    end
    
end
