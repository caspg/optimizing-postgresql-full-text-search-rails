# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_29_143615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
  end

  create_table "job_post_skills", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "job_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_post_id"], name: "index_job_post_skills_on_job_post_id"
    t.index ["skill_id"], name: "index_job_post_skills_on_skill_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_posts_on_company_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_view "job_post_searches", materialized: true, sql_definition: <<-SQL
      SELECT job_posts.id AS job_post_id,
      (((to_tsvector('english'::regconfig, (COALESCE(job_posts.title, ''::character varying))::text) || to_tsvector('english'::regconfig, COALESCE(job_posts.description, ''::text))) || to_tsvector('english'::regconfig, (COALESCE(companies.name, ''::character varying))::text)) || to_tsvector('english'::regconfig, COALESCE(string_agg((skills.name)::text, ' ; '::text), ''::text))) AS tsv_document
     FROM (((job_posts
       JOIN companies ON ((companies.id = job_posts.company_id)))
       JOIN job_post_skills ON ((job_post_skills.job_post_id = job_posts.id)))
       JOIN skills ON ((skills.id = job_post_skills.skill_id)))
    GROUP BY job_posts.id, companies.id;
  SQL
  add_index "job_post_searches", ["job_post_id"], name: "index_job_post_searches_on_job_post_id", unique: true
  add_index "job_post_searches", ["tsv_document"], name: "index_job_post_searches_on_tsv_document", using: :gin

end
