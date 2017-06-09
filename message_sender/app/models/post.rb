class Post < ApplicationRecord
  include MultipleMan::Publisher
  publish fields: [:token]

  def self.make(total)
    total.times { |i| Post.create(token: i) }
  end

  def self.clean
    delete_all
  end
end
