class Equipment < ApplicationRecord
    validates :name, :description, :location, :SN, :MN, :lastpm, :presence => true
end
