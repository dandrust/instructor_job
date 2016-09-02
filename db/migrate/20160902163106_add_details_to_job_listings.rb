class AddDetailsToJobListings < ActiveRecord::Migration
  def change
    add_column :job_listings, :course, :string
    add_column :job_listings, :location, :string
    add_column :job_listings, :class_date, :date
    add_column :job_listings, :class_time, :datetime
    add_column :job_listings, :number_of_students, :integer
    add_column :job_listings, :rate, :decimal
    add_column :job_listings, :description, :text
    add_column :job_listings, :awarded_application_id, :integer
    add_column :job_listings, :needs_insurance, :boolean
    add_column :job_listings, :needs_equipment, :boolean
    add_column :job_listings, :approved, :boolean
  end
end
