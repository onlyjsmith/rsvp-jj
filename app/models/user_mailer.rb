class UserMailer < ActionMailer::Base

  def submission_confirmation(reply)
    recipients  "jonathan@impacti.org"
    cc          "jlkjones@gmail.com"
    from        "Wedding RSVP <admin@impacti.org>"
    subject     "RSVP sent from " + reply.name
    body        :reply => reply
  end

end
