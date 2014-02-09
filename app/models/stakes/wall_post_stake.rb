class WallPostStake < ActiveRecord::Base
  belongs_to :stake

  def post
    @user = self.stake.achievment.user
    @graph = Koala::Facebook::API.new(@user.fb_token)
    @graph.put_wall_post(self.stake_str)
  end
end
