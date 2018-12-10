class ContactMailerPreview < ActionMailer::Preview

    def contact_email
        ContactMailer.contact_email("Calvin", "calvin@gmail.com", @message = "hello")
    end

end
