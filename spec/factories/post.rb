FactoryBot.define  do
  factory :post do
    association :account
    title {FFaker::Book.title}
    image {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.png'))}

    trait(:with_invalid_image) do
      image  {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/first.txt'))}
    end
  end
end