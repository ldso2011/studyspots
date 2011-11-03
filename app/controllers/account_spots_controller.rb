class AccountSpotsController < ApplicationController
  
  # POST /account_spots
  # POST /account_spots.json
  def create
    @account_spot = AccountSpot.new(params[:account_spot])
    @account_spot.id = UUIDTools::UUID.timestamp_create().to_s
    respond_to do |format|
      if @account_spot.save
        format.html { redirect_to @account_spot, notice: t(:account) + " " + t(:createdsuccess) }
        format.json { render json: @account_spot, status: :created, location: @account_spot }
      else
        format.html { render action: "new" }
        format.json { render json: @account_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /account_spots/1
  # GET /account_spots/1.json
  def show
    @account_spot = AccountSpot.find_all_by_spot_id (params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_spot }
    end
  end

end