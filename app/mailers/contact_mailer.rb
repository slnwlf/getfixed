class ContactMailer < ApplicationMailer

	default from: "Your Mailer <noreply@yourdomain.com>"
  default to: "Fixed Gear Admin <fixedgearnation.contact@gmail.com>"

  def new_contact(contact)
    @contact = contact
    
    mail(:name => "#{contact.name}")
  end
end
