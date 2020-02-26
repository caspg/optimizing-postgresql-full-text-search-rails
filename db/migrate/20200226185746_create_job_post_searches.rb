class CreateJobPostSearches < ActiveRecord::Migration[5.2]
  def change
    create_view :job_post_searches, materialized: true
    add_index :job_post_searches, :tsv_document, using: :gin
  end
end
