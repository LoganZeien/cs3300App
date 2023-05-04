require 'csv'
require 'tempfile'

module ModuleMacros
    def create_csv(object, attributes) # a simple macro to convert an object to a csv file for testing
        temp_file = Tempfile.new(['temp_csv', '.csv'])
        CSV.open(temp_file.path, 'w+', headers: true) do |csv|
          csv << attributes # load the headers
          csv << attributes.map { |attr| object.send(attr) } # gets the values of name, description, etc in a very concise way, see https://stackoverflow.com/questions/3337285/what-does-send-do-in-ruby
        end
        return temp_file.path
    end
end
  