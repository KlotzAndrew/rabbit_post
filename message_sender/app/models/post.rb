class Post < ApplicationRecord
  include MultipleMan::Publisher
  publish fields: [:token]
end
