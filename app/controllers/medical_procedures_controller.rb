class MedicalProceduresController < ApplicationController
  # GET /medical_procedures
  # GET /medical_procedures.xml
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @medical_procedures = @hospital.get_all_procedures 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medical_procedures }
    end
  end

  # GET /medical_procedures/1
  # GET /medical_procedures/1.xml
  def show
    @medical_procedure = MedicalProcedure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medical_procedure }
    end
  end

  # GET /medical_procedures/new
  # GET /medical_procedures/new.xml
  def new
    @medical_procedure = MedicalProcedure.new
    @hospital = Hospital.find(params[:hospital_id].to_i) if params[:hospital_id] 
    @department = Department.find(params[:department].to_i) if params[:department]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medical_procedure }
    end
  end

  # GET /medical_procedures/1/edit
  def edit
    @medical_procedure = MedicalProcedure.find(params[:id])
  end

  # POST /medical_procedures
  # POST /medical_procedures.xml
  def create
    @medical_procedure = MedicalProcedure.new(params[:medical_procedure])

    respond_to do |format|
      if @medical_procedure.save
        format.html { redirect_to(@medical_procedure, :notice => 'MedicalProcedure was successfully created.') }
        format.xml  { render :xml => @medical_procedure, :status => :created, :location => @medical_procedure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medical_procedure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medical_procedures/1
  # PUT /medical_procedures/1.xml
  def update
    @medical_procedure = MedicalProcedure.find(params[:id])

    respond_to do |format|
      if @medical_procedure.update_attributes(params[:medical_procedure])
        format.html { redirect_to(@medical_procedure, :notice => 'MedicalProcedure was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medical_procedure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_procedures/1
  # DELETE /medical_procedures/1.xml
  def destroy
    @medical_procedure = MedicalProcedure.find(params[:id])
    @medical_procedure.destroy

    respond_to do |format|
      format.html { redirect_to(medical_procedures_url) }
      format.xml  { head :ok }
    end
  end
  
  def department_procedures
    @department = Department.find(params[:department])
    @hospital = @department.hospital
    @medical_procedures = @department.medical_procedures 
  end

end

  