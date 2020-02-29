class AddUniqueIndexToJobPostSerches < ActiveRecord::Migration[5.2]
  def change
    add_index :job_post_searches, :job_post_id, unique: true
  end
end
