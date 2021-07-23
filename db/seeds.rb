require 'faker'

6.times do |i|
  Article.create(
    title: Faker::Hipster.word, 
    author: Faker::Name.name, 
    text: Faker::Hipster.paragraph(sentence_count: 3)
  )
end
