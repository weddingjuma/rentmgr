require 'csv'

namespace :import do
  desc 'Import street names and their types from csv file to database (:name, :kind attributes)'
  task :streets, [:file] => [:environment] do |t, args|
    file = args[:file]

    CSV.foreach(file, headers: true) do |row|
      street = Street.new
      street.name = row['name']
      case row['kind']
      when 'вулиця'
        street.str!
      when 'бульвар'
        street.blvd!
      when 'провулок'
        street.lane!
      else
        street.kind = nil
      end
      street.save
    end
  end
end
