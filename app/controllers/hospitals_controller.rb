class HospitalsController < ApplicationController
  # GET /hospitals
  # GET /hospitals.xml
  before_filter :check_if_logged_in?
  before_filter :verify_super_user, :only => [:create, :new, :index, :add_new_account, :create_new_account]

  def index
    @hospital_accounts = Account.find(:all, :conditions => ['account_type = ?', Account::HOSPITAL])
    @hospitals = {}
    @hospital_accounts.each do |account|
      account_users = account.users.collect {|user| user.id}
      @hospitals[account.id] = Hospital.all.collect {|hospital| hospital if account_users.include?(hospital.user_id) }
    end
    puts "\n-------------------------"
    puts @hospitals.inspect
    puts "-------------------------\n"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hospitals }
    end
  end

  # GET /hospitals/1
  # GET /hospitals/1.xml
  def show
    @hospital = Hospital.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hospital }
    end
  end

  # GET /hospitals/new
  # GET /hospitals/new.xml
  def new
    puts "\n----------------------------\n"
    puts params[:account_id]
    puts "------------------------------\n"

    @account_id = params[:account_id]
    @hospital = Hospital.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hospital }
    end
  end

  # GET /hospitals/1/edit
  def edit
    @hospital = Hospital.find(params[:id])
  end

  # POST /hospitals
  # POST /hospitals.xml
  def create
    puts "\n=====================\n"
    puts params[:account_id]
    puts "=====================\n"
    ActiveRecord::Base.transaction do
      @user = User.new(:name => params[:admin_name],
                                 :email => params[:email],
                                 :user_name => params[:user_name],
                                 :password => params[:password],
                                 :password_confirmation => params[:password_confirmation] )

      @user.account_id = params[:account_id].to_i
      @user.admin = User::ADMIN
      if @user.save!
        @hospital = Hospital.new(:name => params[:hospital_name],
                                              :address => params[:address],
                                              :city  => params[:city],
                                              :state =>params[:state],
                                              :country => params[:country],
                                              :zipcode => params[:zipcode],
                                              :user_id => @user.id)
        if @hospital.save!
          redirect_to(@hospital, :notice => 'Hospital was successfully created.')
        else
         render :action => "new"
        end
      else
       render :action => "new"
      end
    end
  end

  # PUT /hospitals/1
  # PUT /hospitals/1.xml
  def update
    @hospital = Hospital.find(params[:id])

    respond_to do |format|
      if @hospital.update_attributes(params[:hospital])
        format.html { redirect_to(@hospital, :notice => 'Hospital was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hospital.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.xml
  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy

    respond_to do |format|
      format.html { redirect_to(hospitals_url) }
      format.xml  { head :ok }
    end
  end

  def add_new_account    
  end

  def create_new_account
    puts params[:account_name]
    ActiveRecord::Base.transaction do
      account = Account.new(:name => params[:account_name], :account_type => Account::HOSPITAL)
      if(account.save!)
        user = User.new(:name => params[:name],
                                 :user_name => params[:user_name],
                                :email => params[:email],
                                :password => params[:password],
                                :password_confirmation => params[:password_confirmation])
        user.account_id = account.id
        user.admin = User::ACCOUNT_ADMIN
        user.save!
      end
    end
    redirect_to :action => "index"
  end
end
