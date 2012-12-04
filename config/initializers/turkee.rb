# Go to this page https://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key
# to retrieve your AWS/Mechanical Turk access keys.
AWS_ID  = ENV['AWS_ID'] || '1Q618FTH0XDX7RR6RW82'
AWS_KEY = ENV['AWS_KEY'] || 'UBkMRPv+kgNwATyVnM8613Z9mOZ8pU2R/FbkXi23'

TURKEE_URL = Rails.env == 'production' ? "https://shielded-plains-9439.herokuapp.com" : "http://localhost:3000"

RTurk::logger.level = Logger::DEBUG

RTurk.setup(AWS_ID, AWS_KEY, :sandbox => (Rails.env == 'production' ? false : true))
