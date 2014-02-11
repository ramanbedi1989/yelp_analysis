class HadoopJobWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
  	`RAILS_ENV=#{Rails.env} rake hadoop:all_jobs >> log/rake_task.log 2>&1`
  end
end