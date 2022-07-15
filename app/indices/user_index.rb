ThinkingSphinx::Index.define :user, :with => :real_time do
  # fields
  indexes user.name, :sortable => true
end
