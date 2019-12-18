class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, numericality: {less_than:2019}
end
