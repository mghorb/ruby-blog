FactoryBot.define do

  factory :article do
    title { 'Article x' }
    body { 'blah blah blah' }
    status { 'public' }
  end

  factory :tag do
    title { 'Cats' }
    count { 5 }
  end
end
