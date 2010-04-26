class RepliesController < ApplicationController
  
  before_filter :check_logged_in, :only => [:index, :edit, :update, :destroy]

require "fastercsv"

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
      redirect_to thanks_path
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
  
  def thanks
    
  end

  # def csv
  #   csv_string = FasterCSV.generate do |csv|
  #     Reply.all.each do |object|
  #       csv << object.attributes.values
  #     end
  #   end
  #   
  #   filename = "download.csv"
  #   send_data(csv_string,
  #     :type => 'text/csv; charset=utf-8; header=present',
  #     :filename => filename)
  # end
  
  def csv
     @records = Reply.all
     csv_string = FasterCSV.generate do |csv|
       csv << %w{Name Engagement Engagement_Adults Engagement_Children Wedding Wedding_Adults Wedding_Children Camping Diet Notes}
       @records.each do |line|
         csv << [
           line['name'], 
           line['engagement'],
           line['engagement_adults'],
           line['engagement_children'],
           line['wedding'],
           line['wedding_adults'],
           line['wedding_children'],
           line['camping'],
           line['diet'],
           line['notes']
           ]
       end
     end
     filename = "rsvp_download" + Time.now.strftime("%d%m%y-%H%M").to_s + ".csv"
     send_data(csv_string,
    :type => 'text/csv; charset=utf-8; header=present',
    :filename => filename)
  end
private  
  def check_logged_in
    authenticate_or_request_with_http_basic("Replies") do |username, password|
      username == "wedding" && password == "wedding"
    end    
  end
end
