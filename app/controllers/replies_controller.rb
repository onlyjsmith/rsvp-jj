class RepliesController < ApplicationController
  def index
    @replies = Reply.all
  end
  
  def show
    @reply = Reply.find(params[:id])
  end
  
  def new
    @reply = Reply.new
  end
  
  def create
    @reply = Reply.new(params[:reply])
    if @reply.save
      flash[:notice] = "Successfully created reply."
      redirect_to @reply
    else
      render :action => 'new'
    end
  end
  
  def edit
    @reply = Reply.find(params[:id])
  end
  
  def update
    @reply = Reply.find(params[:id])
    if @reply.update_attributes(params[:reply])
      flash[:notice] = "Successfully updated reply."
      redirect_to @reply
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    flash[:notice] = "Successfully destroyed reply."
    redirect_to replies_url
  end
end
