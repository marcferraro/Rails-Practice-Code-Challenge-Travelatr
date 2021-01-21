class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        array = self.posts.reverse.first(5)
        # byebug
    end

    def most_liked_post
        post = self.posts.max_by {|post| post.likes}
    end

    def blogger_avg_age
        # byebug
        num = self.bloggers.sum do |blogger|
            blogger.age
        end

        num / self.bloggers.count
        # byebug
    end
end