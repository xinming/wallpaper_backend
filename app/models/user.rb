class User < ActiveRecord::Base
has_many :favorites
has_many :news, :through => :favorites
end
