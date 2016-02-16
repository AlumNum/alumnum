class ResumeItemsController < ApplicationController
  before_action :set_resume_item, only: [:show, :edit, :update, :destroy]

  # GET /resume_items
  # GET /resume_items.json
  def index
    @resume_items = ResumeItem.all
  end

  # GET /resume_items/1
  # GET /resume_items/1.json
  def show
  end

  # GET /resume_items/new
  def new
    @resume_item = ResumeItem.new
    @resume_item.alum = current_user
  end

  # GET /resume_items/1/edit
  def edit
  end

  # POST /resume_items
  # POST /resume_items.json
  def create
    @resume_item = ResumeItem.new(resume_item_params)
    @resume_item.alum = current_user
    @profile = Profile.find(current_alum_profile_id)
    
    respond_to do |format|
      if @resume_item.save
        format.html { redirect_to edit_profile_path(@profile), notice: 'Resume item was successfully created.' }
        format.json { render :show, status: :created, location: @resume_item }
      else
        format.html { render :new }
        format.json { render json: @resume_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_items/1
  # PATCH/PUT /resume_items/1.json
  def update
    respond_to do |format|
      if @resume_item.update(resume_item_params)
        format.html { redirect_to @resume_item, notice: 'Resume item was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume_item }
      else
        format.html { render :edit }
        format.json { render json: @resume_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_items/1
  # DELETE /resume_items/1.json
  def destroy
    @resume_item.destroy
    respond_to do |format|
      format.html { redirect_to resume_items_url, notice: 'Resume item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_item
      @resume_item = ResumeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_item_params
      params.require(:resume_item).permit(:title, :heading, :start_date, :end_date, :description, :kind)
    end
end
