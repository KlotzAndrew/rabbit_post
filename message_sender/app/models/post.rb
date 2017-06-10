class Post < ApplicationRecord
  include MultipleMan::Publisher
  publish fields: [:token]

  def self.rain(total)
    make(total)

    { total_created: Post.count }
  end

  def self.rain_for(seconds, per_second = 1)
    total = seconds * per_second
    total.times do |i|
      Post.create(token: i)
      puts "#{i}/#{total}"
      sleep((1.0 / per_second))
    end

    { total_created: Post.count }
  end

  def self.make(total)
    total.times { |i| Post.create(token: i) }
  end
end
