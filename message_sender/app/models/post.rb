class Post < ApplicationRecord
  include MultipleMan::Publisher
  publish fields: [:token]

  def self.rain(total)
    make(total)

    { total_created: Post.count }
  end

  def self.make(total)
    total.times { |i| Post.create(token: i) }
  end
end
