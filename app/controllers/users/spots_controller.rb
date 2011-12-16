class Users::SpotsController < ApplicationController
  before_filter :authenticate_user!

  # GET /disciplines/new
  # GET /disciplines/new.json
  def new
    @userspots = UserSpots.new

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

end
