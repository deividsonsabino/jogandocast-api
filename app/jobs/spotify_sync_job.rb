class SpotifySyncJob < ApplicationJob
  queue_as :default

  def perform
    puts "Yeeeeeee"
  end
end
