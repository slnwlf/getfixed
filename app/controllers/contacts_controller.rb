class ContactsController < ApplicationController

	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      contactMailer.new_contact(@contact).deliver
      redirect_to contact_path, notice: "Your contacts has been sent."
    else
      flash[:alert] = "An error occurred while delivering this contact."
      render :new
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end
