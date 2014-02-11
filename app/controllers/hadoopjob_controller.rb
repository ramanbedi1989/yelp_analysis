class HadoopjobController < ApplicationController
  def index
  	@all_inputs = Input.all
  end

  def status
  	@hadoop_status = HadoopStatus.first.nil? ? HadoopStatus.create : HadoopStatus.first
  	if @hadoop_status &&  !@hadoop_status.started && !request.xhr?
  		HadoopJobWorker.perform_async
  	end
  	respond_to do |format|
  		format.js
  		format.html
  	end
  end

  def data_fetched
  	@output_columns = Output.columns.map(&:name)
  	@output_data = Output.where('updated_at > ?',LastFetch.last.last_fetched_at)
  end
end
