class Company < ApplicationRecord
  has_many :job_posts
end

# == Schema Information
#
# Table name: companies
#
#  id   :bigint           not null, primary key
#  name :string
#
