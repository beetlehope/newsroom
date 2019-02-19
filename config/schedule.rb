set :environment, :development

every 1.minute do
  rake "newsroom:cleanup"
end
