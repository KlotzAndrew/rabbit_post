class Post < ApplicationRecord
  include MultipleMan::Subscriber
  subscribe fields: [:token]

  def self.status
    tokens = Post.all.pluck(:token).sort
    {
      total:     tokens.count,
      duplicate: tokens.count - tokens.uniq.count,
      missing:   missing(tokens)
    }
  end

  def self.missing(tokens)
    return 0 if tokens.empty?
    (tokens.last - tokens.first + 1) - tokens.uniq.count
  end

  def self.clean
    delete_all
    status
  end
end
