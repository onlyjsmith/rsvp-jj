class Reply < ActiveRecord::Base
  attr_accessible :name, :engagement, :engagment_adults, :engagement_children, :wedding, :wedding_adults, :wedding_children, :camping, :diet, :notes
end
