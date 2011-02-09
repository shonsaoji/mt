class MedPostCategoriesController < ApplicationController
  # GET /med_post_categories
  # GET /med_post_categories.xml
  def index
    @med_post_categories = MedPostCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @med_post_categories }
    end
  end

  # GET /med_post_categories/1
  # GET /med_post_categories/1.xml
  def show
    @med_post_category = MedPostCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @med_post_category }
    end
  end

  # GET /med_post_categories/new
  # GET /med_post_categories/new.xml
  def new
    @med_post_category = MedPostCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @med_post_category }
    end
  end

  # GET /med_post_categories/1/edit
  def edit
    @med_post_category = MedPostCategory.find(params[:id])
  end

  # POST /med_post_categories
  # POST /med_post_categories.xml
  def create
    @med_post_category = MedPostCategory.new(params[:med_post_category])

    respond_to do |format|
      if @med_post_category.save
        format.html { redirect_to(@med_post_category, :notice => 'MedPostCategory was successfully created.') }
        format.xml  { render :xml => @med_post_category, :status => :created, :location => @med_post_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @med_post_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /med_post_categories/1
  # PUT /med_post_categories/1.xml
  def update
    @med_post_category = MedPostCategory.find(params[:id])

    respond_to do |format|
      if @med_post_category.update_attributes(params[:med_post_category])
        format.html { redirect_to(@med_post_category, :notice => 'MedPostCategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @med_post_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /med_post_categories/1
  # DELETE /med_post_categories/1.xml
  def destroy
    @med_post_category = MedPostCategory.find(params[:id])
    @med_post_category.destroy

    respond_to do |format|
      format.html { redirect_to(med_post_categories_url) }
      format.xml  { head :ok }
    end
  end
end
