class Page < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: {minimum:6, maximum:100}
    validates :description, presence: true
end
