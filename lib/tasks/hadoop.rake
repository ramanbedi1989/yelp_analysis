namespace :hadoop do
	desc "Mark last fetched Yelp data"
	task mark_start_and_last_fetched_at: :environment do
		output_last_fetched = Output.order("updated_at DESC").limit(1)
		last_fetched_at = output_last_fetched.empty? ? Time.now : output_last_fetched.first.updated_at
		LastFetch.create(last_fetched_at: last_fetched_at)
		hs = HadoopStatus.first.nil? ? HadoopStatus.create : HadoopStatus.first
		hs.started = true
		hs.hdfs_to_db = false
		hs.yelp_fetcher = false
		hs.db_to_hdfs = false
		hs.save
	end

	desc "Import data from DB to HDFS"
	task db_to_hdfs: :environment do
		puts `hadoop dfs -rmr /yelpanalysis/inputs`
    	puts `sqoop import --connect jdbc:mysql://localhost/db_yelp_analysis_dev --username root --password root --table inputs --split-by id --target-dir /yelpanalysis/inputs`
		hs = HadoopStatus.first
		hs.db_to_hdfs = true
		hs.save
	end

	desc "Process yelp data on Hadoop"
	task yelp_fetcher: :environment do
		Dir.chdir("/home/raman/Documents/YelpAnalysis/YelpAnalysisHadoop/dist") do
			puts `hadoop dfs -rmr /yelpanalysis/outputs`
			puts `hadoop jar YelpAnalysisHadoop.jar YelpAnalysisHadoop /yelpanalysis/inputs /yelpanalysis/outputs`
		end
		hs = HadoopStatus.first
		hs.yelp_fetcher = true
		hs.save
	end

	desc "Export data from HDFS to DB"
	task hdfs_to_db: :environment do
    	puts `sqoop export --connect jdbc:mysql://localhost/db_yelp_analysis_dev --username root --password root --table outputs --export-dir /yelpanalysis/outputs --input-enclosed-by "\'" --input-escaped-by "\\\\" --input-fields-terminated-by "," --input-lines-terminated-by " " --enclosed-by "\'" --escaped-by "\\\\" --fields-terminated-by "," --lines-terminated-by " "`
		hs = HadoopStatus.first
		hs.hdfs_to_db = true
		hs.save
	end

	desc "Perform all jobs sequentially"
	task all_jobs: [:environment, :mark_start_and_last_fetched_at, :db_to_hdfs,:yelp_fetcher,:hdfs_to_db] do
		puts "Jobs Complete"
	end
end