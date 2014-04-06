class Movie < ActiveRecord::Base


 validates :title, :description, :year_released, :rating, presence: true
 validates :description, length: { minimum: 10, message: "Your description needs to be at least 10 letters" }
 validates :year_released, numericality: { greater_than_or_equal_to: 0, only_integer: true }
 validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer:true }
 
end
    

def self.search_for(query)
        where('name LIKE :query OR description LIKE :query', query: "%#{query}%")
end

