u = User.find_or_initialize_by(cell: '15270853389')
u.password = '000'
u.save

100.times do
  q = Question.create(
    title: Faker::Lorem.sentence,
    options_attributes: [
      { content: Faker::Lorem.words(4).join(' ') },
      { content: Faker::Lorem.words(4).join(' ') },
      { content: Faker::Lorem.words(4).join(' ') },
      { content: Faker::Lorem.words(4).join(' ') }
    ]
  )

  q.update answers: q.reload.options.pluck(:hash_id).sample(rand(4) + 1)
end

Faker::Lorem.words(10).uniq.each do |word|
  Tag.create name: word
end
