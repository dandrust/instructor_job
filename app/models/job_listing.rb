class JobListing < ActiveRecord::Base
  attr_accessible :company_name, :id, :course, :location, :class_date,
          :class_time, :number_of_students, :rate,
          :description, :needs_equipment, :needs_insurance

  validates :company_name, presence: true
  validates :course, presence: true
  validates :location, presence: true
  validates :class_time, presence: true
  validates :class_date, presence: true
  validates :number_of_students, numericality: {only_integer: true}
  validates :rate, format: {with: /\A\d{0,4}(\.\d{0,2})?\Z/}, numericality: {greater_than: 0, less_than: 10000}



end
