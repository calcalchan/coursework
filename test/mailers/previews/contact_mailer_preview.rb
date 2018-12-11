class ContactMailerPreview < ActionMailer::Preview

    #A method to send email with the params
    def contact_email
        ContactMailer.contact_email("Calvin", "calvin@gmail.com", @message = "hello")
    end

end
