class MedRepliesController < ApplicationController
  # GET /med_replies
  # GET /med_replies.xml
  def index
    @med_replies = MedReply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @med_replies }
    end
  end

  # GET /med_replies/1
  # GET /med_replies/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @med_reply }
    end
  end

  # GET /med_replies/new
  # GET /med_replies/new.xml
  def new
    @med_reply = MedReply.new
		@med_reply.med_post_id = params[:id].to_i
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @med_reply }
    end
  end

  # GET /med_replies/1/edit
  def edit
    @med_reply = MedReply.find(params[:id])
  end

  # POST /med_replies
  # POST /med_replies.xml
  def create

		@med_reply = current_user.med_replies.build(params[:med_reply])
		@med_post = MedPost.find(@med_reply.med_post_id)
		@med_post.med_replies << @med_reply
		
    respond_to do |format|
      if @med_reply.save
        format.html { redirect_to(:controller => "med_posts", :action => "show", :id => @med_post.id) }
        format.xml  { render :xml => @med_reply, :status => :created, :location => @med_reply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @med_reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /med_replies/1
  # PUT /med_replies/1.xml
  def update
    @med_reply = MedReply.find(params[:id])

    respond_to do |format|
      if @med_reply.update_attributes(params[:med_reply])
        format.html { redirect_to(:controller => "med_posts", :action => "show", :id => @med_reply.med_post_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @med_reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /med_replies/1
  # DELETE /med_replies/1.xml
  def delete
    @med_reply = MedReply.find(params[:id])
    @med_post = @med_reply.med_post_id
		@med_reply.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "med_posts", :action => "show", :id => @med_post) }
      format.xml  { head :ok }
    end
  end
end
