class AddReleaseDateToEpisode < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :release_date, :date
  end
end
