class Talk < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting

  def user=(u)
    if u.is_a? User
      write_attribute(:user_id, u.id)
    else
      new_user = User.find_by_name(u.to_s) || User.create(:name => u.to_s)
      write_attribute(:user_id, new_user.id)
    end
  end

end
