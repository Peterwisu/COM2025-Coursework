# Preview all emails at http://localhost:3000/rails/mailers/mailer_contact_mailer
class MailerContactMailerPreview < ActionMailer::Preview
    def contact_email
        MailerContactMailer.contact_email("matthew@me.com","Matthew Casey", "1234567890", @message = "Hello")
    end
end
