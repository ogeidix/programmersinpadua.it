class Tag < ActiveRecord::Base
  has_and_belongs_to_many :talks

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(:name => name)
  end
end
