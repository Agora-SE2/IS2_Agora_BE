class Stats::MoreUpvotedController < ApplicationController
    
    def index
        respond_to do |format|
          format.html
          format.pdf do
            render  :pdf => "more_upvoted.pdf", :template => 'report/more_upvotes.html.erb'
          end
          format.json do
            @more_upvoted = LawProject.order_by_upvotes().paginate(:page => 1, :per_page => 5)
            render json: @more_upvoted, each_serializer: MoreUpvotedSerializer
          end
        end
    end
    
end
