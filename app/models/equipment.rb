require 'csv'

class Equipment < ApplicationRecord
    validates :name, :description, :location, :SN, :MN, :lastpm, :presence => true

    def self.to_csv
        attributes = %w{id name description location SN MN lastpm}
        CSV.generate(headers: true) do |csv|
            csv << attributes # load the headers
            all.find_each do |equipment|
                csv << attributes.map { |attr| equipment.send(attr) } # gets the values of name, description, etc in a very concise way, see https://stackoverflow.com/questions/3337285/what-does-send-do-in-ruby
            end
        end
    end

    def self.import_from_csv(file) # alternatively use a general service, https://blog.corsego.com/import-csv-to-rails-database, or speed it up with the https://mattboldt.com/importing-massive-data-into-rails/ gem, self. makes it class method
        opened_file = File.open(file)
        options = { headers: true, col_sep: ',' }
        CSV.foreach(opened_file, **options) do |row|
            # map csv columns to AR attributes
            equipment_hash = {}
            # equipment_hash[:id] = row['id'] # not sure if this should be here, since ids are never repeated
            equipment_hash[:name] = row['name']
            equipment_hash[:description] = row['description']
            equipment_hash[:location] = row['location']
            equipment_hash[:SN] = row['SN']
            equipment_hash[:MN] = row['MN']
            equipment_hash[:lastpm] = row['lastpm']
            Equipment.find_or_create_by(equipment_hash) # Similar to PUT, if exists, leave it, it not, create it
        end
    end

end
