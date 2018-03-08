class LawProjectsController < ApplicationController
  before_action :set_law_project, only: [:show, :edit, :update, :destroy]

  # GET /law_projects
  # GET /law_projects.json
  def index
    @law_projects = LawProject.all
  end

  # GET /law_projects/1
  # GET /law_projects/1.json
  def show
  end

  # GET /law_projects/new
  def new
    @law_project = LawProject.new
  end

  # GET /law_projects/1/edit
  def edit
  end

  # POST /law_projects
  # POST /law_projects.json
  def create
    @law_project = LawProject.new(law_project_params)

    respond_to do |format|
      if @law_project.save
        format.html { redirect_to @law_project, notice: 'Law project was successfully created.' }
        format.json { render :show, status: :created, location: @law_project }
      else
        format.html { render :new }
        format.json { render json: @law_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /law_projects/1
  # PATCH/PUT /law_projects/1.json
  def update
    respond_to do |format|
      if @law_project.update(law_project_params)
        format.html { redirect_to @law_project, notice: 'Law project was successfully updated.' }
        format.json { render :show, status: :ok, location: @law_project }
      else
        format.html { render :edit }
        format.json { render json: @law_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /law_projects/1
  # DELETE /law_projects/1.json
  def destroy
    @law_project.destroy
    respond_to do |format|
      format.html { redirect_to law_projects_url, notice: 'Law project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_law_project
      @law_project = LawProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def law_project_params
      params.require(:law_project).permit(:name, :description, :publication_date, :yes_votes, :not_votes)
    end
end