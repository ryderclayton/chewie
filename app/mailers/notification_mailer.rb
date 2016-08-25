class NotificationMailer < ActionMailer::Base
  default from: "no-reply@chewieapp.com"

  def comment_added
    mail(to: "ryder_clayton@yahoo.com",
      subject: "A comment has been added to your place.")
  end
end
