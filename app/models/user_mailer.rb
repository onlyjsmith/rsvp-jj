class UserMailer < ActionMailer::Base

  def submission_confirmation(reply)
    recipients  "jonathan@impacti.org"
    cc          "jlkjones@gmail.com"
    from        "Wedding RSVP <admin@impacti.org>"
    subject     "RSVP sent from " + reply.name
    body        :reply => reply
  end

  def respondent_confirmation(reply)
    recipients  reply.email
#TODO Add multiple BCCs here, and TIDY UP THE EMAIL!
    cc         ["jonathan@impacti.org","jessica@impacti.org"]
    from        "wedding@impacti.org"
    subject     "Confirmation for Jonathan & Jessica"
    body        :reply => reply      
  end

end
