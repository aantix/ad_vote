class ContactMailer < ActionMailer::Base
  def contact_email(contact)
    @contact = contact
    from     = contact.name.present? ? "#{contact.name} <#{contact.email}>" : contact.email

    mail(from: from,
         body: contact.body,
         to:   "jim.jones1@gmail.com",
         subject: "Jim Jones, Rails Engineer. Contact Form Submission") do |format|

      format.text

    end
  end
end
