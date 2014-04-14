class ExcelsController < ApplicationController
  before_action :set_excel, only: [:show, :edit, :update, :destroy]


  # require 'parser'

  # GET /excels
  # GET /excels.json
  def index
    @excels = Excel.all
    respond_to do |format|

        format.html { Excel.all }
        format.json { render json:  @excels = Excel.last }
    end
  end

  # GET /excels/1
  # GET /excels/1.json
  def showrespond_to

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
    Excel.delete_all
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
      proj.empid = workbook.row(row)[headers['Employee ID']]
      proj.name = workbook.row(row)[headers['Name']]
      proj.designation = workbook.row(row)[headers['Designation']]
      proj.grade = workbook.row(row)[headers['Grade']]
      proj.mobile = workbook.row(row)[headers['Mobile']]
      proj.tcsmailid = workbook.row(row)[headers['TCS Mail ID (eg., test.s@tcs.com)']]
      proj.nmailid = workbook.row(row)[headers['Nielsen Mail ID (test.valid.ap@nielsen.com)']]
      proj.seatno = workbook.row(row)[headers['Seat Number (eg. EB5 5F NW 128)']]
      proj.city = workbook.row(row)[headers['Work City (eg., Chennai, Oldsmar etc)']]
      proj.country = workbook.row(row)[headers['Work Country']]
      proj.client = workbook.row(row)[headers['Client Country']]
      proj.stream = workbook.row(row)[headers['Stream (eg., AOD, Media SD etc)']]
      proj.portfolio = workbook.row(row)[headers['Portfolio (eg. Buy, Watch, Specialty)']]
      proj.won = workbook.row(row)[headers['WON']]
      proj.pname = workbook.row(row)[headers['Project Name']]
      proj.award = workbook.row(row)[headers['Award Holders']]
      proj.awardname = workbook.row(row)[headers['Award Name']]
      proj.save
      arr << proj
    end
  end
end
