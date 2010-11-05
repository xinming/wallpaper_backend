class News < ActiveRecord::Base
belongs_to :news_category

has_many :favorites
has_many :users, :through => :favorites

has_attached_file :news, :styles => {:iphone => "320x206#", :iphone_thumb => "75x75#", :bb => "460x300#"}
end


# 196 width max 