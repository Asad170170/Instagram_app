# frozen_string_literal: true

StoryPolicy = Struct.new(:user, :record) do
  def index?
    user.id == record.user_id
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end
end
