require 'rubygems'
require "bundler/setup"
require 'spork'

require File.expand_path('../../config/environment', __FILE__)

require 'faker'
require 'rspec/rails'
require 'database_cleaner'

require 'vcr'

DatabaseCleaner.strategy = :truncation

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  RSpec.configure do |config|
    # == Mock Framework
    # 
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    #config.before(:suite) do
    #  DatabaseCleaner.strategy = :transaction
    #  DatabaseCleaner.clean_with(:truncation)
    #end
    #
    #config.before(:each) do
    #  DatabaseCleaner.start
    #end
    #
    #config.after(:each) do
    #  DatabaseCleaner.clean
    #end

    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, comment the following line or assign false
    # instead of true.
    #config.use_transactional_fixtures = true
  end

end

Spork.each_run do

  #FactoryGirl.find_definitions

  require 'factory_girl_rails'

  FactoryGirl.factories.clear
  FactoryGirl.reload

  $LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'models')

  Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each {|f| require f}
  #Dir["#{File.dirname(__FILE__)}/../app/models/**/*.rb"].each {|f| require f}
end