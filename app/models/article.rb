class Article < ActiveRecord::Base
    validates :title, presence: true, length: {minimum:6, maximum:100}
    validates :decription, presence: true
end
