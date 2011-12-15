class SpotsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!

  # GET /spots
  # GET /spots.json
  def index
    @spots = Spot.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page =>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spots }
    end
  end
  
  # GET /spots/1
  # GET /spots/1.json
  def show
    @spot = Spot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spot }
    end
  end

  # GET /spots/new
  # GET /spots/new.json
  def new
    @spot = Spot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spot }
    end
  end

  # GET /spots/1/edit
  def edit
    @spot = Spot.find(params[:id])
  end

  # POST /spots
  # POST /spots.json
  def create
    @spot = Spot.new(params[:spot])
    @spot.spot_id = UUIDTools::UUID.timestamp_create().to_s
    @spot.user_id = current_user.id

    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: t(:spot_successfully_created) }
        format.json { render json: @spot, status: :created, location: @spot }
      else
        format.html { render action: "new" }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spots/1
  # PUT /spots/1.json
  def update
    @spot = Spot.find(params[:id])

    respond_to do |format|
      if @spot.update_attributes(params[:course])
        format.html { redirect_to @spot, notice: t(:course_successfully_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :ok }
    end
  end

  private
  def sort_column
    Spot.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  protected
  def require_admin!
    unless current_user.try :admin?
      redirect_to root_path, :alert => t(:access_denied)
    end
  end
end
