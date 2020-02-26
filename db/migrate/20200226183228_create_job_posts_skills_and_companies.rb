class CreateJobPostsSkillsAndCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
    end

    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.belongs_to :company

      t.timestamps
    end

    create_table :skills do |t|
      t.string :name

      t.timestamps
    end

    create_table :job_post_skills do |t|
      t.belongs_to :skill
      t.belongs_to :job_post

      t.timestamps
    end
  end
end
