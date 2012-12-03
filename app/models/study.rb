require "csv"

class Study < ActiveRecord::Base
  validates :name, :presence => {:message => " cannot be blankx"}
  validates :query, :presence => {:message => " cannot be blanky"}
  validates :ad_file, :presence => {:message => " cannot be blankz"}

  attr_accessible :name, :query, :ad_file

  belongs_to :user
  has_many :ads
  has_many :google_search_results

  mount_uploader :ad_file, AdFileUploader

  ATTR_NAMES = {:query => "Search terms", :ad_file => 'Test ads'}

  def self.human_attribute_name(attr, options = {})
     ATTR_NAMES[attr.to_sym] || super(attr)
  end

  def import_competing_ads
    scraped_ads = AdwordsScraper.start(query)

    scraped_ads.each do |ad|
      ads.create!(:headline     => ad['Title'],
                  :description1 => ad['Description1'],
                  :description2 => ad['Description2'],
                  :display_url  => ad['URL'],
                  :user_created => false)
    end
  end

  def import_ad_file
    CSV.foreach(ad_file.current_path, :headers => true) do |line|
      ads.create!(line.to_hash.merge(:user_created => true))
    end
  end

  def import_search_results
    results = GoogleSearchResult.results(query)

    results.each do |result|
      google_search_results.create!(:display_url  => result.visible_uri,
                                    :redirect_url => result.uri,
                                    :description  => result.content,
                                    :title        => result.title)
    end
  end

end
