class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json

  def find_by_user
    user_id = params[:id]
    @profile = Profile.find_by :user_id => user_id
    redirect_to "/profiles/#{@profile.id}"
  end

  def index
    @profiles = Profile.all
    @users = User.all
    @resumes = ResumeItem.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile.view_count +=1
    @profile.save
    @alum = @profile.alum
    this_user_id = @profile.user_id


    @resume = ResumeItem.where user_id: this_user_id
    @qnas = Qna.where user_id: this_user_id
  
    @usertags = Usertag.where user_id: this_user_id

    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, filter_html: true)

  end

  # GET /profiles/new
  def new
    @profile = Profile.new

    @profile.alum = current_user


  end

  # GET /profiles/1/edit
  def edit
    @qnas = Qna.where(:user_id => current_user)
    @resume = ResumeItem.where user_id: current_user
    @usertags = Usertag.where user_id: current_user

  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.alum = current_user
    #byebug
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:headline, :image_url, :bio, :view_count, :status, :twitter, :github, :personal_site, :linkedin, :image, :attachment)
    end
end
