class Stats::MoreCommentedController < ApplicationController
    
    def index
        @more_commented = LawProject.order_by_opinions().paginate(:page => 1, :per_page => 5)
        render json: @more_commented, each_serializer: MoreCommentedSerializer
    end
    
end
