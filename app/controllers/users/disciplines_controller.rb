class Users::DisciplinesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!

  # GET /disciplines
  # GET /disciplines.json
  def index
    @userdisciplines = UserDisciplines.find_all_by_user_id(current_user).paginate(:per_page => 10, :page =>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @userdisciplines.to_json(:include => :discipline, :only => [:name, :discipline_id, :user_disciplines_id, :user_id, :acronym ]) }
    end
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
    @userdisciplines = UserDisciplines.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @userdisciplines }
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
      format.html { redirect_to user_disciplines_url }
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
