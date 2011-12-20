class Users::ProfileController < ApplicationController
  before_filter :authenticate_user!

  # GET /profile
  # GET /profile.json
  def index
    @temp_profile = Profile.find_by_user_id(current_user)
    if @temp_profile != nil
      if @temp_profile.year == 0
        redirect_to edit_users_profile_path
      else
        @profile = Profile.find_by_user_id(current_user)
        if UserSpots.find_by_user_id(current_user.id) != nil
          @myspot = (Spot.find_by_spot_id(UserSpots.find_by_user_id(current_user.id).spot_id))
        end
        respond_to do |format|
        format.html # index.html.erb
        format.json { render json: [@profile, @myspot]}
        end
      end
    else
      redirect_to new_users_profile_path
    end
    
  end

  # GET /profile/1
  # GET /profile/1.json
  def show
    @profile = Profile.find_by_user_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile.to_json(:include => [:faculty, :course]) }
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
    if UserSpots.find_by_user_id(current_user.id) != nil
      @myspot = (Spot.find_by_spot_id(UserSpots.find_by_user_id(current_user.id).spot_id))
    end
  end

  # POST /profile
  # POST /profile.json
  def create
    @profile = Profile.new(params[:profile])
    @profile.profile_id = UUIDTools::UUID.timestamp_create().to_s
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to users_profile_index_path, notice: t(:profile_successfully_created) }
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
    #@profile = UsersDisciplines.find(params[:id])
    @profile = Profile.find_by_user_id(current_user.id)
 
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to users_profile_index_path, notice: t(:profile_successfully_updated) }
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
