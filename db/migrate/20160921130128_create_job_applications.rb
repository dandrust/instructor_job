class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.integer :id
      t.integer :job_listing_id
      t.string :name
      t.string :email
      t.text :comments

      t.timestamps
    end
  end
end
