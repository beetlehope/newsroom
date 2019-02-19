namespace :newsroom do
  desc "Delete outdated story ideas"
  task cleanup: :environment do
    Delayed::Job.enqueue IdeasCleanupJob.new
  end
end
