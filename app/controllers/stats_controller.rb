class StatsController < ApplicationController
    
    def index
        @project_tag = ProjectTag.order("yes_votes": :desc).paginate(:page => 1, :per_page => 10)
        render json: @project_tag
    end
    
end
