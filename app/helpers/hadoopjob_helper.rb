module HadoopjobHelper
  def mark_complete_hadoop_job(hadoop_status)
    hadoop_status.started = false
    hadoop_status.save
  end
end
