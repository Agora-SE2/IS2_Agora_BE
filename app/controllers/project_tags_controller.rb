class ProjectTagsController < ApplicationController
  #acts_as_token_authentication_handler_for User
  #skip_before_action :verify_authenticity_token
  before_action :set_project_tag, only: [:show, :edit, :update, :destroy]

  # GET /project_tags
  # GET /project_tags.json
  def index
    #@project_tags = ProjectTag.all
    @project_tags = ProjectTag.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /project_tags/1
  # GET /project_tags/1.json
  def show
  end

  # GET /project_tags/new
  def new
    @project_tag = ProjectTag.new
  end

  # GET /project_tags/1/edit
  def edit
  end

  # POST /project_tags
  # POST /project_tags.json
  def create
    @project_tag = ProjectTag.new(project_tag_params)

    respond_to do |format|
      if @project_tag.save
        
        format.json { render :show, status: :created, location: @project_tag }
      else
        
        format.json { render json: @project_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_tags/1
  # PATCH/PUT /project_tags/1.json
  def update
    respond_to do |format|
      if @project_tag.update(project_tag_params)
        
        format.json { render :show, status: :ok, location: @project_tag }
      else
        
        format.json { render json: @project_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_tags/1
  # DELETE /project_tags/1.json
  def destroy
    @project_tag.destroy
    respond_to do |format|
      
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_tag
      @project_tag = ProjectTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_tag_params
      params.fetch(:project_tag, {})
    end
end
