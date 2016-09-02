class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.integer :id
      t.string :company_name

      t.timestamps
    end
  end
end
