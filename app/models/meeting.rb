class Meeting < ActiveRecord::Base
  has_many :talks
end
