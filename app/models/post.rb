class Post < ApplicationRecord

    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true
    validates :content, length: { minimum: 100}

    def destination_name
        self.destination.name
    end

    def blogger_name
        self.blogger.name
    end
end
