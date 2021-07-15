class SearchParameter < ApplicationRecord
  belongs_to :weather_search
  belongs_to :parameter
end
