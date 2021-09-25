FactoryBot.define do
  factory :readme do
    staging_url { "https://www.mangotree-staging.dev" }
    production_url { "https://www.mangotree.dev" }
    repository_url { "https://github.com/nicoproto/readme-generator.git" }
    keys_required { false }
    user { build(:user) }
  end
end