class JobApplication < ActiveRecord::Base
  belongs_to :job_listing
  attr_accessible :comments, :email, :id, :job_listing_id, :name

  validates :job_listing_id, presence: true
  validates :name, presence: true
  validates :email, presence: true

end
