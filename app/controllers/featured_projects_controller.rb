class FeaturedProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_featured_project, only: [:show, :edit, :update, :destroy]

  # GET /featured_projects
  # GET /featured_projects.json
  def index
    @featured_projects = FeaturedProject.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /featured_projects/1
  # GET /featured_projects/1.json
  def show
  end

  # GET /featured_projects/new
  def new
    @featured_project = FeaturedProject.new
  end

  # GET /featured_projects/1/edit
  def edit
  end

  # POST /featured_projects
  # POST /featured_projects.json
  def create
    @featured_project = FeaturedProject.new(featured_project_params)

    respond_to do |format|
      if @featured_project.save
        format.html { redirect_to @featured_project, notice: 'Featured project was successfully created.' }
        format.json { render :show, status: :created, location: @featured_project }
      else
        format.html { render :new }
        format.json { render json: @featured_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /featured_projects/1
  # PATCH/PUT /featured_projects/1.json
  def update
    respond_to do |format|
      if @featured_project.update(featured_project_params)
        format.html { redirect_to @featured_project, notice: 'Featured project was successfully updated.' }
        format.json { render :show, status: :ok, location: @featured_project }
      else
        format.html { render :edit }
        format.json { render json: @featured_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_projects/1
  # DELETE /featured_projects/1.json
  def destroy
    @featured_project.destroy
    respond_to do |format|
      format.html { redirect_to featured_projects_url, notice: 'Featured project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featured_project
      @featured_project = FeaturedProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def featured_project_params
      params.require(:featured_project).permit(:year, :week, :day)
    end
end
