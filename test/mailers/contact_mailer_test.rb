require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  #Test whether the correct information will be returned when sending the email
  test "should return contact email" do
    mail = ContactMailer.contact_email("Calvin", "calvin@gmail.com", @message = "hello")

    assert_equal ['from@example.com'], mail.to
    assert_equal ['from@example.com'], mail.from
  end

end
