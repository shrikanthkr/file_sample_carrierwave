class ExcelsController < ApplicationController
  before_action :set_excel, only: [:show, :edit, :update, :destroy]


  # require 'parser'

  # GET /excels
  # GET /excels.json
  def index
    @excels = Excel.all
  end

  # GET /excels/1
  # GET /excels/1.json
  def show

      render json: Project.all

  end

  # GET /excels/new
  def new
    @excel = Excel.new
  end

  # GET /excels/1/edit
  def edit
  end

  # POST /excels
  # POST /excels.json
  def create
    Project.delete_all
    @excel = Excel.new(excel_params)
    respond_to do |format|
      if @excel.save
        parse_excel(@excel)
        format.html { redirect_to excels_path, notice: 'Excel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @excel }
      else
        format.html { render action: 'new' }
        format.json { render json: @excel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excels/1
  # PATCH/PUT /excels/1.json
  def update
    respond_to do |format|
      if @excel.update(excel_params)
        format.html { redirect_to @excel, notice: 'Excel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @excel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excels/1
  # DELETE /excels/1.json
  def destroy
    @excel.destroy
    respond_to do |format|
      format.html { redirect_to excels_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_excel
    @excel = Excel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def excel_params
    params.require(:excel).permit(:name, :avatar)
  end

  def parse_excel obj
    workbook = Roo::Excel.new("#{Rails.root}/public/#{obj.avatar.to_s}")
    headers = Hash.new
    arr  =  []
    workbook.row(1).each_with_index {|header,i| headers[header] = i }
    ((workbook.first_row + 1)..workbook.last_row - 3).each do |row|
      proj = Project.new
      proj.name = workbook.row(row)[headers['Name']]
      proj.number = workbook.row(row)[headers['Number']]
      proj.lead = workbook.row(row)[headers['Lead']]
      proj.pTower = workbook.row(row)[headers['Tower']]
      proj.pSpecType = workbook.row(row)[headers['Type ( For Specialty alone)']]
      proj.pTargetDate = workbook.row(row)[headers['Target Date']]
      proj.pPass = workbook.row(row)[headers['PassCase']]
      proj.pFail = workbook.row(row)[headers['FailCase']]
      proj.pNoRun = workbook.row(row)[headers['No Run Case']]
      proj.pNotComp = workbook.row(row)[headers['Case']]
      proj.pTotalCase = workbook.row(row)[headers['Total Case']]
      proj.pRAG = workbook.row(row)[headers['RAG']]
      proj.save
      arr << proj
    end
  end
end
