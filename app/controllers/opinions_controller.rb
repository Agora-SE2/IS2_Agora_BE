class OpinionsController < ApplicationController
  #acts_as_token_authentication_handler_for User
  #skip_before_action :verify_authenticity_token
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]

  require 'net/http'
  
  url = URI.parse('http://www.example.com/index.html')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  puts res.body

  # GET /opinions
  # GET /opinions.json
  def index
    #@opinions = Opinion.all
    if params[:project] && params[:ispro]
      if params[:ispro] == "true"
        @opinions= Opinion.pro_opinions_by_id(params[:project])
      else
        @opinions= Opinion.against_opinions_by_id(params[:project])
      end
      
    elsif params[:law_project]
      @opinions = Opinion.opinions_of_this_lp(params[:law_project])
    else
      @opinions = Opinion.paginate(:page => params[:page], :per_page => 10)
      #@opinions = Opinion.ordered_by_likes().paginate(:page => params[:page], :per_page => 10)
    end
    #@Pro = 1
    #
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        OpinionMailer.opinion_email(@opinion).deliver_later
        format.json { render :show, status: :created, location: @opinion }
      else
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:content, :date, :like, :pro, :project, :ispro, :law_project)
    end
end
