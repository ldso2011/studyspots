class Users::DisciplinesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!

  # GET /disciplines
  # GET /disciplines.json
  def index
    @users_disciplines = UsersDisciplines.find_all_by_user_id(current_user).paginate(:per_page => 10, :page =>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users_disciplines }
    end
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
    @users_disciplines = UsersDisciplines.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @users_disciplines }
    end
  end

  # GET /disciplines/new
  # GET /disciplines/new.json
  def new
    @users_disciplines = UsersDisciplines.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @users_disciplines }
    end
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @users_disciplines = UsersDisciplines.new(params[:users_disciplines])
    @users_disciplines.users_disciplines_id = UUIDTools::UUID.timestamp_create().to_s
    @users_disciplines.user_id = current_user.id

    respond_to do |format|
      if @users_disciplines.save
        format.html { redirect_to users_disciplines_path, notice: t(:discipline_successfully_created) }
        format.json { render json: @users_disciplines, status: :created, location: @users_disciplines }
      else
        format.html { render action: "new" }
        format.json { render json: @users_disciplines.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.json
  def update
    @users_disciplines = UsersDisciplines.find(params[:id])

    respond_to do |format|
      if @users_disciplines.update_attributes(params[:discipline])
        format.html { redirect_to @users_disciplines, notice: t(:discipline_successfully_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @users_disciplines.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @users_disciplines = UsersDisciplines.find(params[:id])
    @users_disciplines.destroy

    respond_to do |format|
      format.html { redirect_to users_disciplines_url }
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
