spacex = Company.create(name: 'spacex')
tesla = Company.create(name: 'tesla')

ruby_skill = Skill.create(name: 'ruby')
postgres_skill = Skill.create(name: 'postgres')

random_skills = (0...5).map { Skill.create(name: Faker::Name.last_name) }

6000.times do
  job_post = JobPost.create!(
    company: spacex,
    title: 'Senior Ruby on Rails developer',
    description: 'Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License.',
  )

  JobPostSkill.create(job_post: job_post, skill: ruby_skill)

  random_skills.each { |skill| JobPostSkill.create(job_post: job_post, skill: skill) }

  print "."
end

4000.times do
  job_post = JobPost.create!(
    company: tesla,
    title: 'Software Engineer',
    description: 'Elixir is a functional, concurrent, general-purpose programming language that runs on the Erlang virtual machine.',
  )

  JobPostSkill.create(job_post: job_post, skill: postgres_skill)
  random_skills.each { |skill| JobPostSkill.create(job_post: job_post, skill: skill) }

  print "x"
end
