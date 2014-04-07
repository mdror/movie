class Movie < ActiveRecord::Base

 validates :title, :description, :year_released, presence: true
 validates :description, length: { minimum: 3, message: "Your description needs to be at least 4 letters" }
 validates :year_released, numericality: { greater_than_or_equal_to: 1, only_integer: true }
 #validates :numericality { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer:true }
   

  def self.search_for(query)
      where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end


end