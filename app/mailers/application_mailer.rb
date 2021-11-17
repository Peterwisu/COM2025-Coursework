class ApplicationMailer < ActionMailer::Base
  default to: "ws00372@surrey.ac.uk" ,from: 'from@example.com'
  layout 'mailer'
end
