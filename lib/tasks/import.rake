namespace :import do
  desc "imports csv file and images"
  task :csv, [:filename, :image_dir] => :environment  do |t, args|
  	Importers::Csv.import(args[:filename], args[:image_dir])
  end
end