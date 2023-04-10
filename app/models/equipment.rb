class Equipment < ApplicationRecord
    # require title and description
    validates_presence_of :title, :description
end
