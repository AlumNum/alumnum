class UsertagsController < ApplicationController
  before_action :set_usertag, only: [:show, :edit, :update, :destroy]

  # GET /usertags
  # GET /usertags.json
  def index
    @usertags = Usertag.all
  end

  # GET /usertags/1
  # GET /usertags/1.json
  def show
  end

  # GET /usertags/new
  def new
    @usertag = Usertag.new
  end

  # GET /usertags/1/edit
  def edit
  end

  # POST /usertags
  # POST /usertags.json
  def create
    @usertag = Usertag.new(usertag_params)

    respond_to do |format|
      if @usertag.save
        format.html { redirect_to @usertag, notice: 'Usertag was successfully created.' }
        format.json { render :show, status: :created, location: @usertag }
      else
        format.html { render :new }
        format.json { render json: @usertag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usertags/1
  # PATCH/PUT /usertags/1.json
  def update
    respond_to do |format|
      if @usertag.update(usertag_params)
        format.html { redirect_to @usertag, notice: 'Usertag was successfully updated.' }
        format.json { render :show, status: :ok, location: @usertag }
      else
        format.html { render :edit }
        format.json { render json: @usertag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usertags/1
  # DELETE /usertags/1.json
  def destroy
    @usertag.destroy
    respond_to do |format|
      format.html { redirect_to usertags_url, notice: 'Usertag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usertag
      @usertag = Usertag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usertag_params
      params.require(:usertag).permit(:user_id, :tag_id)
    end
end
