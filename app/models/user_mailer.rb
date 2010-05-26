class UserMailer < ActionMailer::Base

  def submission_confirmation(reply)
    recipients  "jonathan@impacti.org"
    from        "admin@impacti.org"
    subject     "RSVP sent from " + reply.name
    body        :reply => reply
  end

end
