class IdeasCleanupJob < ApplicationJob
  queue_as :default

  def perform
    Ideas::Cleanup.new.call
  end
end
