class MedPostsController < ApplicationController
before_filter :check_if_logged_in?, :except => [:index,:show,:search]

  # GET /med_posts
  # GET /med_posts.xml
  def index
		@search_for = Search_option.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @med_posts }
    end
  end

  # GET /med_posts/1
  # GET /med_posts/1.xml
  def show
    @med_post = MedPost.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @med_post }
    end
  end

  # GET /med_posts/new
  # GET /med_posts/new.xml
  def new
    @med_post = MedPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @med_post }
    end
  end

  # GET /med_posts/1/edit
  def edit
    @med_post = MedPost.find(params[:id])
  end

  # POST /med_posts/search
  # POST /med_posts/search.xml
  def search
    @search_options = Search_option.new(params[:search_for])
		@temp = 0
		if (params[:id].nil?)
			session[:search_category] = @search_options.category
			session[:search_keywords] = @search_options.keywords
			session[:search_data_valid] = true
			@temp=1
		elsif	(session[:search_data_valid])
			@search_options.category = session[:search_category]
			@search_options.keywords = session[:search_keywords]
			@temp= @temp + 3
		else
			@search_options.category = "THISISANINVALIDCATEGORY_1287623"
			@search_options.keywords = ""
			@temp= @temp + 6
		end

    @med_posts = MedPost.find(:all,
			                        :conditions => [
																               "med_post_category_id=?",
																							 @search_options.category
																						 ]
														 )
    respond_to do |format|
      format.html  #search.html.erb
      format.xml  { render :xml => @search_options }
		end
  end

  # POST /med_posts
  # POST /med_posts.xml
  def create
    @med_post = current_user.med_posts.build(params[:med_post])
		@med_category = MedPostCategory.find(@med_post.med_post_category_id)
		@med_category.med_posts << @med_post


    respond_to do |format|
      if @med_post.save
        format.html { redirect_to(:action => "show", :id => @med_post.id) }
        format.xml  { render :xml => @med_post, :status => :created, :location => @med_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @med_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /med_posts/1
  # PUT /med_posts/1.xml
  def update
    @med_post = MedPost.find(params[:id])

    respond_to do |format|
      if @med_post.update_attributes(params[:med_post])
        format.html { redirect_to(:action => "show", :id => @med_post.id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @med_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /med_posts/1
  # DELETE /med_posts/1.xml
  def destroy
    @med_post = MedPost.find(params[:id])
    @med_post.destroy

    respond_to do |format|
      format.html { redirect_to(med_posts_url) }
      format.xml  { head :ok }
    end
  end
end

class Search_option
	attr_accessor :category, :keywords

	def initialize(init=nil)
		if !init.nil?
		  @category = init[:category].to_i
		  @keywords = init[:keywords]
		else
			@category = 0
			@keywords = ""
		end
	end
end