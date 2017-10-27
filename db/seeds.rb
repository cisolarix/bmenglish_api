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
