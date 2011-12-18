class Users::WallDisciplinesController < ApplicationController
  before_filter :authenticate_user!

  # GET /disciplines/1/comments/new
  # GET /disciplines/1/comments/new.json
  def new
    @walldisciplines = WallDisciplines.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @walldisciplines }
    end
  end

  # POST /disciplines/1/comments
  # POST /disciplines/1/comments.json
  def create
    @walldisciplines = WallDisciplines.new(params[:wall_disciplines])
    @walldisciplines.wall_disciplines_id = UUIDTools::UUID.timestamp_create().to_s
    @walldisciplines.user_id = current_user.id
    @walldisciplines.discipline_id = params[:id]

    respond_to do |format|
      if @walldisciplines.save
        format.html { redirect_to users_disciplines_path, notice: t(:discipline_successfully_created) }
        format.json { render json: @walldisciplines, status: :created, location: @walldisciplines }
      else
        format.html { render action: "new" }
        format.json { render json: @walldisciplines.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1/comments/2/delete
  # DELETE /disciplines/1/comments/2/delete.json
  def destroy
    @walldisciplines = WallDisciplines.find(params[:wall_disciplines_id])
    @walldisciplines.destroy

    respond_to do |format|
      format.html { redirect_to users_disciplines_path }
      format.json { head :ok }
    end
  end

end
