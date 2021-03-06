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
    if current_user.type == 'Alum'
      @usertag.alum = current_user
       @profile = Profile.find(current_alum_profile_id)
    else
      @usertag.employer = current_user
    end  
    respond_to do |format|
      if @usertag.save
        #when a tag is added to Alum account
        #byebug
        if current_user.type == 'Alum'
          #get all Usertags that have the tag_id of the tag being created
          findTags = Usertag.where :tag_id => @usertag.tag_id
          #iterate through each usertag and get user type
          findTags.each do |tag|
            #find user that usertag belongs to
            usertype = User.find(tag.user_id)
            #if the user is an employer, send them an email
            if usertype.type == 'Employer'
              UserMailer.alert_email(usertype, current_user).deliver
            end  
          end
          format.html { redirect_to edit_profile_path(@profile), notice: 'Tag was successfully created.' }
        else
          format.html { redirect_to "/", notice: 'Tag was successfully created.' }
        end
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
    if current_user.type == "Alum"
      @profile = Profile.find(current_alum_profile_id)
      respond_to do |format|
        format.html { redirect_to edit_profile_path(@profile), notice: 'Usertag was successfully destroyed.' }
        format.json { head :no_content }
      end
      else
      respond_to do |format|
        format.html { redirect_to "/", notice: 'Usertag was successfully destroyed.' }
        format.json { head :no_content }
      end
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