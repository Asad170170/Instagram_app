# frozen_string_literal: true

# DeleteStoryJob
class DeleteStoryJob
  include Sidekiq::Job

  def perform(*args)
    puts 'background job is running'
    u = Story.find(args.first).delete
    puts "i am background job #{u}"
  end
end
