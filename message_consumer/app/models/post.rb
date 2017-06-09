class Post < ApplicationRecord
  include MultipleMan::Subscriber
  subscribe fields: [:token]
end
