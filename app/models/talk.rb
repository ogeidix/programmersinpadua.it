class Talk < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting
  has_and_belongs_to_many :tags

  def user=(u)
    if u.is_a? User
      write_attribute(:user_id, u.id)
    else
      new_user = User.find_by_name(u.to_s) || User.create(:name => u.to_s)
      write_attribute(:user_id, new_user.id)
    end
  end
  
  
  def tag_list
    self.tags.join(', ')
  end

  def tag_list(list)
    self.tag = list.split(',').map { |i| Tag.find_or_create_by_name i.strip }
  end
end
