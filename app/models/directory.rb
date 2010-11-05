class Directory < ActiveRecord::Base
  has_attached_file :image, :styles => {:iphone => "320x206#", :iphone_thumb => "75x75#", :bb => "460x300#"}
end
