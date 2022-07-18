# frozen_string_literal: true

# DeleteStoryJob
class DeleteStoryJob
  include Sidekiq::Job

  def perform(*args)
    Rails.logger.debug 'background job is running'
    u = Story.find(args.first).delete
    Rails.logger.debug "i am background job #{u}"
  end
end
