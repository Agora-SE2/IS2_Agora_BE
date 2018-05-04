class Stats::MoreDownvotedController < ApplicationController
    
    def index
        @more_downvoted = LawProject.order_by_downvotes.paginate(:page => 1, :per_page => 5)
        render json: @more_downvoted, each_serializer: MoreUpvotedSerializer
    end
    
end
