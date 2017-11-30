json.total_pages @total_pages
json.current_page @current_page

json.questions do
  json.array! @questions do |question|
    json.id question.id
    json.title question.title
    json.chapter_ids question.chapter_ids
    json.options do
      json.array! question.options do |option|
        json.id option.id
        json.content option.content
        json.correct option.correct
      end
    end
  end
end

json.chapters do
  json.array! @chapters
end
