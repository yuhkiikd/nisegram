class ApplicationMailer < ActionMailer::Base
  default from: "Nisegram",
          bcc: "yuhki.ikd@gmail.com",
          reply_to: "yuhki.ikd@gmail.com"
  layout 'mailer'
end
