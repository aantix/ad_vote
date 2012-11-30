class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        ContactMailer.contact_email(@contact).deliver
        format.js { }
      else
        format.js { }
      end
    end
  end
end
