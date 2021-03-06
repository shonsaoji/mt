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
    
    if params[:hospital_id]
      @hospital = Hospital.find(params[:hospital_id]) 
      h_departments = @hospital.departments
      p_departments = @medical_procedure.departments
      p_departments.each do |procedure_dept|
        @deparment = h_departments.include?(procedure_dept)  
      end
    else
      @department = Department.find(params[:department_id])
      @hospital = @department.hospital 
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
    @department = Department.find(params[:department_id])

    if @medical_procedure.save
      @department_medical_procedure = DepartmentsMedicalProcedure.new
      @department_medical_procedure.medical_procedure_id = @medical_procedure.id
      @department_medical_procedure.department_id = @department.id
      @department.medical_procedures << @medical_procedure
      redirect_to :action => "index", :hospital_id => @department.hospital.id
      flash[:notice] = 'MedicalProcedure was successfully created.'

    else
      render :action => "new", :hospital_id => @department.hospital.id
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

  