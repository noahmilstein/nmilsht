class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.contact_submit(@contact).deliver
      flash[:notice] = "Thank you for your email, I'll respond shortly"
      redirect_to new_contact_path
    else
      render :new
    end
  end
end
