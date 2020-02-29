class JobPost < ApplicationRecord
  has_many :job_post_skills, dependent: :destroy
  has_many :skills, through: :job_post_skills
  belongs_to :company

  # not optimized search
  include PgSearch::Model
  pg_search_scope(
    :search,
    against: [:title, :description],
    associated_against: { skills: :name, company: :name },
    using: {
      tsearch: {
        dictionary: 'english',
      },
    },
  )

  def self.faster_search(query)
    # protip: when using `select` instead of `pluck` we have one query less
    where(id: JobPostSearch.search(query).select(:job_post_id))
  end
end

# == Schema Information
#
# Table name: job_posts
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#
# Indexes
#
#  index_job_posts_on_company_id  (company_id)
#
