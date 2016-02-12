class ContactMailer < ApplicationMailer

	default from: "Your Mailer <noreply@yourdomain.com>"
  default to: "Fixed Gear Admin <fixedgearnation.contact@gmail.com>"

  def new_contact(contact)
    @contact = contact
    
    mail subject: "Message from #{contact.name}"
  end
end
