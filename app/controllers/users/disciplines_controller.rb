class Users::DisciplinesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!

  # GET /disciplines
  # GET /disciplines.json
  def index
    @userdisciplines = UserDisciplines.find_all_by_user_id(current_user).paginate(:per_page => 10, :page =>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @userdisciplines.to_json(:include => :discipline, :only => [:spot_id, :name, :discipline_id, :user_disciplines_id, :user_id, :acronym ]) }
    end
  end
  
  # GET /disciplines/1/spots
  # GET /disciplines/1/spots.json
  def spots
    @spots = Spot.find_all_by_discipline_id(params[:id]).paginate(:per_page => 10, :page =>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spots.to_json(:only => [:name, :spot_id, :local]) }
    end
  end

  # POST /disciplines/1/spots/2/join
  # POST /disciplines/1/spots/2/join.json
  def join
    @userspot = UserSpots.new()
    @userspot.user_spots_id = UUIDTools::UUID.timestamp_create().to_s
    @userspot.spot_id = params[:id2]
    @userspot.user_id = current_user.id

    respond_to do |format|
      if @userspot.save
        format.html { redirect_to users_disciplines_path, notice: t(:discipline_successfully_created) }
        format.json { render json: @userspot, status: :created, location: @userspot }
      else
        format.html { render action: "new" }
        format.json { render json: @userspot.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /disciplines/1/spots/2/leave
  # POST /disciplines/1/spots/2/leave.json
  def leave
    @userspot = UserSpots.find_by_user_id(current_user.id)
    if @userspot != nil
      @spot = Spot.find_by_spot_id(@userspot.spot_id)
    end
    
    respond_to do |format|
      if @userspot.destroy
        @usersin = UserSpots.count(:all, :conditions =>["spot_id = ?", @spot.spot_id])
        if @usersin == 0
          @spot.destroy
        end
        format.html { redirect_to users_disciplines_path, notice: t(:discipline_successfully_created) }
        format.json { render json: @userspot, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @userspot.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /disciplines/1/show
  # GET /disciplines/1/show.json
  def show
    @discipline = Discipline.find(params[:id])
    @walldiscipline = WallDisciplines.find_all_by_discipline_id(params[:id], :limit=> 10, :order => "updated_at DESC")
   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@discipline, @walldiscipline] }
    end
  end

  # GET /disciplines/new
  # GET /disciplines/new.json
  def new
    @userdisciplines = UserDisciplines.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @userdisciplines }
    end
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @userdisciplines = UserDisciplines.new(params[:user_disciplines])
    @userdisciplines.user_disciplines_id = UUIDTools::UUID.timestamp_create().to_s
    @userdisciplines.user_id = current_user.id

    respond_to do |format|
      if @userdisciplines.save
        format.html { redirect_to users_disciplines_path, notice: t(:discipline_successfully_created) }
        format.json { render json: @userdisciplines, status: :created, location: @userdisciplines }
      else
        format.html { render action: "new" }
        format.json { render json: @userdisciplines.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.json
  def update
    @userdisciplines = UserDisciplines.find(params[:id])

    respond_to do |format|
      if @userdisciplines.update_attributes(params[:discipline])
        format.html { redirect_to @userdisciplines, notice: t(:discipline_successfully_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @userdisciplines.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @userdisciplines = UserDisciplines.find(params[:id])
    @userdisciplines.destroy

    respond_to do |format|
      format.html { redirect_to users_disciplines_path }
      format.json { head :ok }
    end
  end

  private
  def sort_column
    Course.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
