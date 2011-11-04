class SpotsController < ApplicationController

  # GET /spots
  # GET /spots.json
  def index
    @spots = Spot.all
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
    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: t(:spot) + " " + t(:createdsuccess) }
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
      if @spot.update_attributes(params[:account])
        format.html { redirect_to @spot, notice: t(:spot) + " " + t(:updatedsuccess) }
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
      format.html { redirect_to accounts_url }
      format.json { head :ok }
    end
  end

  # GET /spots/owner/1
  # GET /spots/owner/1.json
  def owner
    @spots = Spot.find_all_by_owner_id (params[:id])
    respond_to do |format|
      format.html # owner.html.erb
      format.json { render json: @spots }
    end
  end
  
  # GET /spots/joined/1
  # GET /spots/joined/1.json
  def joined
    @spots = AccountSpot.find_all_by_account_id (params[:id])
    respond_to do |format|
      format.html # joined.html.erb
      format.json { render json: @spots }
    end
  end

  # GET /spots/join
  # GET /spots/join.json
  def join
    @account_spot = AccountSpot.new
    respond_to do |format|
      format.html # join.html.erb
      format.json { render json: @account_spot }
    end
  end

  # GET /spots/1/inspot
  # GET /spots/1/inspot.json
  def inspot
    @accounts = Account.find_all_by_spot_id (params[:id])
    respond_to do |format|
      format.html # inspot.html.erb
      format.json { render json: @accounts }
    end
  end

end