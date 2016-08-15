class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  RATINGS = {
    '1 star' => '1_star',
    '2 stars' => '2_stars',
    '3 stars' => '3_stars',
    '4 stars' => '4_stars',
    '5 stars' => '5_stars',
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end
end
