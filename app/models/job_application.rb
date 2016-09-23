class JobApplication < ActiveRecord::Base
  belongs_to :job_listing
  attr_accessible :comments, :email, :id, :job_listing_id, :name

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :job_listing_id, presence: true
  validates :name, presence: true
  validates :email, {presence: true,
                     format: {with: VALID_EMAIL_REGEX}
                    }

end
