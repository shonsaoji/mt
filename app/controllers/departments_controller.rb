class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.xml
  include DepartmentsHelper
  include ApplicationHelper

  before_filter :check_if_logged_in?

  def index
    @hospital = Hospital.find(params[:hospital_id])
    @departments = Department.find_all_by_hospital_id(@hospital.id, :order => :name)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.xml
  def show
    @department = Department.find(params[:id])
    @hospital = @department.hospital

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.xml
  def new
    redirect_to :action => "index", :hospital_id => params[:hospital_id] unless hospital_admin?(params[:hospital_id])
    @hospital = Hospital.find(params[:hospital_id])
    @department = Department.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.xml
  def create
    @department = Department.new(params[:department])
    puts "\n----------------------------"
    puts @department.hospital_id
    puts "----------------------------\n"
    if @department.save
      redirect_to :action => "index", :hospital_id => @department.hospital_id
    else
      redirect_to :action => "new", :hospital_id => @department.hospital_id
    end
  end

  # PUT /departments/1
  # PUT /departments/1.xml
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to(@department, :notice => 'Department was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.xml
  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to(departments_url) }
      format.xml  { head :ok }
    end
  end
end
