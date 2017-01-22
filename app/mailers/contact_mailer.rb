class ContactMailer < ActionMailer::Base
  default to: "#{ENV['GMAIL_USERNAME']}@gmail.com"

  def contact_submit(msg)
    @msg = msg
    mail(from: @msg.email, name: @msg.name, message: @msg.message)
  end
end
