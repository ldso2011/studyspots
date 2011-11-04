class AccountsController < ApplicationController

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    # Account.new não guarda os dados na base de dados.
    # Account.create guarda os dados na base de dados.
    @account = Account.new(params[:account])
    @account.account_id = UUIDTools::UUID.timestamp_create().to_s
    @account.username = @account.email.split('@')[0]
    @account.account_level = 1
    @account.account_state = 0
    @account.sex = nil
    @account.birthdate = nil
    @account.login_count = 0
    @account.unban_time = nil
    @account.expiration_time = nil
    @account.last_login = nil
    @account.last_ip = request.remote_ip
    respond_to do |format|
      if @account.save
        @profile = Profile.new
        @profile.account_id = @account.account_id
        @profile.first_name = ""
        @profile.last_name = ""
        @profile.save
        format.html { redirect_to @account, notice: t(:account) + " " + t(:createdsuccess) }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])
    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: t(:account) + " " + t(:updatedsuccess) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :ok }
    end
  end

  # GET /accounts/email/1
  # GET /accounts/email/1.json
  def email
    @account = Account.find_by_email(params[:id])
    respond_to do |format|
      format.html # email.html.erb
      format.json { render json: @account.account_id }
    end
  end

  # GET /accounts/1/join
  def join
    @account = Account.find(params[:id])
  end
  
end