class SegmentsController < ApplicationController
    

    def create
     @funday = Funday.find(params[:funday_id])
     @segment = Segment.new(params.require(:segment).permit(:name, :desc, :startime, :endtime).merge(funday_id: params[:funday_id], funday_date: params[:funday_date]))
    end
    

end
