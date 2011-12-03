class Users::ProfileController < ApplicationController
  before_filter :authenticate_user!

  # GET /profile
  # GET /profile.json
  def index
    @profile = Profile.find_by_user_id(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profile/1
  # GET /profile/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profile/new
  # GET /profile/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profile/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profile
  # POST /profile.json
  def create
    @profile = Profile.new(params[:discipline])
    @profile.profile_id = UUIDTools::UUID.timestamp_create().to_s

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: t(:discipline_successfully_created) }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profile/1
  # PUT /profile/1.json
  def update
    @profile = UsersDisciplines.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:discipline])
        format.html { redirect_to @profile, notice: t(:discipline_successfully_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/1
  # DELETE /profile/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url }
      format.json { head :ok }
    end
  end
end
