class Page < ActiveRecord::Base
    validates :title, presence: true, length: {minimum:6, maximum:100}
    validates :description, presence: true
end
