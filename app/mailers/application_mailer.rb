class ApplicationMailer < ActionMailer::Base
  default to: "from@example.com", from: "from@example.com"
  layout 'mailer'

end
