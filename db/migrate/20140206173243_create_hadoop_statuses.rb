class CreateHadoopStatuses < ActiveRecord::Migration
  def change
    create_table :hadoop_statuses do |t|
      t.boolean :started
      t.boolean :db_to_hdfs
      t.boolean :yelp_fetcher
      t.boolean :hdfs_to_db

      t.timestamps
    end
  end
end
