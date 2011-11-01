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

end