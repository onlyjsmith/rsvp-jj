class Reply < ActiveRecord::Base
  attr_accessible :name, :engagement, :engagement_adults, :engagement_children, :wedding, :wedding_adults, :wedding_children, :camping, :diet, :notes
end
