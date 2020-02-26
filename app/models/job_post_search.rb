# model for a materialized view
class JobPostSearch < ApplicationRecord
  self.primary_key = :job_post_id

  include PgSearch::Model
  pg_search_scope(
    :search,
    against: :tsv_document,
    using: {
      tsearch: {
        dictionary: 'english',
        tsvector_column: 'tsv_document',
      },
    },
  )

  def self.refresh_materialized_view
    # TODO
  end

  def readonly?
    true
  end
end

# == Schema Information
#
# Table name: job_post_searches
#
#  tsv_document :tsvector
#  job_post_id  :bigint
#
# Indexes
#
#  index_job_post_searches_on_tsv_document  (tsv_document) USING gin
#
