require 'test_helper'

class MailerContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return contact email" do
    mail = MailerContactMailer.contact_email("matthew@me.com",
    "Matthew Casey", "1234567890", @message = "Hello")
    assert_equal ['ws00372@surrey.ac.uk'], mail.to
    assert_equal ['from@example.com'], mail.from
    end
end
