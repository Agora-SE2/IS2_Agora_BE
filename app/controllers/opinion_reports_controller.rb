class OpinionReportsController < ApplicationController
  before_action :set_opinion_report, only: [:show, :edit, :update, :destroy]

  # GET /opinion_reports
  # GET /opinion_reports.json
  def index
    @opinion_reports = OpinionReport.all
  end

  # GET /opinion_reports/1
  # GET /opinion_reports/1.json
  def show
  end

  # GET /opinion_reports/new
  def new
    @opinion_report = OpinionReport.new
  end

  # GET /opinion_reports/1/edit
  def edit
  end

  # POST /opinion_reports
  # POST /opinion_reports.json
  def create
    if OpinionReport.where(opinion_report_params).count > 0
      render json: {
      status: "Error",
      message: "Ya se ha enviado un reporte sobre esta opinión"
    }.to_json
    else  
      @opinion_report = OpinionReport.new(opinion_report_params)
        if @opinion_report.save
          render json: {
          status: "Exito",
          message: "Se ha enviado la denuncia satisfactoriamente"
        }.to_json
        else
          format.json { render json: @opinion_report.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /opinion_reports/1
  # PATCH/PUT /opinion_reports/1.json
  def update
    respond_to do |format|
      if @opinion_report.update(opinion_report_params)
        format.html { redirect_to @opinion_report, notice: 'Opinion report was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion_report }
      else
        format.html { render :edit }
        format.json { render json: @opinion_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinion_reports/1
  # DELETE /opinion_reports/1.json
  def destroy
    @opinion_report.destroy
    respond_to do |format|
      format.html { redirect_to opinion_reports_url, notice: 'Opinion report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion_report
      @opinion_report = OpinionReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_report_params
      params.require(:opinion_report).permit(:opinion_id, :reason, :user_id)
    end
end
