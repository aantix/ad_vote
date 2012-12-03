class GoogleSearchResult < ActiveRecord::Base
  attr_accessible :title, :display_url, :redirect_url, :study_id, :description

  def self.results(query)
    items = []
    Google::Search::Web.new(:query => query).each do |item|
      items << item
    end
    items
  end

end
