class Administration::DisciplinesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :require_admin!

  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = Discipline.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page =>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disciplines }
    end
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discipline }
    end
  end

  # GET /disciplines/new
  # GET /disciplines/new.json
  def new
    @discipline = Discipline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discipline }
    end
  end

  # GET /disciplines/1/edit
  def edit
    @discipline = Discipline.find(params[:id])
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(params[:discipline])
    @discipline.discipline_id = UUIDTools::UUID.timestamp_create().to_s

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: t(:discipline_successfully_created) }
        format.json { render json: @discipline, status: :created, location: @discipline }
      else
        format.html { render action: "new" }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.json
  def update
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      if @discipline.update_attributes(params[:discipline])
        format.html { redirect_to @discipline, notice: t(:discipline_successfully_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url }
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

  protected
  def require_admin!
    unless current_user.try :admin?
      redirect_to root_path, :alert => t(:access_denied)
    end
  end
end
