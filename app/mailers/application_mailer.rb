class ApplicationMailer < ActionMailer::Base
  default from: 'confirm@qwiki.io'
  layout 'mailer'
end
