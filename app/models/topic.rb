class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :publicly_viewable, -> { where(public: true) }
  scope :visible_to, -> (user) do 
    if user
      all
    else
      publicly_viewable
    end
  end
  scope :privately_viewable, -> { where(public: false) }
  
end
