class ContactMailer < ApplicationMailer

  #Method to send email with the params
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail cc: @email
  end
end
