class JobPost < ApplicationRecord
  has_many :job_post_skills, dependent: :destroy
  has_many :skills, through: :job_post_skills

  belongs_to :company
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
