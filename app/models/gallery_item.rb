class GalleryItem < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :image, :styles => {:iphone_gallery => "320x480>", :iphone_thumb => "75x75#", :bb => "480x360>", :bb_small => "320x240>"  }
end