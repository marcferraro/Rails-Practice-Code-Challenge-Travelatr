class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30}

    def most_liked_post
        post = self.posts.max_by {|post| post.likes}
    end

    def total_likes
        num = self.posts.sum do |post|
            post.likes
        end

        num
    end

    def most_written_location
        location_objects_array = self.posts.map do |post|
            post.destination
        end


        location_names_array = location_objects_array.map do |location|
            location.name
        end

        name_string = location_names_array.max_by {|location| location_names_array.count(location)}
        
        Destination.all.find_by(name: name_string)
    end

end
