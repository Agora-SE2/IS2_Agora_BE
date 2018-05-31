class HomeController < ApplicationController
  def index
     render json: {
      status: 200,
      message: "Ok"
    }.to_json
  end
end
