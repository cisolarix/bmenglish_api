class Textbook < Chapter
  default_scope { where(ancestry: nil) }
end
