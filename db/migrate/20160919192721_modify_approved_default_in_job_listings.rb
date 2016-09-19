class ModifyApprovedDefaultInJobListings < ActiveRecord::Migration
  def change
    change_column_default :job_listings, :approved, false
  end
end
