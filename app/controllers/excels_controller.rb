class ExcelsController < ApplicationController
  before_action :set_excel, only: [:show, :edit, :update, :destroy]

  # GET /excels
  # GET /excels.json
  def index
    @excels = Excel.all
  end

  # GET /excels/1
  # GET /excels/1.json
  def show
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
    @excel = Excel.new(excel_params)

    respond_to do |format|
      if @excel.save
        format.html { redirect_to @excel, notice: 'Excel was successfully created.' }
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
end
