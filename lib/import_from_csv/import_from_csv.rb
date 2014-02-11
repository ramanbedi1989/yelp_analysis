require 'csv'
class ImportFromCsv
	def csv_import(filename,data)
		file = File.read(filename)
		csv = CSV.parse(file, headers: true)
		csv.each do |row|
			Input.create(url: row[data[:url]], name: row[data[:name]])
		end
	end
end