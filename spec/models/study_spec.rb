require 'spec_helper'

describe Study do
  describe "#import_competing_ads" do

    before do
      @user = Factory(:user)
    end

    it "imports ads" do
      VCR.use_cassette('cat_food_ads') do
        Ad.import_competing_ads(@user, "cat food")

        ap Ad.all

        Ad.count.should == 8

        ad = Ad.first
        ad.headline.should == 'Buy Cat Food - Sale'
        ad.description1.should == 'Free Shipping on Orders $49+,'
        ad.description2.should == 'Order Cat Food Online Now!'
        ad.display_url.should == 'www.petfooddirect.com/Cat_Food'
      end
    end
  end

  describe "#import_ad_file" do
    before do
      @user  = Factory(:user)
      @study = Factory(:study, :user => @user)

      AdFileUploader.enable_processing = true
      @uploader = AdFileUploader.new(@study, :ad_file)
      @uploader.store!(File.open("#{Rails.root}/data/cats.csv"))
    end

    it "imports ads from csv" do
      @study.import_ad_file
      @study.ads.size.should == 7
    end
  end

  describe "#import_search_results" do
    before do
      @user  = Factory(:user)
      @study = Factory(:study, :user => @user)
    end

    it "imports ads from csv" do
      VCR.use_cassette('cat_food_search') do
        @study.import_search_results
      end

      @study.google_search_results.size.should == 64
      search_result = @study.google_search_results.first
      search_result.title.should =~ /public class MyString/
    end
  end
end
