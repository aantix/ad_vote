class HomeController < ApplicationController
  def index
    @contact = Contact.new
    @users = User.all
  end
end
