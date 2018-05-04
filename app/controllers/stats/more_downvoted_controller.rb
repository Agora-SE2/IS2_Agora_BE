class Stats::MoreDownvotedController < ApplicationController
    
    def index
        
        respond_to do |format|
          format.html
          format.pdf do
                render  :pdf => "more_downvoted.pdf", :template => 'report/more_downvoted.html.erb'
          end
          format.json do
                @more_downvoted = LawProject.order_by_downvotes.paginate(:page => 1, :per_page => 15)
                render json: @more_downvoted, each_serializer: MoreUpvotedSerializer
          end
        end
        
        
    end
    
end
