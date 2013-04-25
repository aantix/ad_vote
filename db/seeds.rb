puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Admin', :email => 'admin@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << user.name
user.add_role :admin
