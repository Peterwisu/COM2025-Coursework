# Preview all emails at http://localhost:3000/rails/mailers/mailer_contact_mailer
class MailerContactMailerPreview < ActionMailer::Preview
    def contact_email
        MailerContactMailer.contact_email("peterwisu@gmail.com","Peter Wish", "1234567890", @message = "Hello I'm Peter")
    end
end
