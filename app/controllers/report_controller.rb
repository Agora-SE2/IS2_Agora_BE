class ReportController < ApplicationController
  def index
    
  end
  
end
 private
    def report_params
      params.permit(:id)
    end

