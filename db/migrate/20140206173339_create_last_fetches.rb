class CreateLastFetches < ActiveRecord::Migration
  def change
    create_table :last_fetches do |t|
      t.datetime :last_fetched_at

      t.timestamps
    end
  end
end
