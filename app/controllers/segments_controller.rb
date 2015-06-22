class SegmentsController < ApplicationController
    
    # def new
    # @funday = Funday.find(params[:funday_id])
    # @startDate = (@funday.date).strftime("%m%%2F%d%%2F%Y")
    # @enddate = ((@funday.date)+1.day).strftime("%m%%2F%d%%2F%Y")
    # @uri = URI("https://api.cityofnewyork.us/calendar/v1/search.htm?app_id=c6f58431&app_key=3d9f670dc4b0c12b795235414c2fb389"  + "&startDate=" + @startDate + "+12%3A00+PM" + "&endDate=" + @enddate + "+12%3A00+PM" + "&categories=cultural")
    # @response = Net::HTTP.get(@uri)
    # puts @uri
    # @parsed = JSON.parse(@response)
    # end
    
    # "https://api.cityofnewyork.us/calendar/v1/search.htm?app_id=c6f58431&app_key=3d9f670dc4b0c12b795235414c2fb389&startDate=06%2F25%2F2015+12%3A00+PM&endDate=06%2F26%2F2015+12%3A00+PM"
    
    # https://api.cityofnewyork.us/calendar/v1/search.htm?app_id=c6f58431&app_key=3d9f670dc4b0c12b795235414c2fb389&startDate=06%2F27%2F2015+00%3A00+AM&endDate=06%2F28%2F2015+00%3A00+AM
    
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
    @ebstartdate = ((@funday.date).strftime("%Y-%m-%dT%l:%M:%SZ"))
    @end = "&start_date.range_end="
    @ebenddate = (((@funday.date)+ 1.day).strftime("%Y-%m-%dT%l:%M:%SZ"))
    @eburi = URI("https://www.eventbriteapi.com/v3/events/search/?popular=on&venue.city=New+York" + @start + @ebstartdate + @end + @ebenddate + @ebtoken)
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
    
    # gon.latitude = @parsed["results"][0]["geocode_latitude"]
    # gon.longitude = @parsed["results"][0]["geocode_longitude"]
    # # @longitude = @parsed[3][9]
    
    # puts gon.latitude
    # puts gon.longitude
    # # puts @longitude
    
    
#     def new
#     @funday = Funday.find(params[:funday_id])
#   	@token = "&token=3KR5F4OMCGQ46DC5YK23"
#     @start = "&start_date.range_start="
#     @startdate = ((@funday.date).strftime("%Y-%m-%dT%l:%M:%SZ"))
#     @end = "&start_date.range_end="
#     @enddate = (((@funday.date)+ 1.day).strftime("%Y-%m-%dT%l:%M:%SZ"))
#     @specs = "/?popular=on&venue.city=New+York"
#     @uri = URI("https://www.eventbriteapi.com/v3/events/search" + @specs + @start + @startdate + @end + @enddate + @token)
#     response = Net::HTTP.get(@uri)
#     puts @uri
#     @parsed = JSON.parse(response)
#     end
    
    # https://www.eventbriteapi.com/v3/events/search/?popular=on&venue.city=New+York&start_date.range_start=2015-06-25T00%3A00%3A48Z&start_date.range_end=2015-06-26T23%3A00%3A51Z&token=3KR5F4OMCGQ46DC5YK23

    # curl -v  -X GET "https://api.cityofnewyork.us/calendar/v1/search.htm?app_id=c6f58431&app_key=3d9f670dc4b0c12b795235414c2fb389&startDate=06%2F25%2F2015+08%3A00+AM&endDate=06%2F26%2F2015+08%3A00+AM"

    def create
     @funday = Funday.find(params[:funday_id])
     @segment = Segment.new(params.require(:segment).permit(:name, :desc, :startime, :endtime).merge(funday_id: params[:funday_id], funday_date: params[:funday_date]))
    end
    
end
