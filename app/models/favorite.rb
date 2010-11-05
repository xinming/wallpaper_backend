class Favorite < ActiveRecord::Base
belongs_to :user
belongs_to :news

validates :user, :presence =>true
validates :news, :presence =>true
end
