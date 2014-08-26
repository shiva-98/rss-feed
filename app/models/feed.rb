require 'rss'
require 'open-uri'
class Feed < ActiveRecord::Base
  attr_accessible :name, :feed_url

  def items  
    RSS::Parser.parse(open(feed_url).read, false).items.sort_by { |item| item.pubDate }
    .reverse!
  end
end