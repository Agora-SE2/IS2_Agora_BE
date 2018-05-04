class Stats::MoreUpvotedController < ApplicationController
    
    def index
        @more_upvoted = LawProject.order_by_upvotes().paginate(:page => 1, :per_page => 5)
        render json: @more_upvoted, each_serializer: MoreUpvotedSerializer
    end
    
end
