FactoryBot.define do
  factory :readme_tool do
    tool { build(:tool) }
    readme { build(:readme) }
    description { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem perferendis hic maxime asperiores! Aliquam, adipisci veritatis. Aliquid minima nihil rem nesciunt officia est perferendis asperiores. Libero sapiente recusandae repellat asperiores."}
  end
end