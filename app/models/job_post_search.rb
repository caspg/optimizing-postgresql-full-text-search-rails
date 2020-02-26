# model for a materialized view
class JobPostSearch < ApplicationRecord
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
